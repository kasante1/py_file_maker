import std/os
from writer import createFiles
from validator import validateDir, validateFile, makeDirectory
from contents import pythonFileContents


proc projectFilesTemplate*(fileNames:seq): void = 
    for files in fileNames:
        try:    
            let (pathExists, argsPath) = validateFile(files)

            if pathExists == false:
                createFiles(argsPath, pythonFileContents)
            else:
                echo "[ X ] - " & argsPath & " - exists!"
        except CatchableError as err:
            echo err.msg
