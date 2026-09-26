import std/private/osdirs
import std/strformat
import std/strutils
import std/re

const FOLDERS = [
    "Langue",
    "Loreum",
    "Mechanicum",
    "Scribae"
]
const CSINFO = ["disabled", "enabled "] # case sensitivity
const EXINFO = ["disabled", "enabled "] # exact search (RegEx check)
const VER    = 0.2

var cs     = true  # case sensitivity
var ex     = false # exact search (RegEx check)
var search : string
var files  : seq[string]

echo fmt"""====================================================
ExactSearch v{VER}
by Toma400
"""

while true:
    echo fmt"""
    ====================================================
    Perform search for word in the repository.
    Case sensitivity | {CSINFO[cs.int]} (use * to switch)
    Exact search     | {EXINFO[ex.int]} (use ^ to switch)
    ====================================================
    """.dedent()
    search = readLine(stdin)
    if search == "": break # allows for quitting search by pressing Enter
    if search == "*":
        cs = not cs
        continue
    elif search == "^":
        ex = not ex
        continue

    echo "======================================================================================"
    for FOLD in FOLDERS:
        for res in walkDirRec(FOLD, relative=true):
            if endsWith(res, ".md"):
                let FN = FOLD & "\\" & res # filename
                let FR = readFile(FN)
                if cs: # case sensitive
                    if search in FR:
                        if ex: # nested to minimise RegEx cost
                          if find(FR, re(r"\b" & search & r"\b")) == -1:
                            continue # skips adding the result if not found exact match
                        add(files, FN)
                else: # case insensitive
                    if toLower(search) in toLower(FR):
                        if ex: # nested to minimise RegEx cost
                          if find(toLower(FR), re(r"\b" & toLower(search) & r"\b")) == -1:
                            continue # skips adding the result if not found exact match
                        add(files, FN)

    for ITEM in files:
      echo "- " & ITEM

    echo fmt"""
    Search finished with {len(files)} files found. Press Enter to search for another word.
    ======================================================================================
    """.dedent()
    discard readLine(stdin)
    files = newSeq[string]()

