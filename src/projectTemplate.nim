from writer import createFiles
from validator import validateDir, validateFile, makeDirectory
from contents import pythonFileContents



proc directoryTemplate*(directory: string, files: seq):void =
    try:
      let (pathExists, dirPath) = validateDir(directory)

      if pathExists == false:
        makeDirectory(dirPath)
        for file in @(files):
          
          let (validFile, newFilePath) = validateFile(file, dirPath)
          
          if validFile == false:
            createFiles(newFilePath, pythonFileContents)
          else:
            echo "[ X ] file already exists"
    except CatchableError as err:
      echo err.msg
        

