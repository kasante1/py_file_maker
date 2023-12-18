import  docopt
import std/os

from projectTemplate import directoryTemplate
from createFileTemplate import projectFilesTemplate

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
    projectFilesTemplate(@(args["<filename>"]))


  elif args["--directory"] and args["--file"]:
    directoryTemplate($args["<directory>"], @(args["<files>"]))


when isMainModule:
  main()

