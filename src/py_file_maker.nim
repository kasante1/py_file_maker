# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
# import std/parseopt
import  docopt
const doc = """
CoolSeq - a program to do things

Usage:
  args_docopt status
  args_docopt list
  args_docopt analyse <directory> <database> [-o|--output=<outputFile>]

Options:
  status                      Check API Status
  list                        Check Result List
  convert                     Upload Images, convert to PDF and download result.pdf
  <directory>                 Specify directory with input files
  <database>                  Reference database
  -o, --output=<outputFile>   Output filename [default: result.bam]
"""

proc main() =
  # This is needed to parse the docstring into the "args" object
  let args = docopt(doc, version = "1.0")

  if args["status"]:
    echo "So you want to know the status! OK!"
  if args["list"]:
    echo "This is the list... finished!"
  if args["analyse"]:
    echo "CONVERTING:"
    echo "Directory: ", $args["<directory>"]
    echo "Reference: ", $args["<database>"]
    echo "Output:    ", $args["--output"] # note the default!

when isMainModule:
  main()
# when isMainModule:
  # echo("Hello, World!")

  # var p = initOptParser("-a c -e:5 --foo --bar=20 file.txt")

  # while true:
  #   p.next()

  #   case p.kind
  #   of cmdEnd: break
  #   of cmdShortOption:
  #     echo "short options -> ", p.key, ",", p.val
  #   of cmdLongOption:
  #     if p.val == "":
  #       echo "option: ", p.key
  #     else:
  #         echo "option and value: ", p.key, ", ", p.val
  #   of cmdArgument:
  #     echo "arguments: ", p.key
