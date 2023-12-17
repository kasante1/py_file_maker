# check if the directory argument
# supplied is not in existence
# check if the filename(s) are not in existence

import std/os

# get cwd

proc getCwd():string =
  return os.getCurrentDir()

proc validateDirFile*(args: string, argsDir = "", cwd = getCwd()):(bool, string) =

  if argsDir == "":
      let checkDirFileArgs = os.joinPath(cwd, args)
      let isDirExists: bool = os.dirExists(checkDirFileArgs)
      return (isDirExists, checkDirFileArgs)
  else:
       let checkDirFileArgs = os.joinPath(cwd, argsDir, args)
       let isDirExists: bool = os.dirExists(checkDirFileArgs)
       return (isDirExists, checkDirFileArgs)


# func validateFile*(fileArgs: string, cwd = getCwd()):bool =
#   let checkFile = os.
#   return os.dirExists(fileArgs)
