import std/private/osdirs
import std/strutils

const FOLDERS = [
    "Langue",
    "Loreum",
    "Mechanicum",
    "Scribae"
]

var search : string
var files  : seq[string]

while true:
    echo "Perform search for exact word:"
    search = readLine(stdin)
    if search == "": break # allows for quitting search by pressing Enter

    for FOLD in FOLDERS:
        for res in walkDirRec(FOLD, relative=true):
            if endsWith(res, ".md"):
                let FN = FOLD & "\\" & res # filename
                if search in readFile(FN):
                    add(files, FN)

    for ITEM in files:
      echo "- " & ITEM

    echo "Search finished with " & $len(files) & " files found. Press Enter to search for another word."
    if readLine(stdin) != "": break
    files = newSeq[string]()

