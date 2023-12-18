# get directory, files
# construct folders, filename(s)

proc createFiles*(path: string, contents: string): void =
    try:
        writeFile(path, contents)
    except CatchableError:
        echo "[ X ] writing to file failed"
