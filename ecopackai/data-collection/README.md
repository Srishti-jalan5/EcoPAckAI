# EcoPackAI Data Collection Module

This module is responsible for collecting data on eco-friendly packaging materials from various sources. It includes scrapers to fetch data, validators to ensure data integrity, and a main entry point to orchestrate the processes.

## Directory Structure

- **src/scrapers/index.py**: Contains functions for scraping eco-friendly material data from various sources. It defines methods to fetch and parse data into a structured format.
  
- **src/validators/index.py**: Includes validation functions to ensure the integrity and correctness of the scraped data. It checks for missing values and validates data types.
  
- **src/main.py**: Serves as the entry point for the data collection module. It orchestrates the scraping and validation processes, calling the appropriate functions from the scrapers and validators.

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   ```

2. Navigate to the data-collection directory:
   ```
   cd ecopackai/data-collection
   ```

3. Install the required dependencies:
   ```
   pip install -r requirements.txt
   ```

## Usage

To run the data collection process, execute the following command:
```
python src/main.py
```

This will initiate the scraping of eco-friendly material data and validate the collected data for integrity.