# check if the directory argument
# supplied is not in existence
# check if the filename(s) are not in existence

import std/os

# get cwd

proc getCwd():string =
  return os.getCurrentDir()



proc validateFile*(args: string, cwd = getCwd()):(bool, string) =
    let fileArgs: string = os.joinPath(cwd, args)
    let filePath: string = os.addFileExt(fileArgs, "py")
    let isFileExists: bool = os.fileExists(filePath)
    return (isFileExists, filePath)


proc makeDirectory*(filePath: string): void = 
    try:
        os.createDir(filePath)
    except CatchableError:
        echo "create project directory failed"


proc validateDir*(argsDir: string, cwd = getCwd()):(bool, string) =

    let dirArgs = os.joinPath(cwd, argsDir)
    let isDirExists: bool = os.dirExists(dirArgs)
    if isDirExists == false:
      return (false, dirArgs)
    return (true, dirArgs)

