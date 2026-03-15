# EcoPackAI Machine Learning Module

This module is responsible for the machine learning aspects of the EcoPackAI project, including data preprocessing, model training, and recommendations for sustainable packaging solutions.

## Directory Structure

- `src/`
  - `models/`: Contains the AI recommendation model logic.
  - `preprocessing/`: Includes functions for data preprocessing.
  - `training/`: Handles the training of machine learning models.
  - `main.py`: Entry point for the machine learning module.

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   cd ecopackai/ml-model
   ```

2. Install the required dependencies:
   ```
   pip install -r requirements.txt
   ```

## Usage

1. **Preprocessing Data**: Use the functions in `src/preprocessing/index.py` to prepare your dataset for training.

2. **Training the Model**: Run the `src/training/index.py` to train the machine learning model with your preprocessed data.

3. **Making Predictions**: Utilize the classes and functions in `src/models/recommender.py` to generate packaging recommendations based on input data.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.