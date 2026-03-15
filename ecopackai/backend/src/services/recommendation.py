from flask import jsonify
from .models.database import get_db_connection
from ml_model.src.models.recommender import Recommender

class RecommendationService:
    def __init__(self):
        self.recommender = Recommender()

    def get_recommendations(self, product_data):
        # Validate input data
        if not self.validate_input(product_data):
            return jsonify({"error": "Invalid input data"}), 400
        
        # Generate recommendations using the AI model
        recommendations = self.recommender.predict(product_data)
        
        return jsonify(recommendations), 200

    def validate_input(self, product_data):
        # Implement validation logic for product_data
        required_fields = ['material_type', 'dimensions', 'weight']
        for field in required_fields:
            if field not in product_data:
                return False
        return True

    def save_recommendation_to_db(self, recommendation):
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO recommendations (data) VALUES (%s)", (recommendation,))
        conn.commit()
        cursor.close()
        conn.close()