import React from 'react';
import Header from '../components/Header';
import RecommendationForm from '../components/RecommendationForm';
import RecommendationsList from '../components/RecommendationsList';

const HomePage = () => {
    return (
        <div>
            <Header />
            <main>
                <h1>Welcome to EcoPackAI</h1>
                <p>Your AI-powered sustainable packaging recommendation system.</p>
                <RecommendationForm />
                <RecommendationsList />
            </main>
        </div>
    );
};

export default HomePage;