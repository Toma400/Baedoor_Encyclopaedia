import std/private/osdirs
import std/strutils

const FOLDERS = [
    "Langue",
    "Loreum",
    "Mechanicum",
    "Scribae"
]
const CSINFO = ["disabled", "enabled"]

var cs     = true # case sensitivity
var search : string
var files  : seq[string]

while true:
    echo "Perform search for exact word. Case sensitive mode: " & CSINFO[cs.int] & " (use * to switch)"
    search = readLine(stdin)
    if search == "": break # allows for quitting search by pressing Enter
    if search == "*":
        cs = not cs
        continue

    for FOLD in FOLDERS:
        for res in walkDirRec(FOLD, relative=true):
            if endsWith(res, ".md"):
                let FN = FOLD & "\\" & res # filename
                let FR = readFile(FN)
                if cs: # capitalised
                    if search in FR:
                        add(files, FN)
                else: # non-capitalised
                    if toLower(search) in toLower(FR):
                        add(files, FN)

    for ITEM in files:
      echo "- " & ITEM

    echo "Search finished with " & $len(files) & " files found. Press Enter to search for another word."
    if readLine(stdin) != "": break
    files = newSeq[string]()

