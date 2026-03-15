import pandas as pd

def inspect_csv(file_path):
    """Inspect CSV structure and data types"""
    try:
        df = pd.read_csv(file_path)
        
        print("=" * 80)
        print("📊 CSV INSPECTION REPORT")
        print("=" * 80)
        
        print(f"\n📁 File: {file_path}")
        print(f"📈 Shape: {df.shape[0]} rows × {df.shape[1]} columns")
        
        print("\n🔍 Column Names & Data Types:")
        print("-" * 80)
        for col in df.columns:
            print(f"  • {col:<40} → {df[col].dtype}")
        
        print("\n📋 First 5 Records:")
        print("-" * 80)
        print(df.head())
        
        print("\n📊 Statistical Summary:")
        print("-" * 80)
        print(df.describe())
        
        print("\n🔎 Missing Values:")
        print("-" * 80)
        missing = df.isnull().sum()
        if missing.sum() > 0:
            print(missing[missing > 0])
        else:
            print("✅ No missing values found!")
        
        print("\n" + "=" * 80)
        return df
    
    except Exception as e:
        print(f"❌ Error inspecting CSV: {e}")
        return None

if __name__ == "__main__":
    file_path = r"C:\Users\DELL\Downloads\Detailed_Autoliv_Sustainable_Packaging_Dataset.csv"
    inspect_csv(file_path)