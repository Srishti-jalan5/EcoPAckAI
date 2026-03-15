# EcoPackAI Backend Documentation

## Overview
EcoPackAI is an AI-powered sustainable packaging recommendation system designed to help businesses make environmentally friendly packaging choices. The backend module serves as the core of the application, providing RESTful API endpoints and business logic for generating packaging recommendations.

## Structure
The backend module is structured as follows:

- **src/**: Contains the source code for the backend application.
  - **routes/**: Defines the API endpoints.
    - `api.py`: Handles requests for product input, AI material recommendations, and environmental score computations.
  - **services/**: Contains business logic for the application.
    - `recommendation.py`: Generates packaging recommendations based on AI model predictions.
  - **models/**: Defines the database connection and schema.
    - `database.py`: Manages database interactions.
  - `app.py`: Initializes the Flask application and sets up routes.

## Setup Instructions
1. **Clone the repository**:
   ```
   git clone https://github.com/yourusername/ecopackai.git
   cd ecopackai/backend
   ```

2. **Install dependencies**:
   ```
   pip install -r requirements.txt
   ```

3. **Set up the database**:
   Ensure you have PostgreSQL installed and create a database for the application. Update the database connection settings in `src/models/database.py`.

4. **Run the application**:
   ```
   python src/app.py
   ```

5. **Access the API**:
   The API will be available at `http://localhost:5000/api`.

## Usage Examples
- **Get packaging recommendations**:
  ```
  POST /api/recommendations
  {
    "product": "example_product",
    "attributes": {
      "weight": 500,
      "dimensions": {
        "length": 30,
        "width": 20,
        "height": 10
      }
    }
  }
  ```

- **Get environmental score**:
  ```
  GET /api/environmental_score?material=example_material
  ```

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.