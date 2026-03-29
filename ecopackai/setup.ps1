# EcoPackAI - Automated Setup Script for Windows
# This script automates the setup process for all project modules

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   EcoPackAI - Automated Setup Script   " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
Write-Host "Checking prerequisites..." -ForegroundColor Yellow
$pythonCheck = python --version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Python found: $pythonCheck" -ForegroundColor Green
} else {
    Write-Host "✗ Python not found! Please install Python 3.8+ from https://www.python.org/downloads/" -ForegroundColor Red
    exit
}

# Check if Node.js is installed
$nodeCheck = node --version 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Node.js found: $nodeCheck" -ForegroundColor Green
} else {
    Write-Host "✗ Node.js not found! Please install Node.js from https://nodejs.org/" -ForegroundColor Red
    exit
}

Write-Host ""

# Backend Setup
Write-Host "Setting up Backend..." -ForegroundColor Yellow
if (Test-Path ".\backend") {
    Push-Location backend
    
    # Create virtual environment
    Write-Host "  Creating Python virtual environment..." -ForegroundColor Gray
    python -m venv venv
    
    # Activate virtual environment
    Write-Host "  Activating virtual environment..." -ForegroundColor Gray
    & .\venv\Scripts\Activate.ps1
    
    # Install dependencies
    Write-Host "  Installing Python dependencies..." -ForegroundColor Gray
    pip install -r requirements.txt
    
    Write-Host "✓ Backend setup complete!" -ForegroundColor Green
    Write-Host "  To run backend: cd backend && .\venv\Scripts\Activate.ps1 && python src/app.py" -ForegroundColor Cyan
    
    Pop-Location
} else {
    Write-Host "✗ Backend directory not found!" -ForegroundColor Red
}

Write-Host ""

# ML Model Setup (Optional)
Write-Host "Setting up ML Model..." -ForegroundColor Yellow
if (Test-Path ".\ml-model") {
    Push-Location ml-model
    
    Write-Host "  Creating Python virtual environment..." -ForegroundColor Gray
    python -m venv venv
    
    Write-Host "  Activating virtual environment..." -ForegroundColor Gray
    & .\venv\Scripts\Activate.ps1
    
    Write-Host "  Installing Python dependencies..." -ForegroundColor Gray
    pip install -r requirements.txt
    
    Write-Host "✓ ML Model setup complete!" -ForegroundColor Green
    Write-Host "  To run: cd ml-model && .\venv\Scripts\Activate.ps1 && python src/main.py" -ForegroundColor Cyan
    
    Pop-Location
} else {
    Write-Host "✗ ML Model directory not found!" -ForegroundColor Red
}

Write-Host ""

# Data Collection Setup (Optional)
Write-Host "Setting up Data Collection Module..." -ForegroundColor Yellow
if (Test-Path ".\data-collection") {
    Push-Location data-collection
    
    Write-Host "  Creating Python virtual environment..." -ForegroundColor Gray
    python -m venv venv
    
    Write-Host "  Activating virtual environment..." -ForegroundColor Gray
    & .\venv\Scripts\Activate.ps1
    
    Write-Host "  Installing Python dependencies..." -ForegroundColor Gray
    pip install -r requirements.txt
    
    Write-Host "✓ Data Collection setup complete!" -ForegroundColor Green
    Write-Host "  To run: cd data-collection && .\venv\Scripts\Activate.ps1 && python src/main.py" -ForegroundColor Cyan
    
    Pop-Location
} else {
    Write-Host "✗ Data Collection directory not found!" -ForegroundColor Red
}

Write-Host ""

# Frontend Setup
Write-Host "Setting up Frontend..." -ForegroundColor Yellow
if (Test-Path ".\frontend") {
    Push-Location frontend
    
    Write-Host "  Installing Node dependencies (this may take a few minutes)..." -ForegroundColor Gray
    npm install
    
    Write-Host "✓ Frontend setup complete!" -ForegroundColor Green
    Write-Host "  To run: cd frontend && npm start" -ForegroundColor Cyan
    
    Pop-Location
} else {
    Write-Host "✗ Frontend directory not found!" -ForegroundColor Red
}

Write-Host ""

# Dashboard Setup
Write-Host "Setting up Dashboard..." -ForegroundColor Yellow
if (Test-Path ".\dashboard") {
    Push-Location dashboard
    
    Write-Host "  Installing Node dependencies (this may take a few minutes)..." -ForegroundColor Gray
    npm install
    
    Write-Host "✓ Dashboard setup complete!" -ForegroundColor Green
    Write-Host "  To run: cd dashboard && npm start" -ForegroundColor Cyan
    
    Pop-Location
} else {
    Write-Host "✗ Dashboard directory not found!" -ForegroundColor Red
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "   Setup Complete! 🎉" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Configure database connection in backend/src/models/database.py" -ForegroundColor White
Write-Host "2. Run each module in separate terminals:" -ForegroundColor White
Write-Host "   - Backend:  cd backend && .\venv\Scripts\Activate.ps1 && python src/app.py" -ForegroundColor Cyan
Write-Host "   - Frontend: cd frontend && npm start" -ForegroundColor Cyan
Write-Host "   - Dashboard: cd dashboard && npm start" -ForegroundColor Cyan
Write-Host ""
Write-Host "For detailed instructions, see SETUP.md" -ForegroundColor Yellow
