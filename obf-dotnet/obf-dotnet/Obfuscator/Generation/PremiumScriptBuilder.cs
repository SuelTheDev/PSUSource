﻿using System;
using System.Linq;
using System.Reflection;
using System.Diagnostics;

using System.Collections;
using System.Collections.Generic;

using Obfuscator;
using Obfuscator.Extensions;
using Obfuscator.Utility;

using Obfuscator.Bytecode;
using Obfuscator.Bytecode.IR;

using Obfuscator.Obfuscation;
using Obfuscator.Obfuscation.OpCodes;

using System.Text;
using System.Text.RegularExpressions;

using System.IO;

using Loretta;
using Loretta.Lexing;

using Loretta.Parsing;
using Loretta.Parsing.Visitor;

using GParse;
using GParse.Collections;
using GParse.Lexing;

namespace Obfuscator.Obfuscation.Generation
{
    public class PremiumScriptBuilder
    {
        private static Random Random = new Random();
        public static Encoding LuaEncoding = Encoding.GetEncoding(28591);

        //////////////////////////////////////////////////

        private Chunk HeadChunk;
        private ObfuscationContext ObfuscationContext;
        private ObfuscationSettings ObfuscationSettings;
        private List<VOpCode> Virtuals;

        //////////////////////////////////////////////////

        private string Variables;

        private string Functions;

        private string Deserializer;

        private string VM;

        //////////////////////////////////////////////////

        public class Expression { public dynamic Data; public List<string> Indicies = new List<string>(); };
       
        private List<Expression> Expressions = new List<Expression>();
        private Dictionary<dynamic, Expression> ExpressionMap = new Dictionary<dynamic, Expression>();

        private List<Expression> NumberExpressions = new List<Expression>();
        private Dictionary<long, Expression> NumberExpressionMap = new Dictionary<long, Expression>();

        private List<dynamic> UsedIndicies = new List<dynamic>();
        private List<string> GenerateIndicies() { if (Random.Next(0, 2) == 0) { long Index = Random.Next(0, 1000000000); while (UsedIndicies.Contains(Index)) { Index = Random.Next(0, 1000000000); }; UsedIndicies.Add("[" + Index + "]"); return (new List<string> { "[" + Index + "]" }); } else { List<string> Indicies = Utility.Utility.GetIndexList(); while (UsedIndicies.Contains(Indicies.First())) { Indicies = Utility.Utility.GetIndexList(); }; foreach (string Index in Indicies) { UsedIndicies.Add(Indicies.First()); }; return (Indicies); }; }
        private long GenerateNumericIndex() { long Index = Random.Next(0, 1000000000); while (UsedIndicies.Contains(Index)) { Index = Random.Next(0, 1000000000); }; UsedIndicies.Add("[" + Index + "]"); return (Index); }

        private Expression AddExpression(dynamic Value)
        {
            if (ExpressionMap.ContainsKey(Value)) { return (ExpressionMap[Value]); };

            Expression Expression = new Expression();
            Expression.Data = Value;
            Expression.Indicies = GenerateIndicies();

            if (Value is long) { NumberExpressions.Add(Expression); NumberExpressionMap[Value] = Expression; };

            Expressions.Add(Expression);
            ExpressionMap[Value] = Expression;

            return (Expression);
        }

        private string ToExpression(dynamic Value, string Type)
        {
            if (Type == "String")
            {
                byte[] Bytes = LuaEncoding.GetBytes(Value);
                string String = "\""; bool IsString = true;

                foreach (byte Byte in Bytes)
                {
                    switch (Random.Next(0, 2))
                    {

                        case (0): 
                            {
                                string Chunk = "\\" + Byte.ToString(); 
                                if (!IsString) { String = String + "..\"" + Chunk; IsString = true; }
                                else { String = String + Chunk; IsString = true; }; 
                                
                                break; 
                            };

                        default: 
                            {
                                string Escape = "\\" + Byte.ToString();
                                string Chunk = $"T{AddExpression("\"" + Escape + "\"").Indicies.Random()}";
                                if (IsString) { String = String + "\".." + Chunk; IsString = false; } 
                                else { String = String + ".." + Chunk; IsString = false; };
                                
                                break; 
                            };

                    };
                };

                return (String + (IsString ? "\"" : ""));
            }

            else if (Type == "Number") { return ($"T{((List<string>)AddExpression(Value).Indicies).Random()}"); }

            else if (Type == "Raw String") { return ($"T{((List<string>)AddExpression(Value).Indicies).Random()}"); };

            return "";
        }

        //////////////////////////////////////////////////

        private Dictionary<long, NumberEquation> NumberEquations = new Dictionary<long, NumberEquation> { };

        //////////////////////////////////////////////////

        string GetLuaGeneration() { if (!ObfuscationSettings.EnhancedOutput) { return (""); }; return ("PSU_LUA_GENERATION"); }

        public string BasicRandomizeNumberStatement(long Number)
        {
            string Replacement = "";

            if (Random.Next(0, 2) == 0) { int XOR = Random.Next(0, 1000000000); Number ^= XOR; Replacement = $"BitXOR({XOR}, {Number})"; }
            else if ((NumberExpressions.Count > 0) && (Random.Next(0, 2) == 0)) { Expression Expression = NumberExpressions.Random(); Number ^= (long)Expression.Data; Replacement = $"BitXOR({Number}, T{Expression.Indicies.Random()})"; }
            else { long XOR = Random.Next(0, 1000000000); Expression Expression = AddExpression(XOR); Number ^= XOR; Replacement = $"BitXOR({Number}, T{Expression.Indicies.Random()})"; };

            return (Replacement);
        }

        public string RandomizeNumberStatement(long Number)
        {
            string Replacement = Number.ToString();

            if (ObfuscationSettings.MaximumSecurityEnabled)
            {
                switch (Random.Next(0, 7))
                {
                    case (0): { long Index = NumberEquations.Keys.ToList().Random(); NumberEquation NumberEquation = NumberEquations[Index]; Replacement = $"Calculate({Index}, {NumberEquation.ComputeExpression(Number)})"; break; };
                    case (1): { long Index = NumberEquations.Keys.ToList().Random(); NumberEquation NumberEquation = NumberEquations[Index]; Replacement = $"Calculate({BasicRandomizeNumberStatement(Index)}, {NumberEquation.ComputeExpression(Number)})"; break; };
                    case (2): { long Index = NumberEquations.Keys.ToList().Random(); NumberEquation NumberEquation = NumberEquations[Index]; Replacement = $"Calculate({BasicRandomizeNumberStatement(Index)}, {BasicRandomizeNumberStatement(NumberEquation.ComputeExpression(Number))})"; break; };
                    case (3): { NumberEquation NumberEquation = new NumberEquation(Random.Next(3, 6)); long Index = GenerateNumericIndex(); Replacement = $"((Storage[{Index}]) or (" + $"(function(Value) Storage[{Index}] = {NumberEquation.WriteStatement()}; return (Storage[{Index}]); end)({BasicRandomizeNumberStatement(NumberEquation.ComputeExpression(Number))})))"; break; };
                    case (4): { Replacement = BasicRandomizeNumberStatement(Number); break; };
                    case (5): { NumberEquation NumberEquation = new NumberEquation(Random.Next(3, 6)); long Index = GenerateNumericIndex(); string Function = $"(function(Value, BitXOR, Storage, Index) Storage[Index] = {NumberEquation.WriteStatement()}; return (Storage[Index]); end)"; Replacement = $"((Storage[{Index}]) or (" + ToExpression(Function, "Raw String") + $"({BasicRandomizeNumberStatement(NumberEquation.ComputeExpression(Number))}, BitXOR, Storage, {Index})))"; break; };
                };

            };

            return (Replacement);
        }

        public string ExpandNumberStatements(string Source)
        {
            int SearchPosition = 0; 
            
            while (SearchPosition < Source.Length) 
            { 
                string Substring = Source.Substring(SearchPosition); 

                Match Match = Regex.Match(Substring, @"[^\\0-9a-zA-Z\.""'](\d+)[^0-9a-zA-Z\.""']"); 
                if (!Match.Success) { break; };

                bool Success = int.TryParse(Match.Groups[1].Value, out int Number); 
                if (!Success) { SearchPosition += Match.Index + Match.Length;  continue; }; 
                string Replacement = "(" + Utility.Utility.IntegerToString(Number) + ")"; 
                Source = Source.Substring(0, SearchPosition + Match.Index + 1) + Replacement + Source.Substring(SearchPosition + Match.Index + Match.Length - 1); 
                SearchPosition += Match.Index + Replacement.Length; 
            };

            return (Source);
        }

        public string ReplaceNumbers(string Source)
        {
            List<int> Variables = new List<int>();

            int SearchPosition = 0;

            while ((SearchPosition < Source.Length))
            {
                string Substring = Source.Substring(SearchPosition);
                Match Match = Regex.Match(Substring, @"[^\\0-9a-zA-Z_.](\d+)[^0-9a-zA-Z_.]");
                if (!Match.Success) { break; };

                bool Success = int.TryParse(Match.Groups[1].Value, out int Number);
                if (!Success) { SearchPosition = Match.Index + Match.Length; continue; };

                string Replacement = ToExpression(Number, "Number");
                if ((!Variables.Contains(Number))) { if (Variables.Count > 32) { SearchPosition = SearchPosition + Match.Index + Match.Length; continue; }; Variables.Add(Number); };
                Source = Source.Substring(0, SearchPosition + Match.Index + 1) + $"V{Number}" + Source.Substring(SearchPosition + Match.Index + Match.Length - 1);
                SearchPosition = Match.Index + Replacement.Length;
            };

            Variables.Shuffle();

            foreach (int Number in Variables) { Source = $"local V{Number} = T{ExpressionMap[Number].Indicies.Random()}; \n" + Source; };

            return (Source);
        }

        //////////////////////////////////////////////////

        public PremiumScriptBuilder(Chunk HeadChunk, ObfuscationContext ObfuscationContext, ObfuscationSettings ObfuscationSettings, List<VOpCode> Virtuals) 
        { 
            this.HeadChunk = HeadChunk; 
            this.ObfuscationSettings = ObfuscationSettings; 
            this.ObfuscationContext = ObfuscationContext;
            this.Virtuals = Virtuals;

            int Count = Random.Next(5, 15);
            for (int I = 0; I < Count; I++) { NumberEquations.Add(Random.Next(0, 1000000000), new NumberEquation(Random.Next(3, 6))); };
        }

        //////////////////////////////////////////////////

        private void GenerateDeserializer()
        {

            Deserializer = $@"

{GetLuaGeneration()}

{(this.ObfuscationSettings.MaximumSecurityEnabled ? "PSU_MAX_SECURITY_START()" : "")}

local function Deserialize(...) 
                    
{String.Join("\n", (new List<string> {

    $"\tlocal Instructions = ({{}});",
    $"\tlocal Constants = ({{}});",
    $"\tlocal Functions = ({{}});"

}).Shuffle())}  

            ";

            string InlinedGetBits32 = $"";
            string InlinedGetBits16 = $"";
            string InlinedGetBits8 = $"";
            string GetInlinedOrDefault(string ToInline, string Inlined, string Function, dynamic XORKey) { if (Random.Next(1, 2) == 0) { return (Function + "\n" + Inlined).Replace("XOR_KEY", XORKey.ToString()); }; return (ToInline); };

            foreach (ChunkStep ChunkStep in ObfuscationContext.ChunkSteps)
            {
                switch (ChunkStep)
                {
                    case (ChunkStep.StackSize): { Deserializer += $"\n\t{GetInlinedOrDefault($"local StackSize = gBits16(PrimaryXORKey);", "local StackSize = Value;", InlinedGetBits16, "PrimaryXORKey")}\n"; break; };
                    case (ChunkStep.ParameterCount): { Deserializer += $"\n\t{GetInlinedOrDefault($"local ParameterCount = gBits8(PrimaryXORKey);", "local ParameterCount = Value;", InlinedGetBits8, "PrimaryXORKey")}\n"; break; };
                    case (ChunkStep.Chunks): { Deserializer += $"\n\t{GetInlinedOrDefault($"for Index = 0, gBits32(PrimaryXORKey) - 1, 1 do", "for Index = 0, Value - 1, 1 do", InlinedGetBits32, "PrimaryXORKey")} Functions[Index] = Deserialize(); end;\n"; break; };

                    case (ChunkStep.Instructions):
                        {
                            Deserializer += $@" 

                            {GetInlinedOrDefault($"for Index = 0, gBits32(PrimaryXORKey) - 1, 1 do", "for Index = 0, Value - 1, 1 do", InlinedGetBits32, "PrimaryXORKey")}
                                {GetInlinedOrDefault($"local Type = gBits8(PrimaryXORKey);", "local Type = Value;", InlinedGetBits8, "PrimaryXORKey")}
		                        
                                if (Type == {ObfuscationContext.ConstantMapping[1]}) then
			                        
                                    {GetInlinedOrDefault($"local Bool = gBits8(PrimaryXORKey);", "local Bool = Value;", InlinedGetBits8, "PrimaryXORKey")}
                                    Constants[Index] = (Bool ~= 0);

		                        elseif (Type == {ObfuscationContext.ConstantMapping[2]}) then

			                        while (true) do
                                        {GetInlinedOrDefault($"local Left = gBits32(PrimaryXORKey);", "local Left = Value;", InlinedGetBits32, "PrimaryXORKey")}
                                        {GetInlinedOrDefault($"local Right = gBits32(PrimaryXORKey);", "local Right = Value;", InlinedGetBits32, "PrimaryXORKey")}                                   
                                        local IsNormal = 1;
				                        local Mantissa = (gBit(Right, 1, 20) * (2 ^ 32)) + Left;
				                        local Exponent = gBit(Right, 21, 31);
				                        local Sign = ((-1) ^ gBit(Right, 32));
				                        if (Exponent == 0) then
					                        if (Mantissa == 0) then
                                                Constants[Index] = (Sign * 0);
						                        break;
					                        else
						                        Exponent = 1;
						                        IsNormal = 0;
					                        end;
				                        elseif(Exponent == 2047) then
                                            Constants[Index] = (Mantissa == 0) and (Sign * (1 / 0)) or (Sign * (0 / 0));
						                    break;
				                        end;
                                        Constants[Index] = LDExp(Sign, Exponent - 1023) * (IsNormal + (Mantissa / (2 ^ 52)));
						                break;
			                        end;

		                        elseif (Type == {ObfuscationContext.ConstantMapping[3]}) then
			                       
                                    while (true) do
                                        {GetInlinedOrDefault($"local Length = gBits32(PrimaryXORKey);", "local Length = Value;", InlinedGetBits32, "PrimaryXORKey")}			                        
                                        if (Length == 0) then Constants[Index] = (''); break; end;
				                       
                                        if (Length > 5000) then
                                            local Constant, ByteString = (''), (SubString(ByteString, Position, Position + Length - 1));
                                            Position = Position + Length;
                                            for Index = 1, #ByteString, 1 do local Byte = BitXOR(Byte(SubString(ByteString, Index, Index)), PrimaryXORKey); PrimaryXORKey = Byte % 256; Constant = Constant .. Dictionary[Byte]; end;
                                            Constants[Index] = Constant;
                                        else
                                            local Constant, Bytes = (''), ({{Byte(ByteString, Position, Position + Length - 1)}});
                                            Position = Position + Length;        
                                            for Index, Byte in Pairs(Bytes) do local Byte = BitXOR(Byte, PrimaryXORKey); PrimaryXORKey = Byte % 256; Constant = Constant .. Dictionary[Byte]; end;				                        
                                            Constants[Index] = Constant;
                                        end;

						                break;
			                        end;

                                else

                                   Constants[Index] = (nil);

		                        end;
	                        end;";

                            Deserializer += $@"

                            {GetInlinedOrDefault($"local Count = gBits32(PrimaryXORKey);", "local Count = Value;", InlinedGetBits32, "PrimaryXORKey")} 
                            for Index = 0, Count - 1, 1 do Instructions[Index] = ({{}}); end;

                            for Index = 0, Count - 1, 1 do
                                {GetInlinedOrDefault($"local InstructionData = gBits8(PrimaryXORKey);", "local InstructionData = Value;", InlinedGetBits8, "PrimaryXORKey")} 
                                if (InstructionData ~= 0) then 
                                    InstructionData = InstructionData - 1;
                                    local {String.Join(", ", (new List<string> { $"Enum", $"A", $"B", $"C", $"D", $"E" }).Shuffle())} = 0, 0, 0, 0, 0, 0;
                                    local InstructionType = gBit(InstructionData, 1, 3);
        
                            ";

                            List<InstructionType> InstructionTypes = (new List<InstructionType> { InstructionType.ABC, InstructionType.ABx, InstructionType.AsBx, InstructionType.AsBxC, InstructionType.Closure, InstructionType.Compressed }).Shuffle().ToList();

                            foreach (InstructionType InstructionType in InstructionTypes)
                            {
                                Deserializer += $"if (InstructionType == {(int)InstructionType}) then ";

                                switch (InstructionType)
                                {
                                    case (InstructionType.ABC):
                                        {
                                            foreach (InstructionStep InstructionStep in ObfuscationContext.InstructionSteps)
                                            {
                                                switch (InstructionStep)
                                                {
                                                    case (InstructionStep.Enum): { Deserializer += $"{GetInlinedOrDefault(" Enum = (gBits8(PrimaryXORKey));", " Enum = (Value);", InlinedGetBits8, "PrimaryXORKey")}"; break; };

                                                    case (InstructionStep.A): { Deserializer += $"{GetInlinedOrDefault(" A = (gBits16(PrimaryXORKey));", " A = (Value);", InlinedGetBits16, "PrimaryXORKey")}"; break; };
                                                    case (InstructionStep.B): { Deserializer += $"{GetInlinedOrDefault(" B = (gBits16(PrimaryXORKey));", " B = (Value);", InlinedGetBits16, "PrimaryXORKey")}"; break; };
                                                    case (InstructionStep.C): { Deserializer += $"{GetInlinedOrDefault(" C = (gBits16(PrimaryXORKey));", " C = (Value);", InlinedGetBits16, "PrimaryXORKey")}"; break; };
                                                };
                                            };

                                            break;
                                        };

                                    case (InstructionType.ABx):
                                        {
                                            foreach (InstructionStep InstructionStep in ObfuscationContext.InstructionSteps)
                                            {
                                                switch (InstructionStep)
                                                {
                                                    case (InstructionStep.Enum): { Deserializer += $"{GetInlinedOrDefault(" Enum = (gBits8(PrimaryXORKey));", " Enum = (Value);", InlinedGetBits8, "PrimaryXORKey")}"; break; };

                                                    case (InstructionStep.A): { Deserializer += $"{GetInlinedOrDefault(" A = (gBits16(PrimaryXORKey));", " A = (Value);", InlinedGetBits16, "PrimaryXORKey")}"; break; };
                                                    case (InstructionStep.B): { Deserializer += $"{GetInlinedOrDefault(" B = (gBits32(PrimaryXORKey));", " B = (Value);", InlinedGetBits32, "PrimaryXORKey")}"; break; };
                                                };
                                            };

                                            break;
                                        };

                                    case (InstructionType.AsBx):
                                        {
                                            foreach (InstructionStep InstructionStep in ObfuscationContext.InstructionSteps)
                                            {
                                                switch (InstructionStep)
                                                {
                                                    case (InstructionStep.Enum): { Deserializer += $"{GetInlinedOrDefault(" Enum = (gBits8(PrimaryXORKey));", " Enum = (Value);", InlinedGetBits8, "PrimaryXORKey")}"; break; };

                                                    case (InstructionStep.A): { Deserializer += $"{GetInlinedOrDefault(" A = (gBits16(PrimaryXORKey));", " A = (Value);", InlinedGetBits16, "PrimaryXORKey")}"; break; };
                                                    case (InstructionStep.B): { Deserializer += $"{GetInlinedOrDefault(" B = Instructions[(gBits32(PrimaryXORKey))];", " B = (Value);", InlinedGetBits32, "PrimaryXORKey")}"; break; };
                                                };
                                            };

                                            break;
                                        };

                                    case (InstructionType.AsBxC):
                                        {
                                            foreach (InstructionStep InstructionStep in ObfuscationContext.InstructionSteps)
                                            {
                                                switch (InstructionStep)
                                                {
                                                    case (InstructionStep.Enum): { Deserializer += $"{GetInlinedOrDefault(" Enum = (gBits8(PrimaryXORKey));", " Enum = (Value);", InlinedGetBits8, "PrimaryXORKey")}"; break; };

                                                    case (InstructionStep.A): { Deserializer += $"{GetInlinedOrDefault(" A = (gBits16(PrimaryXORKey));", " A = (Value);", InlinedGetBits16, "PrimaryXORKey")}"; break; };
                                                    case (InstructionStep.B): { Deserializer += $"{GetInlinedOrDefault(" B = Instructions[(gBits32(PrimaryXORKey))];", " B = Instructions[(Value)];", InlinedGetBits32, "PrimaryXORKey")}"; break; };
                                                    case (InstructionStep.C): { Deserializer += $"{GetInlinedOrDefault(" C = (gBits16(PrimaryXORKey));", " C = (Value);", InlinedGetBits16, "PrimaryXORKey")}"; break; };
                                                };
                                            };

                                            break;
                                        };

                                    case (InstructionType.Closure):
                                        {
                                            foreach (InstructionStep InstructionStep in ObfuscationContext.InstructionSteps)
                                            {
                                                switch (InstructionStep)
                                                {
                                                    case (InstructionStep.Enum): { Deserializer += $"{GetInlinedOrDefault(" Enum = (gBits8(PrimaryXORKey));", " Enum = (Value);", InlinedGetBits8, "PrimaryXORKey")}"; break; };

                                                    case (InstructionStep.A): { Deserializer += $"{GetInlinedOrDefault(" A = (gBits16(PrimaryXORKey));", " A = (Value);", InlinedGetBits16, "PrimaryXORKey")}"; break; };
                                                    case (InstructionStep.B): { Deserializer += $"{GetInlinedOrDefault(" B = (gBits32(PrimaryXORKey));", " B = (Value);", InlinedGetBits32, "PrimaryXORKey")}"; break; };
                                                    case (InstructionStep.C): { Deserializer += $"{GetInlinedOrDefault(" C = (gBits16(PrimaryXORKey));", " C = (Value);", InlinedGetBits16, "PrimaryXORKey")}"; break; };
                                                };
                                            };

                                            Deserializer += $" D = ({{}}); for Index = 1, C, 1 do D[Index] = ({{[0] = gBits8(PrimaryXORKey), [1] = gBits16(PrimaryXORKey)}}); end; ";

                                            break;
                                        };
                                };

                                if (InstructionType != InstructionTypes.Last()) { Deserializer += " else"; };
                            };

                            Deserializer += $@" end; 

                            {String.Join(" ", (new List<string> {

                                $"if (gBit(InstructionData, 4, 4) == 1) then A = Constants[A]; end;",
                                $"if (gBit(InstructionData, 5, 5) == 1) then B = Constants[B]; end;",
                                $"if (gBit(InstructionData, 6, 6) == 1) then C = Constants[C]; end;",
                                $"if (gBit(InstructionData, 8, 8) == 1) then E = Instructions[gBits32(PrimaryXORKey)]; else E = Instructions[Index + 1]; end;"
                                

                            }).Shuffle())}

                            if (gBit(InstructionData, 7, 7) == 1) then D = ({{}}); for Index = 1, gBits8(), 1 do D[Index] = gBits32(); end; end;

                            local Instruction = Instructions[Index];

                            {String.Join(" ", (new List<string> {

                                $"Instruction[{ObfuscationContext.Instruction.Enum.Random()}] = Enum;",
                                $"Instruction[{ObfuscationContext.Instruction.A.Random()}] = A;",
                                $"Instruction[{ObfuscationContext.Instruction.B.Random()}] = B;",
                                $"Instruction[{ObfuscationContext.Instruction.C.Random()}] = C;",
                                $"Instruction[{ObfuscationContext.Instruction.D.Random()}] = D;",
                                $"Instruction[{ObfuscationContext.Instruction.E.Random()}] = E;"

                            }).Shuffle())} end; end;";

                            break;
                        };
                };
            };

            Deserializer += $@"

    return ({{

{String.Join("\n", (new List<string> {

    $"\t[{ObfuscationContext.Chunk.InstructionPoint.Random()}] = 0;",
    $"\t[{ObfuscationContext.Chunk.Instructions.Random()}] = Instructions;",
    $"\t[{ObfuscationContext.Chunk.Constants.Random()}] = Constants;",
    $"\t[{ObfuscationContext.Chunk.Chunks.Random()}] = Functions;",
    $"\t[{ObfuscationContext.Chunk.StackSize.Random()}] = StackSize;",
    $"\t[{ObfuscationContext.Chunk.ParameterCount.Random()}] = ParameterCount;"

}).Shuffle())}

    }}); 

end; {(this.ObfuscationSettings.MaximumSecurityEnabled ? "PSU_MAX_SECURITY_END()" : "")}" + "\n";

        }

        private void GenerateVM()
        {
            VM = $@"

{GetLuaGeneration()}

local function Wrap(Chunk, UpValues, Environment, ...)
                
    {String.Join("\n", (new List<string> {

    $"\tlocal Instructions = Chunk[{ObfuscationContext.Chunk.Instructions.Random()}];",
    $"\tlocal Functions = Chunk[{ObfuscationContext.Chunk.Chunks.Random()}];",
    $"\tlocal ParameterCount = Chunk[{ObfuscationContext.Chunk.ParameterCount.Random()}];",
    $"\tlocal Constants = Chunk[{ObfuscationContext.Chunk.Constants.Random()}];",
    $"\tlocal InitialInstructionPoint = 0;",
    $"\tlocal StackSize = Chunk[{ObfuscationContext.Chunk.StackSize.Random()}];"

    }).Shuffle())}
	
	return (function(...)

        {String.Join("\n", (new List<string> {

        $"\t\tlocal OP_A = {ObfuscationContext.Instruction.A.Random()};",
        $"\t\tlocal OP_B = {ObfuscationContext.Instruction.B.Random()};",
        $"\t\tlocal OP_C = {ObfuscationContext.Instruction.C.Random()};",
        $"\t\tlocal OP_D = {ObfuscationContext.Instruction.D.Random()};",
        $"\t\tlocal OP_E = {ObfuscationContext.Instruction.E.Random()};",
        $"\t\tlocal OP_ENUM = {ObfuscationContext.Instruction.Enum.Random()};",

        $"\t\tlocal Stack = {{}};",
        $"\t\tlocal Top = -(1);",
        $"\t\tlocal VarArg = {{}};",
        $"\t\tlocal Arguments = {{...}};",
        $"\t\tlocal PCount = (Select(Mode, ...) - 1);",
        $"\t\tlocal InstructionPoint = Instructions[InitialInstructionPoint];",
        $"\t\tlocal lUpValues = ({{}});",
        $"\t\tlocal VMKey = ({Random.Next(0, 1000000000)});",
        $"\t\tlocal DecryptConstants = (true);"

        }).Shuffle())}

        for Index = 0, PCount, 1 do
			if (Index >= ParameterCount) then
				VarArg[Index - ParameterCount] = Arguments[Index + 1];
			else
				Stack[Index] = Arguments[Index + 1];
			end;
		end;

        local VarArgs = PCount - ParameterCount + 1;

        while (true) do
            local Instruction = InstructionPoint;	
			local Enum = Instruction[OP_ENUM];
            InstructionPoint = Instruction[OP_E];";

            string FormatVMHandle(VOpCode Virtual)
            {
                string Obfuscated = Virtual.GetObfuscated(ObfuscationContext);

                if ((!ObfuscationSettings.ConstantEncryption) || (ObfuscationSettings.EnhancedConstantEncryption))
                {
                    Obfuscated = Obfuscated.Replace("Constants[Instruction[OP_A]]", "Instruction[OP_A]");
                    Obfuscated = Obfuscated.Replace("Constants[Instruction[OP_B]]", "Instruction[OP_B]");
                    Obfuscated = Obfuscated.Replace("Constants[Instruction[OP_C]]", "Instruction[OP_C]");
                };

                return (Obfuscated);
            };

            string FormatEnum(int Enum) { return (RandomizeNumberStatement(Enum)); };

            string GetString(List<int> OpCodes)
            {
                string String = "";

                if (OpCodes.Count == 1)
                {
                    string Obfuscated = FormatVMHandle(Virtuals[OpCodes[0]]);
                    String += $"{Obfuscated}";
                }
                else if (OpCodes.Count == 2)
                {
                    switch (Random.Next(0, 2))
                    {
                        case (0):
                            {
                                String += $"if (Enum > {FormatEnum(Virtuals[OpCodes[0]].VIndex)}) then\n{FormatVMHandle(Virtuals[OpCodes[1]])}";
                                String += $"elseif (Enum < {FormatEnum(Virtuals[OpCodes[1]].VIndex)}) then\n\n{FormatVMHandle(Virtuals[OpCodes[0]])}";
                                String += $"end;";

                                break;
                            };

                        case (1):
                            {
                                String += $"if (Enum == {FormatEnum(Virtuals[OpCodes[0]].VIndex)}) then\n{FormatVMHandle(Virtuals[OpCodes[0]])}";
                                String += $"elseif (Enum <= {FormatEnum(Virtuals[OpCodes[1]].VIndex)}) then\n{FormatVMHandle(Virtuals[OpCodes[1]])}";
                                String += $"end;";

                                break;
                            };
                    }
                }
                else
                {
                    List<int> Ordered = OpCodes.OrderBy(OpCode => OpCode).ToList();
                    var Sorted = new[] { Ordered.Take(Ordered.Count / 2).ToList(), Ordered.Skip(Ordered.Count / 2).ToList() };

                    String += $"if (Enum <= " + FormatEnum(Sorted[0].Last()) + ") then ";
                    String += GetString(Sorted[0]);
                    String += $"else";
                    String += GetString(Sorted[1]);
                };

                return (String);
            };

            VM += GetString(Enumerable.Range(0, Virtuals.Count).ToList());

            VM += $@"

                    end;
                end);
            end;	

            {GetLuaGeneration()}

            return Wrap(Deserialize(), {{}}, GetFEnv())(...);";
        }

        private void GenerateHeader()
        {
            List<byte> Bytes = new Serializer(ObfuscationContext, ObfuscationSettings).Serialize(HeadChunk);
            string ByteString = Compression.CompressedToString(Compression.Compress(Bytes.ToArray()), ObfuscationSettings);

            string ByteCodeFormattingTable = "{";

            Dictionary<char, string> Replacements = new Dictionary<char, string>();

            string Base36 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

            string Pattern = "";

            if (ObfuscationSettings.ByteCodeMode == "Chinese")
            {
                string Format = "𡿂𡿃𡿄𡿅𡿆𡿇𡿈𡿉𡿊𡿋𡿌𡿍𡿎𡿏𡿐𡿑𡿒𡿓𡿔𡿕𡿖𡿗𡿘𡿙𡿚𡿛𡿜𡿝𡿞𡿟𡿠𡿡𡿢𡿣𡿤𡿥𡓷𡓸𡓹𡓺𡓻𡓼𡓽𡓾𡓿𡔀𡔁𡔂𡔃𡔄𡔅𡔆𡔇𡔈𡔉𡔊𡔋𡔌𡔍𡔎𡔏𡔐𡔑𡔒𡔓𡔔𡔕𡔖𡔗𡔘𡔙𡔚";

                Pattern = "....";

                List<string> Characters = new List<string>();
                for (int I = 0; I < Format.Length; I += 2) { string Section = Format.Substring(I, 2); Characters.Add(Section); };
                for (int I = 0; I < Base36.Length; I++) { ByteString = ByteString.Replace(Base36[I].ToString(), Characters[I]); Replacements[Base36[I]] = Characters[I]; ByteCodeFormattingTable += $"[\"{Characters[I]}\"]=\"{Base36[I]}\";"; };

                ByteString = "[=[PSU|" + ByteString + "]=]";
            }
            else if (ObfuscationSettings.ByteCodeMode == "Arabic")
            {
                string Format = "ٶٷٸٺٻټٽپٿڀځڂڃڄڅچڇڈډڊڋڌڍڎڏڐڑڒݐݑݒݓݔݕݖݗݘݙݚݛݜݝݞݟݠݡݢݣݤݥݦݧݨݩݪݫݬݭݮݯݰݱݲݳݴݵݶݷݸݹݺݻݼݽݾݿ";

                Pattern = "..";

                List<string> Characters = new List<string>();
                for (int I = 0; I < Format.Length; I++) { string Section = Format.Substring(I, 1); Characters.Add(Section); };
                for (int I = 0; I < Base36.Length; I++) { ByteString = ByteString.Replace(Base36[I].ToString(), Characters[I]); Replacements[Base36[I]] = Characters[I]; ByteCodeFormattingTable += $"[\"{Characters[I]}\"]=\"{Base36[I]}\";"; };

                ByteString = "[=[PSU|" + ByteString + "]=]";
            }
            else if (ObfuscationSettings.ByteCodeMode == "Symbols1")
            {
                string Format = "ꀀꀁꀂꀃꀄꀅꀆꀇꀈꀉꀊꀋꀌꀍꀎꀏꀐꀑꀒꀓꀔꀕꀖꀗꀘꀙꀚꀛꀜꀝꀞꀟꀠꀡꀢꀣꀤꀥꀦꀧꀨꀩꀪꀫꀬꀭꀮꀯꀰꀱꀲꀳꀴꀵꀶꀷꀸꀹꀺꀻꀼꀽꀾꀿꁀꁁꁂꁃꁄꁅꁆꁇꁈꁉꁊꁋꁌꁍꁎꁏꁐꁑꁒꁓꁔꁕꁖꁗꁘꁙꁚꁛ";

                Pattern = "...";

                List<string> Characters = new List<string>();
                for (int I = 0; I < Format.Length; I++) { string Section = Format.Substring(I, 1); Characters.Add(Section); };
                for (int I = 0; I < Base36.Length; I++) { ByteString = ByteString.Replace(Base36[I].ToString(), Characters[I]); Replacements[Base36[I]] = Characters[I]; ByteCodeFormattingTable += $"[\"{Characters[I]}\"]=\"{Base36[I]}\";"; };

                ByteString = "[=[PSU|" + ByteString + "]=]";
            }
            else if (ObfuscationSettings.ByteCodeMode == "Korean")
            {
                string Format = "뗬뗭뗮뗯뗰뗱뗲뗳뗴뗵뗶뗷뗸뗹뗺뗻뗼뗽뗾뗿똀똁똂똃똄똅똆똇똈똉똊똋똌똍똎똏또똑똒똓똔똕똖똗똘똙똚똛똜똝똞똟똠똡똢똣똤똥똦똧똨똩똪똫똬똭똮똯똰똱똲똳똴똵똶똷똸똹똺똻";

                Pattern = "...";

                List<string> Characters = new List<string>();
                for (int I = 0; I < Format.Length; I++) { string Section = Format.Substring(I, 1); Characters.Add(Section); };
                for (int I = 0; I < Base36.Length; I++) { ByteString = ByteString.Replace(Base36[I].ToString(), Characters[I]); Replacements[Base36[I]] = Characters[I]; ByteCodeFormattingTable += $"[\"{Characters[I]}\"]=\"{Base36[I]}\";"; };

                ByteString = "[=[PSU|" + ByteString + "]=]";
            }
            else if (ObfuscationSettings.ByteCodeMode == "Symbols2")
            {
                string Format = "𒉧𒉨𒉩𒉪𒉫𒉬𒉭𒉮𒉯𒉰𒉱𒉲𒉳𒉴𒉵𒉶𒉷𒉸𒉹𒉺𒉻𒉼𒉽𒉾𒉿𒊀𒊁𒊂𒊃𒊄𒊅𒊆𒊇𒊈𒊉𒊊𒊋𒊌𒊍𒊎𒊏𒊐𒊑𒊒𒊓𒊔𒊕𒊖𒊗𒊘𒊙𒊚𒊛𒊜𒊝𒊞𒊟𒊠𒊡𒊢𒊣𒊤𒊥𒊦𒊧𒊨𒊩𒊪𒊫𒊬𒊭𒊮𒊯𒊰𒊱𒊲𒊳𒊴𒊵𒊶𒊷𒊸𒊹𒊺𒊻𒊼𒊽𒊾𒊿𒋀𒋁𒋂𒋃𒋄𒋅𒋆𒋇";

                Pattern = "....";

                List<string> Characters = new List<string>();
                for (int I = 0; I < Format.Length; I += 2) { string Section = Format.Substring(I, 2); Characters.Add(Section); };
                for (int I = 0; I < Base36.Length; I++) { ByteString = ByteString.Replace(Base36[I].ToString(), Characters[I]); Replacements[Base36[I]] = Characters[I]; ByteCodeFormattingTable += $"[\"{Characters[I]}\"]=\"{Base36[I]}\";"; };

                ByteString = "[=[PSU|" + ByteString + "]=]";
            }
            else if (ObfuscationSettings.ByteCodeMode == "Symbols3")
            {
                string Format = "𒐋𒐌𒐍𒐎𒐏𒐐𒐑𒐒𒐓𒐔𒐕𒐖𒐗𒐘𒐙𒐚𒐛𒐜𒐝𒐞𒐟𒐠𒐡𒐢𒐣𒐤𒐥𒐦𒐧𒐨𒐩𒐪𒐫𒐬𒐭𒐮𒐯𒐰𒐱𒐲𒐳𒐴𒐵𒐶𒐷𒐸𒐹𒐺𒐻𒐼𒐽𒐾𒐿𒑀𒑁𒑂𒑃𒑄𒑅𒑆𒑇𒑈𒑉𒑊𒑋𒑌𒑍𒑎𒑏𒑐𒑑𒑒𒑓𒑔𒑕𒑖𒑗𒑘𒑙𒑚𒑛𒑜𒑝𒑞𒑟𒑠𒑡𒑢𒑣𒑤𒑥𒑦𒑧𒑨𒑩𒑪";

                Pattern = "....";

                List<string> Characters = new List<string>();
                for (int I = 0; I < Format.Length; I += 2) { string Section = Format.Substring(I, 2); Characters.Add(Section); };
                for (int I = 0; I < Base36.Length; I++) { ByteString = ByteString.Replace(Base36[I].ToString(), Characters[I]); Replacements[Base36[I]] = Characters[I]; ByteCodeFormattingTable += $"[\"{Characters[I]}\"]=\"{Base36[I]}\";"; };

                ByteString = "[=[PSU|" + ByteString + "]=]";
            }
            else if (ObfuscationSettings.ByteCodeMode == "Emoji")
            {
                string Format = "🍅🍆🍇🍈🍉🍊🍋🍌🍍🍎🍏🍐🍑🍒🍓🍔🍕🍖🍗🍘🔏🔐🔑🔒🔓🔔😀😁😂😃😄😅😆😇😈😉😊😋😌😍😎😏😐😑😒😓😔😕😖😗😘😙😚😛😜😝😞😟😠😡😢😣😤😥😦😧😨😩😪😫😬😭😮😯😰😱";

                Pattern = "....";

                List<string> Characters = new List<string>();
                for (int I = 0; I < Format.Length; I += 2) { string Section = Format.Substring(I, 2); Characters.Add(Section); };
                for (int I = 0; I < Base36.Length; I++) { ByteString = ByteString.Replace(Base36[I].ToString(), Characters[I]); Replacements[Base36[I]] = Characters[I]; ByteCodeFormattingTable += $"[\"{Characters[I]}\"]=\"{Base36[I]}\";"; };

                ByteString = "[=[PSU|" + ByteString + "]=]";
            }
            else if (ObfuscationSettings.ByteCodeMode == "Greek")
            {
                string Format = "𝝄𝝅𝝆𝝇𝝈𝝉𝝊𝝋𝝌𝝍𝝎𝝏𝝐𝝑𝝒𝝓𝝔𝝕𝝖𝝗𝝘𝝙𝝚𝝛𝝜𝝝𝝞𝝟𝝠𝝡𝝢𝝣𝝤𝝥𝝦𝝧𝝨𝝩𝝪𝝫𝝬𝝭𝝮𝝯𝝰𝝱𝝲𝝳𝝴𝝵𝝶𝝷𝝸𝝹𝝺𝝻𝝼𝝽𝝾𝝿𝞀𝞁𝞂𝞃𝞄𝞅𝞆";

                Pattern = "....";

                List<string> Characters = new List<string>();
                for (int I = 0; I < Format.Length; I += 2) { string Section = Format.Substring(I, 2); Characters.Add(Section); };
                for (int I = 0; I < Base36.Length; I++) { ByteString = ByteString.Replace(Base36[I].ToString(), Characters[I]); Replacements[Base36[I]] = Characters[I]; ByteCodeFormattingTable += $"[\"{Characters[I]}\"]=\"{Base36[I]}\";"; };

                ByteString = "[=[PSU|" + ByteString + "]=]";
            }
            else if (ObfuscationSettings.ByteCodeMode == "Default")
            {
                ByteString = "\"PSU|" + ByteString + "\"";
            };

            ObfuscationContext.ByteCode = ByteString;

            ByteCodeFormattingTable += "}";

            if (ObfuscationSettings.ByteCodeMode != "Default") { ObfuscationContext.FormatTable = ByteCodeFormattingTable; ByteCodeFormattingTable = $@"ByteString = GSub(ByteString, ""{Pattern}"", PSU_FORMAT_TABLE);"; }
            else { ByteCodeFormattingTable = ""; };

            //////////////////////////////////////////////////

            Variables = $@"

local GetFEnv = ((getfenv) or (function(...) return (_ENV); end));
local Storage, _, Environment = ({{}}), (""""), (GetFEnv(1));

local bit32 = ((Environment[{ToExpression("bit32", "String")}]) or (Environment[{ToExpression("bit", "String")}]) or ({{}})); 
local BitXOR = (((bit32) and (bit32[{ToExpression("bxor", "String")}])) or (function(A, B) local P, C = 1, 0; while ((A > 0) and (B > 0)) do local X, Y = A % 2, B % 2; if X ~= Y then C = C + P; end; A, B, P = (A - X) / 2, (B - Y) / 2, P * 2; end; if A < B then A = B; end; while A > 0 do local X = A % 2; if X > 0 then C = C + P; end; A, P =(A - X) / 2, P * 2; end; return (C); end));

local MOD = (2 ^ 32);
local MODM = (MOD - 1);
local BitSHL, BitSHR, BitAND;

{GetLuaGeneration()}

{String.Join("\n", (new List<string>{
$"local Byte = (_[{ToExpression("byte", "String")}]);",
$"local Character = (_[{ToExpression("char", "String")}]);",
$"local SubString = (_[{ToExpression("sub", "String")}]);",
$"local GSub = (_[{ToExpression("gsub", "String")}]);"}).Shuffle())}

{GetLuaGeneration()}

{String.Join("\n", (new List<string> {
$"local RawSet = (Environment[{ToExpression("rawset", "String")}]);",
$"local Pairs = (Environment[{ToExpression("pairs", "String")}]);",
$"local ToNumber = (Environment[{ToExpression("tonumber", "String")}]);",
$"local SetMetaTable = (Environment[{ToExpression("setmetatable", "String")}]);",
$"local Select = (Environment[{ToExpression("select", "String")}]);",
$"local Type = (Environment[{ToExpression("type", "String")}]);",
$"local UnPack = ((Environment[{ToExpression("unpack", "String")}]) or (Environment[{ToExpression("table", "String")}][{ToExpression("unpack", "String")}]));",
$"local LDExp = ((Environment[{ToExpression("math", "String")}][{ToExpression("ldexp", "String")}]) or (function(Value, Exponent, ...) return ((Value * 2) ^ Exponent); end));",
$"local Floor = (Environment[{ToExpression("math", "String")}][{ToExpression("floor", "String")}]);" }).Shuffle())}

{GetLuaGeneration()}

{String.Join("\n", (new List<string> {
$"BitAND = (bit32[{ToExpression("band", "String")}]) or (function(A, B, ...) return (((A + B) - BitXOR(A, B)) / 2); end);",
$"local BitOR = (bit32[{ToExpression("bor", "String")}]) or (function(A, B, ...) return (MODM - BitAND(MODM - A, MODM - B)); end);",
$"local BitNOT = (bit32[{ToExpression("bnot", "String")}]) or (function(A, ...) return (MODM - A); end);",
$"BitSHL = ((bit32[{ToExpression("lshift", "String")}]) or (function(A, B, ...) if (B < 0) then return (BitSHR(A, -(B))); end; return ((A * 2 ^ B) % 2 ^ 32); end));",
$"BitSHR = ((bit32[{ToExpression("rshift", "String")}]) or (function(A, B, ...) if (B < 0) then return (BitSHL(A, -(B))); end; return (Floor(A % 2 ^ 32 / 2 ^ B)); end));" }).Shuffle())}

if ((not (Environment[{ToExpression("bit32", "String")}])) and (not (Environment[{ToExpression("bit", "String")}]))) then

{String.Join("\n", (new List<string> {
$"bit32[{ToExpression("bxor", "String")}] = BitXOR;",
$"bit32[{ToExpression("band", "String")}] = BitAND;",
$"bit32[{ToExpression("bor", "String")}] = BitOR;",
$"bit32[{ToExpression("bnot", "String")}] = BitNOT;",
$"bit32[{ToExpression("lshift", "String")}] = BitSHL;",
$"bit32[{ToExpression("rshift", "String")}] = BitSHR;" }).Shuffle())}

end;

{GetLuaGeneration()}

{String.Join("\n", (new List<string> {
$"local Remove = (Environment[{ToExpression("table", "String")}][{ToExpression("remove", "String")}]);",
$"local Insert = (Environment[{ToExpression("table", "String")}][{ToExpression("insert", "String")}]);",
$"local Concatenate = (Environment[{ToExpression("table", "String")}][{ToExpression("concat", "String")}]);",
$"local Create = (((Environment[{ToExpression("table", "String")}][{ToExpression("create", "String")}])) or ((function(Size, ...) return ({{ UnPack({{}}, 0, Size); }}); end)));"}).Shuffle())} 

Environment[{ToExpression("bit32", "String")}] = bit32;

local PrimaryXORKey = ({ObfuscationContext.InitialPrimaryXORKey});

{GetLuaGeneration()}

local F = (#TEXT + 165); local G, Dictionary = ({{}}), ({{}}); for H = 0, F - 1 do local Value = Character(H); G[H] = Value; Dictionary[H] = Value; Dictionary[Value] = H; end;
local ByteString, Position = (function(ByteString) local X, Y, Z = Byte(ByteString, 1, 3); if ((X + Y + Z) ~= 248) then PrimaryXORKey = PrimaryXORKey + {Random.Next(0, 256)}; F = F + {Random.Next(0, 256)}; end; ByteString = SubString(ByteString, 5); {ByteCodeFormattingTable} local C, D, E = (""""), (""""), ({{}}); local I = 1; local function K() local L = ToNumber(SubString(ByteString, I, I), 36); I = I + 1; local M = ToNumber(SubString(ByteString, I, I + L - 1), 36); I = I + L; return (M); end; C = Dictionary[K()]; E[1] = C; while (I < #ByteString) do local N = K(); if G[N] then D = G[N]; else D = C .. SubString(C, 1, 1); end; G[F] = C .. SubString(D, 1, 1); E[#E + 1], C, F = D, D, F + 1; end; return (Concatenate(E)); end)(PSU_BYTECODE), (#TEXT - 90);";

            Functions = $@"

{GetLuaGeneration()}

{String.Join("\n", (new List<string> {
$"local function gBits32() local W, X, Y, Z = Byte(ByteString, Position, Position + 3); W = BitXOR(W, PrimaryXORKey); PrimaryXORKey = W % 256; X = BitXOR(X, PrimaryXORKey); PrimaryXORKey = X % 256; Y = BitXOR(Y, PrimaryXORKey); PrimaryXORKey = Y % 256; Z = BitXOR(Z, PrimaryXORKey); PrimaryXORKey = Z % 256; Position = Position + 4; return ((Z * 16777216) + (Y * 65536) + (X * 256) + W); end;",
$"local function gBits16() local W, X = Byte(ByteString, Position, Position + 2); W = BitXOR(W, PrimaryXORKey); PrimaryXORKey = W % 256; X = BitXOR(X, PrimaryXORKey); PrimaryXORKey = X % 256; Position = Position + 2; return ((X * 256) + W); end;",
$"local function gBits8() local F = BitXOR(Byte(ByteString, Position, Position), PrimaryXORKey); PrimaryXORKey = F % 256; Position = (Position + 1); return (F); end;",
$"local function gBit(Bit, Start, End) if (End) then local R = (Bit / 2 ^ (Start - 1)) % 2 ^ ((End - 1) - (Start - 1) + 1); return (R - (R % 1)); else local P = 2 ^ (Start - 1); return (((Bit % (P + P) >= P) and (1)) or(0)); end; end;" }).Shuffle())} 

local Mode = {ToExpression("#", "String")}; local function _R(...) return ({{...}}), Select(Mode, ...); end;";

        }
        
        //////////////////////////////////////////////////
        
        private string GenerateLoader(string Source)
        {
 
            Source = $@"
PSU_LUA_GENERATION

local Environment = ((getfenv) or (function(...) return (_ENV); end))();

local ToNumber = Environment[""\{String.Join("\\", LuaEncoding.GetBytes("tonumber"))}""]; 

PSU_LUA_GENERATION

local SubString = ("""")[""\{String.Join("\\", LuaEncoding.GetBytes("sub"))}""]; 
local Byte = ("""")[""\{String.Join("\\", LuaEncoding.GetBytes("byte"))}""]; 
local Character = ("""")[""\{String.Join("\\", LuaEncoding.GetBytes("char"))}""]; 

local Concatenate = Environment[""\{String.Join("\\", LuaEncoding.GetBytes("table"))}""][""\{String.Join("\\", LuaEncoding.GetBytes("concat"))}""]; 

local LoadString = ((Environment[""\{String.Join("\\", LuaEncoding.GetBytes("loadstring"))}""]) or (Environment[""\{String.Join("\\", LuaEncoding.GetBytes("load"))}""]));

local F = (256);
local G, Dictionary = ({{}}), ({{}}); 
for H = 0, F - 1 do local Value = Character(H); G[H] = Value; Dictionary[H] = Value; Dictionary[Value] = H; end; 

PSU_LUA_GENERATION

local bit32 = ((Environment[""\{String.Join("\\", LuaEncoding.GetBytes("bit32"))}""]) or (Environment[""\{String.Join("\\", LuaEncoding.GetBytes("bit"))}""]) or ({{}})); 
local BitXOR = (((bit32) and (bit32[""\{String.Join("\\", LuaEncoding.GetBytes("bxor"))}""])) or (function(A, B) local P, C = 1, 0; while ((A > 0) and (B > 0)) do local X, Y = A % 2, B % 2; if X ~= Y then C = C + P; end; A, B, P = (A - X) / 2, (B - Y) / 2, P * 2; end; if A < B then A = B; end; while A > 0 do local X = A % 2; if X > 0 then C = C + P; end; A, P =(A - X) / 2, P * 2; end; return (C); end));

local PrimaryXORKey = (BitXOR({Utility.Utility.IntegerToTable(0 ^ 0)}, {Utility.Utility.IntegerToTable(0)}));

PSU_LUA_GENERATION

local Position, ByteString = ({Utility.Utility.IntegerToTable(1)}), (function(ByteString) PSU_LUA_GENERATION local C, D, E = (""""), (""""), ({{}}); local I = 1; local function K() local L = ToNumber(SubString(ByteString, I, I), 36); I = I + 1; local M = ToNumber(SubString(ByteString, I, I + L - 1), 36); I = I + L; return (M); end; C = Dictionary[K()]; E[1] = C; while (I < #ByteString) do local N = K(); if G[N] then D = G[N]; else D = C .. SubString(C, 1, 1); end; G[F] = C .. SubString(D, 1, 1); E[#E + 1], C, F = D, D, F + 1; end; return (Concatenate(E)); end)([==[PSU_BYTECODE]==]);

PSU_LUA_GENERATION

{String.Join("\n", (new List<string> {
$"local function gBits32() local W, X, Y, Z = Byte(ByteString, Position, Position + 3); W = BitXOR(W, PrimaryXORKey); X = BitXOR(X, PrimaryXORKey); Y = BitXOR(Y, PrimaryXORKey); Z = BitXOR(Z, PrimaryXORKey); Position = Position + 4; return ((Z * 16777216) + (Y * 65536) + (X * 256) + W); end;",
$"local function gBits16() local W, X = Byte(ByteString, Position, Position + 2); W = BitXOR(W, PrimaryXORKey); X = BitXOR(X, PrimaryXORKey); Position = Position + 2; return ((X * 256) + W); end;",
$"local function gBits8() local F = BitXOR(Byte(ByteString, Position, Position), PrimaryXORKey); Position = (Position + 1); return (F); end;",
$"local function gBit(Bit, Start, End) if (End) then local R = (Bit / 2 ^ (Start - 1)) % 2 ^ ((End - 1) - (Start - 1) + 1); return (R - (R % 1)); else local P = 2 ^ (Start - 1); return (((Bit % (P + P) >= P) and (1)) or(0)); end; end;" }).Shuffle())} 

PSU_LUA_GENERATION

local Information = PSU_VM_TABLE; 

PSU_LUA_GENERATION

return LoadString(SubString(ByteString, Position))(Information or (function(...) PSU_LUA_GENERATION end), ...);";

            return (Source);
        }

        //////////////////////////////////////////////////

        public string BuildScript(string Location)
        {
            GenerateHeader();

            GenerateDeserializer();

            GenerateVM();

            //////////////////////////////////////////////////

            if (!ObfuscationSettings.CompressedOutput)
            {
                Deserializer = ReplaceNumbers(Deserializer);
                Deserializer = ExpandNumberStatements(Deserializer);
                Deserializer = "local function Deserialize(...) " + Deserializer + " return (Deserialize(...)); end;";

                Variables = ReplaceNumbers(Variables);
                Variables = ExpandNumberStatements(Variables);

                if (ObfuscationSettings.MaximumSecurityEnabled)
                {
                    Variables += "local function Calculate(Index, Value, ...)";
                    foreach (KeyValuePair<long, NumberEquation> NumberEquationPair in NumberEquations) { Variables += $"if (Index == {NumberEquationPair.Key}) then return ({NumberEquationPair.Value.WriteStatement()});"; if (NumberEquationPair.Key != NumberEquations.Last().Key) { Variables += "else"; }; };
                    Variables += " end; end;";
                };

                Functions = ReplaceNumbers(Functions);
                Functions = ExpandNumberStatements(Functions);

            };

            if (true)
            {
                Variables += "local function CalculateVM(Index, Value, ...)";
                foreach (KeyValuePair<long, NumberEquation> NumberEquationPair in ObfuscationContext.NumberEquations) { Variables += $"if (Index == {NumberEquationPair.Key}) then return ({NumberEquationPair.Value.WriteStatement()});"; if (NumberEquationPair.Key != NumberEquations.Last().Key) { Variables += "else"; }; };
                Variables += " end; end;";
            };

            //////////////////////////////////////////////////

            string VMTable = ("");

            Expressions.Shuffle();

            string Source = "return (function(T, ...) local TEXT = \"This file was obfuscated using PSU Obfuscator 4.0.A | https://www.psu.dev/ & discord.gg/psu\"; " + Variables + Functions + Deserializer + VM;
            Source += $" \nend)(...);";

            string GenerateCode() { if (!ObfuscationSettings.EnhancedOutput) { return (""); }; switch (Random.Next(0, 3)) { case (1): { return $" do local function _(...) {LuaGeneration.LuaGeneration.GenerateRandomFile(1, 1)} end; end; "; }; case (0): { return $" do local function _(...) {LuaGeneration.LuaGeneration.VarArgSpam(1, 1)} end; end; "; }; case (2): { return $""; }; }; return (""); };
            if ((ObfuscationSettings.EnhancedOutput)) { int SearchPosition = 0; while (SearchPosition < Source.Length) { string Substring = Source.Substring(SearchPosition); Match Match = Regex.Match(Substring, @"PSU_LUA_GENERATION"); if (Match.Success) { string Replacement = GenerateCode(); Source = Source.Substring(0, SearchPosition + Match.Index) + Replacement + Source.Substring(SearchPosition + Match.Index + Match.Length); SearchPosition += Match.Index + Replacement.Length; } else { break; }; }; };

            //////////////////////////////////////////////////

            if (ObfuscationSettings.MaximumSecurityEnabled)
            {
                LuaOptions LuaOptions = new LuaOptions(true, false, true, false, true, true, true, true, true, false, true, true, ContinueType.ContextualKeyword);

                LuaLexerBuilder LexerBuilder = new LuaLexerBuilder(LuaOptions);
                LuaParserBuilder ParserBuilder = new LuaParserBuilder(LuaOptions);

                var Diagnostics = new DiagnosticList();
                var Lexer = LexerBuilder.CreateLexer(Source, Diagnostics);
                var TokenReader = new TokenReader<LuaTokenType>(Lexer);
                var Parser = ParserBuilder.CreateParser(TokenReader, Diagnostics);
                var Tree = Parser.Parse();

                Source = VMFormattedLuaCodeSerializer.Format(LuaOptions.All, Tree);
            };

            File.WriteAllText(Path.Combine(Location, "VM.lua"), Source);


            // FileName
            var dir = System.IO.Directory.GetCurrentDirectory();

            string FileNameP = Path.Combine(dir,$"Lua/LuaJIT.exe");
            var os = Environment.OSVersion;

            if (os.Platform.ToString() == "Unix")
                FileNameP=$"luajit";


            var LuaDir = Path.Combine(dir,$"Lua/lua");


            // Console.WriteLine(Path.Combine(LuaDir,$"LuaSrcDiet.lua"));
            // Console.WriteLine(LuaDir);


            Process Process = new Process { StartInfo = { FileName = FileNameP, WorkingDirectory=LuaDir , Arguments = Path.Combine(LuaDir,$"LuaSrcDiet.lua") +  " --maximum --opt-entropy --opt-emptylines --opt-eols --opt-numbers --opt-whitespace --opt-locals --noopt-strings \"" + Path.Combine(dir,Location, "VM.lua") + "\" -o \"" + Path.Combine(dir,Location, "Output.lua") + "\"", UseShellExecute = false, RedirectStandardError = true, RedirectStandardOutput = true } };
            Process.Start(); Process.WaitForExit();

//            Console.WriteLine(Process.StartInfo.FileName);
//            Console.WriteLine(Process.StartInfo.Arguments);
//            Console.WriteLine(Process.StartInfo.WorkingDirectory);

            Source = File.ReadAllText(Path.Combine(Location, "Output.lua"), LuaEncoding).Replace("\n", " ");
            Source = Source.Replace("[.", "[0.");

            File.WriteAllText(Path.Combine(Location, "Output.lua"), Source.Replace("PSU_BYTECODE", ObfuscationContext.ByteCode).Replace("PSU_FORMAT_TABLE", ObfuscationContext.FormatTable));

            string Script = File.ReadAllText(Path.Combine(Location, "Output.lua"), LuaEncoding);

            Source = GenerateLoader(Script);
         
            List<byte> Bytes = LuaEncoding.GetBytes(Script).ToList();
            List<byte> Initial = new List<byte>();

            foreach (Expression Expression in Expressions)
            {
                string Index = Expression.Indicies.Random();

                if (Index.StartsWith(".")) { Index = Index.Remove(0, 1); };

                if ((Expression.Data.GetType() == int.MaxValue.GetType()) && (Random.Next(0, 2) == 0) && (Expression.Data >= 0))
                {
                    Initial.AddRange(BitConverter.GetBytes(Expression.Data));
                    VMTable += $"{Index}=(gBits32());";
                }
                else
                {
                    VMTable += $"{Index}=({Expression.Data});";
                };
            };

            Bytes = Initial.Concat(Bytes).ToList();
            string Compressed = Compression.CompressedToString(Compression.Compress(Bytes.ToArray()), ObfuscationSettings);

            Source = Source.Replace("PSU_VM_TABLE", $"({{{VMTable}}})").Replace("PSU_BYTECODE", Compressed);

            Source = ExpandNumberStatements(Source);

            Source = ExpandNumberStatements(Source);

            if (true)
            {
                int SearchPosition = 0;
                while (SearchPosition < Source.Length)
                {
                    string Substring = Source.Substring(SearchPosition);
                    Match Match = Regex.Match(Substring, @"PSU_LUA_GENERATION");
                    if (Match.Success)
                    {
                        string Replacement = GenerateCode();
                        Source = Source.Substring(0, SearchPosition + Match.Index) + Replacement +
                                 Source.Substring(SearchPosition + Match.Index + Match.Length);
                        SearchPosition += Match.Index + Replacement.Length;
                    }
                    else
                    {
                        break;
                    }

                    ;
                }

                ;
            }

            ;

            File.WriteAllText(Path.Combine(Location, "VM.lua"), Source);

            Process = new Process { StartInfo = { FileName = FileNameP, WorkingDirectory=LuaDir , Arguments = Path.Combine(LuaDir,$"LuaSrcDiet.lua") +  " --maximum --opt-entropy --opt-emptylines --opt-eols --opt-numbers --opt-whitespace --opt-locals --noopt-strings \"" + Path.Combine(dir,Location, "VM.lua") + "\" -o \"" + Path.Combine(dir,Location, "Output.lua") + "\"", UseShellExecute = false, RedirectStandardError = true, RedirectStandardOutput = true } };
            Process.Start(); Process.WaitForExit();

  //          Console.WriteLine(Process.StartInfo.FileName);
 //           Console.WriteLine(Process.StartInfo.Arguments);
//            Console.WriteLine(Process.StartInfo.WorkingDirectory);

            Source = File.ReadAllText(Path.Combine(Location, "Output.lua"), LuaEncoding);
            Source = Source.Replace("[.", "[0.");

            File.WriteAllText(Path.Combine(Location, "Output.lua"), Source);

            return (Source);
        }
    };
};