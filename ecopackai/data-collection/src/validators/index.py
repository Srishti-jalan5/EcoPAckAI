def validate_data(data):
    if not isinstance(data, dict):
        raise ValueError("Data must be a dictionary.")
    
    required_fields = ['material', 'type', 'recyclable', 'source']
    for field in required_fields:
        if field not in data:
            raise ValueError(f"Missing required field: {field}")
    
    if not isinstance(data['material'], str):
        raise ValueError("Material must be a string.")
    
    if not isinstance(data['type'], str):
        raise ValueError("Type must be a string.")
    
    if not isinstance(data['recyclable'], bool):
        raise ValueError("Recyclable must be a boolean.")
    
    if not isinstance(data['source'], str):
        raise ValueError("Source must be a string.")
    
    return True

def validate_data_list(data_list):
    if not isinstance(data_list, list):
        raise ValueError("Data must be a list.")
    
    for item in data_list:
        validate_data(item)
    
    return True