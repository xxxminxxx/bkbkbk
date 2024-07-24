import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js'; // JavaScript 파일 import
import './Chart.css';
import 'chart.js/auto';

import sourceData from '../../Data/sourceData.json';
import MemberChart from './MemberChart';
import BookChart from './BookChart';
import DChart from './DChart'; 
import CountChart from "./CountChart";


const Chart= () => {

    return (
        <div className="chart-container">
        <MemberChart/>
        <CountChart/>
        </div>
    );

}

export default Chart