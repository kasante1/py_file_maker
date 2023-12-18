import std/os
from writer import createFiles
from validator import validateDir, validateFile, makeDirectory
from contents import pythonFileContents


proc projectFilesTemplate*(fileNames:seq): void = 
    for files in fileNames:    
      let (pathExists, argsPath) = validateFile(files)

      if pathExists == false and os.isValidFilename(argsPath) == true:
        createFiles(argsPath, pythonFileContents)
 
