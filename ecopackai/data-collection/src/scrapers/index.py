import requests
from bs4 import BeautifulSoup
import pandas as pd

def fetch_material_data(url):
    response = requests.get(url)
    if response.status_code == 200:
        return response.text
    else:
        raise Exception(f"Failed to fetch data from {url}")

def parse_material_data(html):
    soup = BeautifulSoup(html, 'html.parser')
    materials = []
    
    # Example parsing logic (to be customized based on actual HTML structure)
    for item in soup.find_all('div', class_='material-item'):
        name = item.find('h2').text
        description = item.find('p').text
        materials.append({
            'name': name,
            'description': description
        })
    
    return pd.DataFrame(materials)

def scrape_materials(urls):
    all_materials = pd.DataFrame()
    for url in urls:
        html = fetch_material_data(url)
        materials = parse_material_data(html)
        all_materials = pd.concat([all_materials, materials], ignore_index=True)
    
    return all_materials

# Example usage
if __name__ == "__main__":
    urls = [
        'https://example.com/materials1',
        'https://example.com/materials2'
    ]
    materials_df = scrape_materials(urls)
    print(materials_df)