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


proc makeDir(filePath: string): void = 
    try:
        os.createDir(filePath)
    except CatchableError:
        echo "create project directory failed"


proc validateDirFile*(argsDir: string, cwd = getCwd()):(bool, string) =

  if argsDir == "":
    let fileArgs: string = os.joinPath(cwd, args)
    let (fileExists, filePath) = validateFile(fileArgs)
    return (fileExists, filePath)
  else:
    let dirArgs = os.joinPath(cwd, argsDir)
    let isDirExists: bool = os.dirExists(dirArgs)
    if isDirExists == false:
        makeDir(dirArgs)
        let y = os.joinPath(dirArgs, args)
        let (v, kk) = validateFile(y)
        if v == false:
            return (isDirExists, kk)

    return (true, dirArgs)


# func validateFile*(fileArgs: string, cwd = getCwd()):bool =
#   let checkFile = os.
#   return os.dirExists(fileArgs)
