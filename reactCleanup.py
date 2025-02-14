import sys
import os
from colorama import Fore,Back,init

init(autoreset=True)

error = Fore.RED
success = Fore.GREEN

if(len(sys.argv)) == 1:
    print("Usage python reactCleanup.py '$(pwd)'")
    exit(1)

curr_dir = sys.argv[1]
dir = os.listdir(path=sys.argv[1])

def is_ReactFolder():
    for file in dir:
        if file == "node_modules":
            return True
    return False

main_file=''
app_css = ''
root_file = ''

replace_content=''
src_dir = curr_dir + "/src"
if(is_ReactFolder()):
    for file in os.listdir(curr_dir+"/src"):
        if file == "App.jsx" or file == "App.tsx":
            main_file=file
        if file == "App.css":
            app_css = file
        if file == "main.jsx" or file == "main.tsx":
            root_file = file

    # cleanup App.jsx or App.tsx file
    with open(src_dir + "/" + main_file, "r") as jsx:
        for line in jsx.readlines():
            if 'reactLogo' not in line and 'viteLogo' not in line:
                replace_content += line
            if 'return' in line:
                replace_content += '''            <>
                <h1>Hello World</h1>
            </>
        )
    }
  export default App
                '''
                break
    with open(src_dir + "/" + main_file, "w") as jsx:
        jsx.write(replace_content)
    print(success + f"{main_file} content cleaned")

    # cleanup App.css file
    css_reset = '''
    *{
        margin:0;
        padding:0;
        box-sizing:border-box;
    }
    '''
    with open(src_dir + "/" + app_css, "w") as css:
        css.write(css_reset)
    print(success + f"{app_css} content cleaned")

    #cleanup main.jsx or main.tsx file 
    replace_content = ''
    with open(src_dir + "/" + root_file, "r") as jsx:
        for line in jsx.readlines():
            if "./index.css" not in line:
                replace_content += line
    
    with open(src_dir + "/" + root_file,"w") as jsx:
        jsx.write(replace_content)
    
    print(success + f"{root_file} content cleaned")

    #delete index.css
    os.remove(src_dir + "/" + "index.css")

    #delete vite svg and react svg
    os.remove(src_dir + "/assets/" + "react.svg")
    os.remove(curr_dir + "/public/" + "vite.svg")

    print(success + "SVG's deleted")



else:
    print(error + "Not a React folder")
    print(error + "Please cd into a React folder and then run script")
    print(error + "Exiting...")
    