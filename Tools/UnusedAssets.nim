import std/private/osdirs
import std/strformat
import std/sequtils
import std/strutils
import std/paths
import std/os

const FOLDERS = [
    "Langue",
    "Loreum",
    "Mechanicum",
    "Scribae"
]
const NOSCAN = [
    # asset subfolders (or items, must include subfolder path) to not be scanned
    "Gridmap/legend",
    "Refs",
    "Archives"
]
const NOEXT = [
    # asset extensions to skip
    ".kra~",
    ".png~"
]

const SEARCH = "Assets"
const VER    = 0.1

var allas : seq[string] # asset list
var un_as : seq[string] # unused assets
var ms_as : seq[string] # misaligned assets (wrong capitalisation, format)

proc unifyPath(p: Path | string): string =
    return replace($p, r"\", "/")

echo fmt"""====================================================
UnusedAssets v{VER}
by Toma400
"""

while true:
    echo "Performing validation of asset files..."
    allas = toSeq(walkDirRec(SEARCH, relative=true))
    for asset in allas:
        var skip = false
        var occ  = 0     # number of occurences
        var brk  = 0     # broken link
        for nsub in NOSCAN:
            if startsWith(asset, nsub): skip = true
        for next in NOEXT:
            if endsWith(asset, next): skip = true
        if skip: continue # skips the further search
        echo fmt"Processing: {asset}"
        for FOLD in FOLDERS: # check non-asset folders/files for occurences
          for file in walkDirRec(FOLD, relative=true):
              let FR = readFile(fmt"{FOLD}\{file}")
              if unifyPath(asset) in FR:
                  occ += 1
              else: # rereads to ensure:
                # - capitalisation (toLower match)
                # - correct extension (no type check)
                if toLower(unifyPath(changeFileExt(Path(fmt"{SEARCH}\{asset}"), ""))) in toLower(FR):
                  brk += 1

        if occ == 0 and brk == 0: # 'brk' indicates usage
            add(un_as, asset)
        if brk > 0:
            add(ms_as, asset)
    echo "===================================================="
    echo "Processed asset files!"
    echo "===================================================="
    echo "Unused assets:"
    for a in un_as:
        echo fmt"- {a}"
    echo "Broken links: [BROKEN!]"
    for a in ms_as:
        echo fmt"- {a}"
    echo "Click any button to finish the program."
    discard readLine(stdin)
    break

# broken link paths