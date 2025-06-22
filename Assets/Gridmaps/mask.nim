import std/strformat
import std/strutils
import pixie

while true:
  echo "Write filename of base image. It will be the one that will guide how to cut the mask."
  let img1s = readLine(stdin)
  echo "Write filename of mask image. Its contents will be cut based on base image."
  let img2s = readLine(stdin)

  try:
     echo "Loading the images..."
     let img1 = readImage(img1s) # base
     let img2 = readImage(img2s) # mask

     echo "Starting the scan..."
     if img1.width != img2.width or img1.height != img2.height:
        echo "Images are not equal. Stopping the scan."
        continue
     let img3 = newImage(img1.width, img1.height)
     let tenth = int(len(img1.data) / 10)

     for i1, px in img1.data.mpairs():
       if px.a == 0:
         img3.data[i1] = img1.data[i1] # transparent (from base)
       else:
         img3.data[i1] = img2.data[i1] # solid (from mask)

       let prog = i1 mod tenth
       if prog == 0:
         echo fmt"Progress: {(i1 / tenth) * 10}%"

     img3.writeFile(img2s.replace(".png", "_mask.png"))
     echo "Successfully made a masked image. Click enter to continue."
     discard readLine(stdin)
     echo "-----"
  except:
     echo "Error occured. Please check if filenames were correct."

