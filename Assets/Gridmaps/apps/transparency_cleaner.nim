import std/private/oscommon
import std/strformat
import std/strutils
import pixie

proc cleanImage (file_path: string, tresh: uint8): (int, int) =
  # pixels with (below, above)
  echo "Loading the image..."
  let img  = readImage(file_path)
  let copy = newImage(img.width, img.height)

  echo "Starting the scan..."
  let tenth = int(len(img.data) / 10)

  for i, px in img.data.mpairs():
    var cl = rgba(px)
    if cl.a < tresh and cl.a != 0:
       cl.a = 0
       result[0] = result[0] + 1
    elif cl.a >= tresh and cl.a != 255:
       cl.a = 255
       result[1] = result[1] + 1
    copy.data[i] = rgbx(cl)
    let prog = i mod tenth
    if prog == 0:
       echo fmt"Progress: {(i / tenth) * 10}%"
  echo "Scan finished. Saving the clean copy..."
  copy.writeFile(file_path.replace(".png", "_clean.png"))

proc isDigit(s: string): bool =
  for ch in s:
    if isDigit(ch) == false: return false
  return true

echo """
============================
Transparency Cleaner
by Toma400
============================
"""
var def_tr: uint8 = 127
echo "Set the transparency treshold that will be used for the tool (between 1 and 254). Click enter to use default middle (127)."
let tr = readLine(stdin)
if isDigit(tr):
  def_tr = uint8(parseInt(tr))

while true:
  echo "Enter the filename (with extension) below to scan it for transparent pixels. Only .png files can be scanned for now. Click enter to exit."
  let p = readLine(stdin)
  if p == "":
    quit()
  if fileExists(p) and p.endsWith(".png"):
    let sc = cleanImage(p, def_tr)
    echo fmt"Clean image -{p}- made. Cleaned {sc[0] + sc[1]} pixels, making {sc[0]} transparent and {sc[1]} opaque."
  else: echo fmt"No file -{p}- in this directory."
  echo "-----"