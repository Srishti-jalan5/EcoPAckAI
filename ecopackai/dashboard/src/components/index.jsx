import React from 'react';
import AnalyticsCard from './AnalyticsCard';
import Chart from './Chart';
import DataTable from './DataTable';

const DashboardComponents = () => {
    return (
        <div className="dashboard-components">
            <AnalyticsCard />
            <Chart />
            <DataTable />
        </div>
    );
};

export default DashboardComponents;