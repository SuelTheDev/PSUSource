export interface UserDataModel {
    discordId?:string;
    hwid?:string;
    timezone?:string;
    flags?:number;
    key?:string;
    forScript?:string;
}

export interface CrackLog {
    discordId:string;
    description:string;
    fromScript:string;
}

export interface SessionKeys {
    sessionKey?:string,
    forKey?:string,
}

export interface ScriptModel {
    ScriptName:string,
    ScriptHash:string,
    ScriptPath:string,
}

export interface ObfInterface {
    error:number,
    status:string,
    data:string
}
