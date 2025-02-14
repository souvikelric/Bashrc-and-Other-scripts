import json
import os
from pathlib import Path
import random

pictures_folderPath = r'C:\Users\s.s.roy.chowdhury\OneDrive - Accenture\Desktop\scripts\terminalBackgrounds'
file_path = r'C:\Users\s.s.roy.chowdhury\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json'

picture_list  = os.listdir(pictures_folderPath)
# print(random.randrange(0,len(picture_list)))
randomPicture = picture_list[random.randrange(0,len(picture_list))]
# print(randomPicture)

p = Path(pictures_folderPath,randomPicture)
# print(p)

with open(file_path,'r') as file:
    data = json.load(file)


git_profile = list(data["profiles"]["list"])[-1]


data["profiles"]["list"][-1]["backgroundImage"] = str(p)
# print(data["profiles"]["list"][-1])
# print(randomPicture)

with open(file_path,'w') as file:
    json.dump(data,file,indent=4)