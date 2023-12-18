# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
# import std/parseopt
import  docopt
import strutils
import std/os

from writer import createFiles
from validator import validateDirFile 

const doc = """
PyFileMaker! - create files for python programming

Usage:
  PyFileMaker! <filename>...
  PyFileMaker! [-d | --directory <directory>] [-f | --file <files>...]
  PyFileMaker! [-v | --version]
  PyFileMaker! [-h | --help]

Options:
  -d, --directory    Create files in this directory
  -f, --file         Supply filename(s)
  -h, --help         Show this message
  -v, --version      Show version


"""

proc main() =
  # This is needed to parse the docstring into the "args" object
  let args = docopt(doc, version = "PyFileMaker! 0.1.0")

  if args["<filename>"]:
    for files in @(args["<filename>"]):
      echo "creates $#" % files      
      let (pathExists, argsPath) = validateDirFile(files)

      if pathExists == false and os.isValidFilename(argsPath) == true:
        createFiles(argsPath, "hello")


  elif args["--directory"] and args["--file"]:
    echo "directory! :", $args["<directory>"], " file :", $args["<files>"]

    for file in @(args["<files>"]):
      echo "creates $#" % file      
      let (pathExists, argsPath) = validateDirFile(file, $args["<directory>"])

      if pathExists == false and os.isValidFilename(argsPath) == true:
        echo "argPath" & argsPath
        createFiles(argsPath, "hello world!")
        

when isMainModule:
  main()

