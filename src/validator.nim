# check if the directory argument
# supplied is not in existence
# check if the filename(s) are not in existence

import std/os

# get cwd

proc getCwd():string =
  return os.getCurrentDir()



func checkFileName(fileName: string): bool = 
  ## check the validity of the file name format
  let validateFileName = os.isValidFilename(fileName)
  if validateFileName == false:
    raise newException(ValueError, " [ X ] invalid filename format")
  return validateFileName




proc validateFile*(args: string, cwd = getCwd(), checkFileName = checkFileName):(bool, string) =
    ## check if the file does not conflict with a file in existence
    ## check of the file name format is valid
    let fileArgs: string = os.joinPath(cwd, args)
    let filePath: string = os.addFileExt(fileArgs, "py")
    
    try:
      let validFileName: bool = checkFileName(filePath)
      if validFilename == true:
        let isFileExists: bool = os.fileExists(filePath)
        return (isFileExists, filePath)
    except ValueError as e:
      echo e.msg



proc makeDirectory*(filePath: string): void = 
    try:
        os.createDir(filePath)
    except CatchableError:
        echo "[ X ] create project directory failed"


proc validateDir*(argsDir: string, cwd = getCwd()):(bool, string) =

    let dirArgs = os.joinPath(cwd, argsDir)
    let isDirExists: bool = os.dirExists(dirArgs)
    if isDirExists == true:
      raise newException(ValueError, "[ X ] directory already exists!")
    return (false, dirArgs)
    

