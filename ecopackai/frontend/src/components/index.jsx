import React from 'react';
import Header from './Header';
import Footer from './Footer';
import PackagingRecommendation from './PackagingRecommendation';
import DataVisualization from './DataVisualization';

const AppComponents = () => {
    return (
        <div>
            <Header />
            <PackagingRecommendation />
            <DataVisualization />
            <Footer />
        </div>
    );
};

export default AppComponents;