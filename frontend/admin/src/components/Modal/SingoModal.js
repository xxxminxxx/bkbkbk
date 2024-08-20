import React, { useState } from 'react';
import axios from 'axios';
import './SingoModal.css';
import Swal from 'sweetalert2';

const SingoModal = ({ setOpenModal, report, fetchReportData }) => {
  const [processed, setProcessed] = useState(false);
  const [adminId, setAdminId] = useState('');

  const isReportProcessed = () => {
    return report.reportResult !== null && report.reportResult !== "미처리";
  };

  const handleProcess = async () => {
    try {
      const stopResult = await axios.post('http://localhost:8080/stop', null, {
        params: {
          userId: report.userId,
          stop: 'Y'
        }
      });

      if (stopResult.status === 200) {
        const reportResult = await axios.post('http://localhost:8080/report', null, {
          params: {
            reportedNum: report.reportedNum,
          }
        });

        if (reportResult.status === 200) {
          Swal.fire({
            icon: 'success',
            title: '처리 완료',
            text: '해당 회원이 성공적으로 정지되었고, 신고가 처리되었습니다.',
          });
          setOpenModal(false);
          fetchReportData();
        } else {
          Swal.fire({
            icon: 'error',
            title: '처리 실패',
            text: '신고 처리에 실패하였습니다.',
          });
        }
      } else {
        Swal.fire({
          icon: 'error',
          title: '처리 실패',
          text: '해당 회원 정지에 실패하였습니다.',
        });
      }
    } catch (error) {
      console.error('Error processing report:', error);
      Swal.fire({
        icon: 'error',
        title: '오류 발생',
        text: '처리 중 오류가 발생했습니다: ' + error.message,
      });
    }
  };

  return (
    <div className='singo-modalBackground'>
      <div className='singo-modalContainer'>
        <div className='singo-titleCloseBtn'>
          <button onClick={() => setOpenModal(false)}>X</button>
        </div>

        <div className='singo-title'>
          <h2>신고게시판</h2>
        </div>

        <div className='singo-body'>
          <table className='singo-table'>
            <thead>
              <tr>
                <th colSpan="2">신고 상세 정보</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td colSpan="2">
                  <table className='singo-table'>
                    <tbody>
                      <tr><th>신고 번호</th><td>{report.reportedNum}</td></tr>
                      <tr><th>신고 일시</th><td>{report.reportTime}</td></tr>
                      <tr><th>신고 유형</th><td>{report.reportType}</td></tr>
                      <tr><th>신고 내용</th><td>{report.reportedMessage}</td></tr>
                      <tr><th>피신고자</th><td>{report.userId}</td></tr>
                      <tr><th>신고자</th><td>{report.reportUser}</td></tr>
                      <tr><th>신고 결과</th><td>{report.reportResult}</td></tr>
                      <tr><th>처리 일시</th><td>{report.adminReportResult}</td></tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <div className="singo-footer">
          {!isReportProcessed() && (
            <button onClick={() => handleProcess(report.reportedUser)}>처리</button>
          )}
          <button id="singo-delBtn">삭제</button>
        </div>
      </div>
    </div>
  );
};

export default SingoModal;