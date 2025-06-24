from bs4 import BeautifulSoup
import requests

# Gitea download page link
url = 'https://dl.gitea.com/gitea/'

response = requests.get(url)

# checking for site responses with the 200 code
if response.status_code == 200:
    soup = BeautifulSoup(response.text, 'html.parser')
    last_version = soup.find('span')
    num_version = last_version.text
    print(num_version)
else: print(f'Error {response.status_code}')