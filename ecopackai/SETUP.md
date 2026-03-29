# EcoPackAI - Complete Setup Guide

## Project Overview

**EcoPackAI** is an AI-powered sustainable packaging recommendation system with the following components:

- **Backend**: Flask REST API for recommendations
- **Frontend**: React UI for user interactions
- **Dashboard**: BI dashboard for analytics
- **ML Model**: AI model for packaging recommendations
- **Data Collection**: Module for collecting eco-friendly material data

---

## Prerequisites

Before starting, ensure you have the following installed on your system:

### 1. **Python 3.8 or higher**
   - Download from: https://www.python.org/downloads/
   - Verify installation:
     ```
     python --version
     ```

### 2. **Node.js and npm (v14 or higher)**
   - Download from: https://nodejs.org/
   - Verify installation:
     ```
     node --version
     npm --version
     ```

### 3. **PostgreSQL Database** (for backend)
   - Download from: https://www.postgresql.org/download/
   - Verify installation:
     ```
     psql --version
     ```

---

## Step-by-Step Setup Instructions

### **Step 1: Clone and Navigate to Project**

```bash
cd c:\Projects_AI\EcopackAI-PAckaging system\ecopackai
```

---

### **Step 2: Set Up Backend (Flask API)**

Navigate to the backend directory:
```bash
cd backend
```

#### 2.1 Create a Python Virtual Environment
```bash
python -m venv venv
```

#### 2.2 Activate the Virtual Environment
- **Windows (PowerShell)**:
  ```bash
  .\venv\Scripts\Activate.ps1
  ```
- **Windows (Command Prompt)**:
  ```bash
  venv\Scripts\activate.bat
  ```
- **Mac/Linux**:
  ```bash
  source venv/bin/activate
  ```

#### 2.3 Install Python Dependencies
```bash
pip install -r requirements.txt
```

**Installed packages:**
- Flask==2.1.2 (Web framework)
- psycopg2-binary==2.9.3 (PostgreSQL connector)
- Flask-Cors==3.0.10 (Cross-Origin Resource Sharing)
- requests==2.26.0 (HTTP library)
- numpy==1.21.2 (Numerical computing)
- pandas==1.3.3 (Data manipulation)
- marshmallow==3.13.0 (Data validation)
- gunicorn==20.1.0 (Production server)

#### 2.4 Configure Database Connection
1. Open `src/models/database.py`
2. Update the PostgreSQL connection string with your credentials:
   ```python
   # Example:
   DATABASE_URL = "postgresql://username:password@localhost:5432/ecopackai"
   ```

#### 2.5 Run Backend Server
```bash
python src/app.py
```
- The backend will be available at: **http://localhost:5000/api**

---

### **Step 3: Set Up ML Model (Optional - for training)**

Navigate to the ML model directory:
```bash
cd ../ml-model
```

#### 3.1 Create a Python Virtual Environment
```bash
python -m venv venv
```

#### 3.2 Activate Virtual Environment
```bash
.\venv\Scripts\Activate.ps1  # Windows
source venv/bin/activate      # Mac/Linux
```

#### 3.3 Install Dependencies
```bash
pip install -r requirements.txt
```

**Installed packages:**
- scikit-learn (Machine learning)
- xgboost (Gradient boosting)
- pandas (Data manipulation)
- numpy (Numerical computing)
- joblib (Model serialization)

#### 3.4 Run Model Training (if needed)
```bash
python src/main.py
```

---

### **Step 4: Set Up Data Collection Module (Optional)**

Navigate to the data collection directory:
```bash
cd ../data-collection
```

#### 4.1 Create a Python Virtual Environment
```bash
python -m venv venv
```

#### 4.2 Activate Virtual Environment
```bash
.\venv\Scripts\Activate.ps1  # Windows
source venv/bin/activate      # Mac/Linux
```

#### 4.3 Install Dependencies
```bash
pip install -r requirements.txt
```

**Installed packages:**
- requests (HTTP requests)
- pandas (Data manipulation)

#### 4.4 Run Data Collection
```bash
python src/main.py
```

---

### **Step 5: Set Up Frontend (React UI)**

Open a **new terminal** and navigate to frontend:
```bash
cd ../frontend
```

#### 5.1 Install Node Dependencies
```bash
npm install
```

#### 5.2 Start Development Server
```bash
npm start
```

- The frontend will be available at: **http://localhost:3000**

---

### **Step 6: Set Up Dashboard (BI Dashboard)**

Open a **new terminal** and navigate to dashboard:
```bash
cd ../dashboard
```

#### 6.1 Install Node Dependencies
```bash
npm install
```

#### 6.2 Start Development Server
```bash
npm start
```

- The dashboard will be available at: **http://localhost:3000** or a different port if 3000 is taken

---

## Running the Full Application

### **Summary of Commands (in separate terminals):**

**Terminal 1 - Backend:**
```bash
cd backend
.\venv\Scripts\Activate.ps1
python src/app.py
# Running on http://localhost:5000/api
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm start
# Running on http://localhost:3000
```

**Terminal 3 - Dashboard:**
```bash
cd dashboard
npm start
# Running on http://localhost:3000 (or another port)
```

---

## API Endpoints

Once the backend is running, you can use these endpoints:

### Get Packaging Recommendations
```bash
POST http://localhost:5000/api/recommendations
Content-Type: application/json

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

### Get Environmental Score
```bash
GET http://localhost:5000/api/environmental_score?material=example_material
```

---

## Troubleshooting

### Issue: "Python version not found"
**Solution:** Ensure Python 3.8+ is installed. Add Python to PATH if needed.

### Issue: "Port already in use"
**Solution:** Change the port in the application or kill the process using the port.

### Issue: "Module not found" (pip install failed)
**Solution:** Ensure virtual environment is activated and try reinstalling:
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

### Issue: "PostgreSQL connection failed"
**Solution:** 
1. Ensure PostgreSQL is running
2. Check database credentials in `backend/src/models/database.py`
3. Create the database if it doesn't exist:
   ```bash
   psql -U postgres -c "CREATE DATABASE ecopackai;"
   ```

### Issue: "npm ERR! code ERESOLVE"
**Solution:** Try clearing npm cache and reinstalling:
```bash
npm cache clean --force
npm install
```

---

## Project Structure Quick Reference

```
ecopackai/
├── backend/                 # Flask API (Port 5000)
│   ├── src/
│   │   ├── app.py          # Main Flask app
│   │   ├── routes/         # API endpoints
│   │   ├── services/       # Business logic
│   │   └── models/         # Database schema
│   └── requirements.txt
│
├── frontend/               # React UI (Port 3000)
│   ├── src/
│   │   ├── main.jsx        # Entry point
│   │   ├── pages/          # Pages
│   │   └── components/     # React components
│   └── package.json
│
├── dashboard/              # BI Dashboard (Port 3000/other)
│   ├── src/
│   │   ├── main.jsx        # Entry point
│   │   ├── pages/          # Dashboard pages
│   │   └── components/     # Dashboard components
│   └── package.json
│
├── ml-model/               # Machine Learning
│   ├── src/
│   │   ├── main.py         # Entry point
│   │   ├── models/         # ML models
│   │   ├── preprocessing/  # Data prep
│   │   └── training/       # Training scripts
│   └── requirements.txt
│
└── data-collection/        # Data Collection
    ├── src/
    │   ├── main.py         # Entry point
    │   ├── scrapers/       # Web scrapers
    │   ├── validators/     # Validators
    │   └── inspectors/     # Data inspectors
    └── requirements.txt
```

---

## Next Steps

1. ✅ Complete the setup following all steps above
2. 📝 Customize database connection in backend
3. 🧪 Test API endpoints using Postman or curl
4. 🚀 Deploy to production when ready

---

## Support

For issues or questions, refer to individual module README files:
- `backend/README.md`
- `frontend/README.md`
- `dashboard/README.md`
- `ml-model/README.md`
- `data-collection/README.md`

---

**Happy coding! 🌱**
