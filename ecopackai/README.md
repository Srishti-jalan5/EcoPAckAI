# EcoPackAI

EcoPackAI is an AI-powered sustainable packaging recommendation system designed to help businesses make environmentally friendly packaging choices. This project integrates data collection, machine learning, a Flask backend, a frontend UI, and a BI dashboard to provide a comprehensive solution for sustainable packaging recommendations.

## Project Structure

```
ecopackai
├── data-collection       # Module for collecting eco-friendly material data
│   ├── src
│   │   ├── scrapers      # Contains web scrapers for data collection
│   │   ├── validators     # Contains data validation functions
│   │   └── main.py       # Entry point for data collection
│   ├── requirements.txt   # Dependencies for data collection
│   └── README.md          # Documentation for data collection module
├── ml-model              # Module for machine learning model
│   ├── src
│   │   ├── models        # Contains AI recommendation model logic
│   │   ├── preprocessing  # Data preprocessing functions
│   │   ├── training      # Model training functions
│   │   └── main.py       # Entry point for machine learning module
│   ├── requirements.txt   # Dependencies for machine learning
│   └── README.md          # Documentation for machine learning module
├── backend               # Flask backend module
│   ├── src
│   │   ├── routes        # REST API endpoints
│   │   ├── services      # Business logic for recommendations
│   │   ├── models        # Database connection and schema
│   │   └── app.py        # Entry point for Flask app
│   ├── requirements.txt   # Dependencies for backend
│   └── README.md          # Documentation for backend module
├── frontend              # Frontend UI module
│   ├── src
│   │   ├── components    # React components for UI
│   │   ├── pages         # Main page of the frontend
│   │   └── main.jsx      # Entry point for frontend app
│   ├── package.json       # Dependencies for frontend
│   └── README.md          # Documentation for frontend module
├── dashboard             # BI dashboard module
│   ├── src
│   │   ├── components    # React components for dashboard
│   │   ├── pages         # Main page of the dashboard
│   │   └── main.jsx      # Entry point for dashboard app
│   ├── package.json       # Dependencies for dashboard
│   └── README.md          # Documentation for dashboard module
└── README.md              # Overview of the entire EcoPackAI project
```

## Getting Started

To set up the EcoPackAI project locally, follow these steps:

1. **Clone the repository:**
   ```
   git clone <repository-url>
   cd ecopackai
   ```

2. **Install dependencies:**
   - For each module (data-collection, ml-model, backend, frontend, dashboard), navigate to the respective directory and install the required dependencies listed in the `requirements.txt` or `package.json` files.

3. **Run the application:**
   - Start the backend server:
     ```
     cd backend/src
     python app.py
     ```
   - Start the frontend application:
     ```
     cd frontend
     npm start
     ```
   - Start the dashboard application:
     ```
     cd dashboard
     npm start
     ```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.