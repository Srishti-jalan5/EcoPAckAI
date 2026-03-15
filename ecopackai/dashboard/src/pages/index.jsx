import React from 'react';
import { Container, Row, Col } from 'react-bootstrap';
import DashboardHeader from '../components/DashboardHeader';
import AnalyticsOverview from '../components/AnalyticsOverview';
import Recommendations from '../components/Recommendations';

const DashboardPage = () => {
    return (
        <Container fluid>
            <DashboardHeader />
            <Row>
                <Col md={8}>
                    <AnalyticsOverview />
                </Col>
                <Col md={4}>
                    <Recommendations />
                </Col>
            </Row>
        </Container>
    );
};

export default DashboardPage;