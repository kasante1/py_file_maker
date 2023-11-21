# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
# import std/parseopt
import  docopt
import strutils

const doc = """
PyFileMaker! - create files for python programming

Usage:
  PyFileMaker! file <filename>...
  PyFileMaker! [dir] <directory> file <filename>
  PyFileMaker! [-v | --version] 
  PyFileMaker! [-h | --help]

Options:
  dir    Create file(s) in this directory
  -v --version      Show version


"""

proc main() =
  # This is needed to parse the docstring into the "args" object
  let args = docopt(doc, version = "PyFileMaker! 0.1.0")

  if args["file"]:
     for files in @(args["<filename>"]):
       echo "creates $#" % files

  elif args["dir"] and args["file"]:
    echo "directory! :", $args["<directory>"], " file :", $args["<filename>"]



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
#!/usr/bin/python3


# def main(name):
#  """ brief function description
#      
#     Args:
#         name: return name
#     Raises:
#          ValueError: when name is not a string
# """
#    name_charaters = len(name)
#    greeting = f"hello, {name}.\n your name has {name_characters} characters.
#    return len(name)


# class Aclass:
# """ doc string here """
#     def __init__(self, initializer):
#         self.initializer = initializer
#     
#     def action(walk, jump):
#         """
#          Do something
#
#         :parm walk: str walk
#         :param jump str jump
#          
#         """
#          actions = f" {walk} and {jump} "


# if __name__ == "__main__":
#     main(name)
