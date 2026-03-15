from scrapers.index import scrape_data
from validators.index import validate_data

def main():
    # Step 1: Scrape data
    raw_data = scrape_data()
    
    # Step 2: Validate data
    valid_data = validate_data(raw_data)
    
    # Step 3: Process valid data (e.g., save to database or file)
    if valid_data:
        print("Data collection successful. Valid data ready for processing.")
    else:
        print("Data validation failed. Please check the scraped data.")

if __name__ == "__main__":
    main()