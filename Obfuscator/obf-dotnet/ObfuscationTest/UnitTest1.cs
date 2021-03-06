using System;
using System.Diagnostics;
using System.IO;
using NUnit.Framework;
using Obfuscator.Obfuscation;

namespace ObfuscationTest
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        } 
        public string[] Obfuscate(ObfuscationSettings Settings, string src = "print((62+81)-71)")
        {
            Settings = new ObfuscationSettings(Settings);
            string ProjectDir =
                Path.GetFullPath(Path.Combine(Path.GetDirectoryName(TestContext.CurrentContext.TestDirectory),
                    @"..\..\.."));

            string Dir = Path.Combine(Path.GetTempPath(), Path.GetRandomFileName());
            Directory.CreateDirectory(Dir);

            var Obf = new Obfuscator.Obfuscator(Settings, Dir);
            Directory.SetCurrentDirectory(ProjectDir);
            TestContext.Progress.WriteLine("Obfuscating...");
            var Output = Obf.ObfuscateString(src);
            TestContext.Progress.WriteLine("Obfuscation Complete.\n...Running output");

            string FileNameP = Path.Combine(ProjectDir, $"Lua/LuaJIT.exe");
            var os = Environment.OSVersion;

            if (os.Platform.ToString() == "Unix")
                FileNameP = "luajit";

            Process Proc = new Process
            {
                StartInfo =
                {
                    FileName = FileNameP,
                    Arguments = $"{Path.Combine(Dir, @"output.lua")}",
                    RedirectStandardOutput = true
                }
            };
            Proc.Start();
            Proc.WaitForExit();
            var Data = Proc.StandardOutput.ReadToEnd().Replace("\r\n","");
            TestContext.Progress.WriteLine($"Output : {Data}");
            Directory.Delete(Dir, true);
            string[] ReturnVal =
            {
                Output,
                Data,
            };
            return ReturnVal;
        }

        [Test]
        public void Obfuscation()
        {
            var Settings = new ObfuscationSettings
            {
                
            };

            var Output = Obfuscate(Settings);
            // Console.WriteLine(Output[0]);
            Assert.AreEqual("72",Output[1]);
        }
        [Test]
        public void ObfuscationByteCode()
        {
            var Settings = new ObfuscationSettings
            {
                ByteCodeMode = "Symbols1"
            };
            string[] Output = Obfuscate(Settings);
            char[] allowedChars =
            {
                '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???',
                '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???',
                '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???',
                '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???', '???',
                '???', '???', '???', '???', '???', '???', '???', '???'
            };

            Assert.AreEqual((Output[0].IndexOfAny(allowedChars) >= 0), true);
        }
        [Test]
        public void ObfuscationError()
        {
            var Settings = new ObfuscationSettings
            {
                
            };

            var Output = Obfuscate(Settings,"print('\\[\\]')");
            // Console.WriteLine(Output[0]);
            Assert.AreEqual("72",Output[1]);
        }

        [Test]
        public void ObfuscationWithPremium()
        {
            var Settings = new ObfuscationSettings
            {
                PremiumFormat = true
            };

            var Output = Obfuscate(Settings);
            Assert.AreEqual("72",Output[1]);

        }
    }

}