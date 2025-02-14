import requests
from bs4 import BeautifulSoup as bs
import sys

base_url= "https://en.wikipedia.org/wiki/"
    
def wiki_main_page():
    #print(sys.argv,len(sys.argv))

    # wiki_mainPageUrl = base_url + "Main_Page"

    global incrct_params 
    incrct_params = False
    for i in sys.argv:
        if i!= sys.argv[0] and i != '-dyk' and i != '-fp' and i != '-otd':
            incrct_params = True
            print('''
    Incorrect params provided
    Please use -all for requesting all info
    Use -dyk for Do you know section
    Use -otd for On this Day information
    User -fp for featured picture info
    Not providing any params also gets basic info ( Featured Article )
    You can also use any combination of the above to get the required info
    ''')
            return

    print()
    print("Searching for daily articles on Wiki main page")
    print()

     #use the requests module to get the html content
    response = requests.get(base_url).content

    #create a beautiful soup object so that we can query the required information
    bsObject = bs(response,features="html.parser")
    all = len(sys.argv) > 1 and sys.argv[1] == "-all"


    if(len(sys.argv) >= 1 or all):
        #getting the featured article section
        featured_article = bsObject.find(class_="MainPageBG mp-box").find('p')
        print(f"\033[38;2;32;218;119m{featured_article.text.replace("(Full article...)","")}\033[0m")
    
    if(all or sys.argv.count('-dyk') == 1):
    #getting the Did you know section
        print()
        print(f"\033[38;2;253;252;254m{'Did You Know ?'}\033[38;2;121;228;231m")
        print()
        dyk_points =  bsObject.find(id='mp-dyk').find('ul').find_all('li')
        for point in dyk_points:
            print(point.text)
            print()
    if(all or sys.argv.count('-fp') == 1):
        #getting the lower featured picture info
        print(f"\033[38;2;253;252;254m{"From Today's featured Picture Info"}\033[38;2;121;228;231m")
        featured_picture_info = bsObject.find(id='mp-lower').find('p')
        print(f"\033[38;2;32;218;119m{featured_picture_info.text.replace("(Full article...)","")}\033[0m")
    
    if(all or sys.argv.count('-otd') == 1):
        #getting On this Day info
        print(f"\033[38;2;253;252;254m{"On This Day"}\033[38;2;121;228;231m")
        print()
        otd = bsObject.find(id='mp-otd').find('ul').findAll('li')
        for point in otd:
            print(point.text)
            print()

def spec_data():
    if(len(sys.argv) > 1):
        search_term = str(sys.argv[1])
        print(f"Your search term is {sys.argv[1]}")
        print("Searching Wikipedia database")
        url = base_url + search_term

        html = requests.get(url).content
        data = bs(html,features="html.parser")
        all_content = data.find(id="mw-content-text")

        note = all_content.find(role="note")
        note_links = note.find_all('a')
        title = data.find(id="firstHeading").get_text()
        table_rows = all_content.find_all('tr')
        Genre = table_rows[3].find('td').text

        print(f"Anime: {title}")
        print(f"Genre: {Genre.replace('[1]',',')}")
        print()
        for a in note_links:
            # print(a.get('href'))
            print(a.get_text())
    else:
        print("Please enter a serach term as an argument")

wiki_main_page()