from writer import createFiles
from validator import validateDir, validateFile, makeDirectory
from contents import pythonFileContents



proc directoryTemplate*(directory: string, files: seq):void =
    
    let (pathExists, dirPath) = validateDir(directory)

    if pathExists == false:
      makeDirectory(dirPath)
      for file in @(files):
        
        let (fileExists, newFilePath) = validateFile(file, dirPath)
        
        if fileExists == false:
          createFiles(newFilePath, pythonFileContents)

