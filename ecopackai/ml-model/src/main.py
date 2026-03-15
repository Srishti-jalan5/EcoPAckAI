from preprocessing.index import preprocess_data
from training.index import train_model

def main():
    # Step 1: Preprocess the data
    processed_data = preprocess_data()

    # Step 2: Train the model
    model = train_model(processed_data)

    # Step 3: Save the trained model (optional)
    # model.save('path_to_save_model')

if __name__ == "__main__":
    main()