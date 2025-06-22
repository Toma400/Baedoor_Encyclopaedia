import std/strformat
import pixie

type
  SemiTransparentPixel = object
    x: int
    y: int
    a: uint8

proc `$` (p: SemiTransparentPixel): string =
  return fmt"Location: [X: {p.x}, Y: {p.y}] | Alpha: {p.a}"

proc countPixels(f: string): (int, int, int, int, seq[SemiTransparentPixel]) =
  # returns (img.x, img.y, px.scanned, px.nontransparent, list of semi-transparents)

  proc countX (modulo_res: int, row: int): int =
     if modulo_res != 0: return modulo_res
     else: return row
  proc countY (px: int, row: int): int =
     if px mod row == 0: return int(px / row)
     else:
       return int(px / row) + 1

  echo "Loading the the image..."
  let img = readImage(f)
  result[0] = img.width
  result[1] = img.height

  echo "Starting the scan..."
  let tenth = int(len(img.data) / 10)

  for i, px in img.data.mpairs():
    result[2] += 1

    if px.a == 255:
       result[3] += 1
    elif px.a > 0:
       result[4].add(SemiTransparentPixel(x: countX(i mod img.width, img.width), y: countY(i, img.width), a: px.a))

    let prog = i mod tenth
    if prog == 0:
       echo fmt"Progress: {(i / tenth) * 10}%"

while true:
  echo "Put filename below to scan its pixels ratio (must be .png). Click enter to exit."
  let f = readLine(stdin)
  if f == "": break
  try:
    let res = countPixels(f)
    echo fmt"Image scanned. The file data: [resolution: {res[0]}x{res[1]}, pixels: {res[0]*res[1]}]"
    echo fmt"Pixels scanned: {res[2]} | Non-transparent pixels: {res[3]}"
    if len(res[4]) > 0:
       echo fmt"Semi-transparent pixels found! Number: {len(res[4])}. Do you want for detailed list? (y/n)"
       let ch = readLine(stdin)
       if ch == "y":
          for stp in res[4]:
             echo stp
  except:
    echo "An error occured. Please check if the filename was correct."
    discard readLine(stdin)