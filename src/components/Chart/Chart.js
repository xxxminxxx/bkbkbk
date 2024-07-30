import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js'; // JavaScript 파일 import
import './Chart.css';
import 'chart.js/auto';



import MemberChart from './MemberChart';
import CountChart from "./CountChart";
import AgeChart from "./AgeChart";
import RegistChart from "./RegistChart";
import RentCount from "./RentCount";
import Gender from "./Gender";

const Chart= () => {

    return (
        <div className="chart-container">
        <MemberChart/>
        <CountChart/>
        <AgeChart/>
        <RegistChart/>
        <RentCount/>
        <Gender/>
        </div>
    );

}

export default Chart