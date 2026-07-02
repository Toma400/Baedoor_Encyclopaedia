from os.path import getsize, exists
from os import remove
import requests

DOCS = {
    # general
    "Lore Primer.pdf":                     "https://docs.google.com/document/d/1HYiXiSu3eDrKNwJxIkoAMJmHsUnIPbBKymwdrVUFVyM/export?format=pdf",
    "Baedoor Magic.pdf":                   "https://docs.google.com/document/d/1DBIKW8WJfT-L35NVFz3ZjRxLLa7WyV39IT9xK39N4Jw/export?format=pdf",
    "Baedoor Cosmology.pdf":               "https://docs.google.com/document/d/1qlq_KB4K4VfL8syNy_WAkAjNMmiRM4jQArdsBxzO63U/export?format=pdf",
    "Baedoor Races & Cultures.pdf":        "https://docs.google.com/document/d/1itSKgTiDL64FAORqbt9okpvv0vanCxrQZETVF3d6350/export?format=pdf",
    # baedoorians
    "Baedoor Island Regions.pdf":          "https://docs.google.com/document/d/1iAm7cgAdXASGp59WtBIVUJzXtk8kM8onvP3Ipc-zhYw/export?format=pdf",
    "Baedoor Island History.pdf":          "https://docs.google.com/document/d/1oTYVx0SSAY5yDAPQAGF8iYhda2pfay-GMpLO9uQdzYk/export?format=pdf",
    "Ansur Megadoc.pdf":                   "https://docs.google.com/document/d/1Wnqy_b-xHs4IbnqHv82h26AEgCbl5CMJRfnHfu8j8QI/export?format=pdf",
    # goblins
    "Goblins Megadoc.pdf":                 "https://docs.google.com/document/d/1odqSXnZXhanO7WpNob59066HJKGNfmvIQ2xRj-_jGF4/export?format=pdf",
    # erds
    "Erdic Megadoc.pdf":                   "https://docs.google.com/document/d/1r363t4fwMEPEzP8dQMidX3nHc3FsnesdcnCzdnQNDPg/export?format=pdf",
    "Erdic Philosophy & Spiritualism.pdf": "https://docs.google.com/document/d/1iMKfX00HUoB9cIDj_HBhTJOM4X9OuWtksxwfL_38E-E/export?format=pdf",
    "Erdis.pdf":                           "https://docs.google.com/document/d/14UvLjdrwHZYTowS0YWK61CkySBULTdz3lF5yC8Pb5Uc/export?format=pdf",
    # rossevette
    "Lai-Kine Religion.pdf":               "https://docs.google.com/document/d/18GTz8W-N58G3glFdjthv7OxwXE04SDP2_SqC-ajZ_4M/export?format=pdf",
    "Cult of the Smiling God.pdf":         "https://docs.google.com/document/d/1fbFPZQ6c12nke-n4xCDXVGG1OVIyOpQ_5EfNvXBGkPc/export?format=pdf",
    "Historical Account of Latoka.pdf":    "https://docs.google.com/document/d/12JSm3TyPybiWG95AjuDo6ZSo6D-HxHw4vzdXCpQpBRE/export?format=pdf",
    # dyalnesi
    "Dyalnesi Deities.pdf":                "https://docs.google.com/document/d/1N1q2gWGv6wppPlvksa5M5zVJedY5vKjrkKLPOMg-FaM/export?format=pdf",
    # books
    "Book - Southern Islands.pdf":         "https://docs.google.com/document/d/11yRsKR9pXck4e50ZQAa7vALe4ghPmJiebQY-IdLGf58/export?format=pdf",
    "Book - Origins of Eastern Tri.pdf":   "https://docs.google.com/document/d/1vzBuvjvWgRHYwLC7JP4GjiZfo66AArjq439w3fdE3x0/export?format=pdf",
    "Book - Pahtric Religious Text.pdf":   "https://docs.google.com/document/d/1o_ptIspeCuj4hU2D6CxX5m5b6pKTIyhTMCm2sRqIfTI/export?format=pdf",
    # other
    "FSAM Dialogues.pdf":                  "https://docs.google.com/document/d/1TGVL16VUYjGt6ezZAx7Ow440BU5eFkRi5T95E8U3hng/export?format=pdf",
    "Lore Issues.pdf":                     "https://docs.google.com/document/d/1yVKL89tu0rjsOJHpM9oSLCK1BtVpOscQ7yJWiU8V3vM/export?format=pdf",
    "Rev's Worldbuilding Questions.pdf":   "https://docs.google.com/document/d/1S9M-lykYW7in-PHx1-ADrIggCdQKR2_CqYs2mmXiqPo/export?format=pdf",
}
OUT  = "../Docs/"
TEMP = "__"

def downloadDocs():
    needle = 1
    print(f"Processing {len(DOCS)} docs...")
    for file, link in DOCS.items():
        # print(f"Processing docs: {needle}/{len(DOCS)}")
        state    = "No change" # default
        response = requests.get(link)
        if response.status_code == 200:
            if exists(OUT + file): # check for OG file existence, so can check for changes
                # making TEMP file for comparison
                with open(OUT + TEMP + file, 'wb') as t:
                    t.write(response.content)
                # if byte size differs (easy git diff), overwrite OG file
                if getsize(OUT + TEMP + file) != getsize(OUT + file):
                    with open(OUT + file, 'wb') as f:
                        f.write(response.content)
                    state = "Updated"
                remove(OUT + TEMP + file) # removes temp file
            else: # if OG file doesn't exist, just creates it
                with open(OUT + file, 'wb') as f:
                    f.write(response.content)
                state = "Created"
            print(f"Processed doc: {needle}/{len(DOCS)} [{state}] | {file} ")

        else:
            print(f'Error downloading Google Doc: {file} | Error code: {response.status_code}')
        needle += 1


##############################################
# delete docs (not LE folder!)
downloadDocs()
# do .git check
#  - add >100MB files to gitignore
#  - make .zip files for those??? (and check if they are not over 100MB either lol)
# commit Docs folder