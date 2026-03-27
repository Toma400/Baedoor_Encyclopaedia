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
    "Historical Account of Latoka.pdf":    "https://docs.google.com/document/d/12JSm3TyPybiWG95AjuDo6ZSo6D-HxHw4vzdXCpQpBRE/export?format=pdf",
    # dyalnesi
    "Dyalnesi Deities.pdf":                "https://docs.google.com/document/d/1N1q2gWGv6wppPlvksa5M5zVJedY5vKjrkKLPOMg-FaM/export?format=pdf",
    # other
    "Rev's Worldbuilding Questions.pdf":   "https://docs.google.com/document/d/1S9M-lykYW7in-PHx1-ADrIggCdQKR2_CqYs2mmXiqPo/export?format=pdf",
}
OUT = "../Docs/"

def downloadDocs():
    needle = 1
    for file, link in DOCS.items():
        print(f"Processing docs: {needle}/{len(DOCS)}")
        response = requests.get(link)
        if response.status_code == 200:
            with open(OUT + file, 'wb') as f:
                f.write(response.content)
                #print('File saved to: {}'.format(OUT + file))
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