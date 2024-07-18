import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js'; // JavaScript 파일 import
import './Chart.css';
import {Bar} from 'react-chartjs-2';
import 'chart.js/auto';

import sourceData from '../../Data/sourceData.json'


const MemberChart= () => {


    return (
        <div className='dataCard dayuse'>
          <h6 className="text">일일 이용자 통계</h6>
          <Bar 
            data={{
              labels: sourceData.map((data) => data.label),
              datasets:[
                {
                  label:"갓기진",
                  data:[200,300,500],
                },
                {
                  label:"Loss",
                  data:[90,80,70],
  
                },
              ],
            }}
          />
        </div>
    );
  

}

export default MemberChart