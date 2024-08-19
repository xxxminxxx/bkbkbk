import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './Rank.css';
import SingoModal from '../Modal/SingoModal';

const Rank = () => {
    const [modalOpen, setModalOpen] = useState(false);
    const [selectedProject, setSelectedProject] = useState(null);
    const [reportData, setReportData] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const itemsPerPage = 6;

    useEffect(() => {
        fetchReportData();
    }, []);

    const fetchReportData = async () => {
        try {
            const response = await axios.get('http://localhost:8080/reports');
            console.log(response.data);
            setReportData(response.data);
        } catch (error) {
            console.error("Error fetching report data:", error);
        }
    };

    const handleContentClick = (report) => {
        setSelectedProject(report);
        setModalOpen(true);
    };

    // 페이징 로직
    const indexOfLastItem = currentPage * itemsPerPage;
    const indexOfFirstItem = indexOfLastItem - itemsPerPage;
    const currentItems = reportData.slice(indexOfFirstItem, indexOfLastItem);

    const totalPages = Math.ceil(reportData.length / itemsPerPage);

    const pageNumbers = [];
    for (let i = 1; i <= totalPages; i++) {
        pageNumbers.push(i);
    }

    return (
        <div className="project-listing">
            <h2>신고 게시글 관리</h2>
            <table>
                <thead>
                    <tr>
                        <th>신고번호</th>
                        <th>신고일</th>
                        <th>신고 내용</th>
                        <th>신고유형</th>
                        <th>피신고자</th>
                        <th>신고자</th>
                        <th>신고결과</th>
                        <th>처리일</th>
                    </tr>
                </thead>
                <tbody>
                    {currentItems.map((report) => (
                        <tr key={report.id}>
                            <td>{report.reportedNum}</td>
                            <td>{report.reportTime}</td>
                            <td>
                                <a onClick={() => handleContentClick(report)}>
                                    {report.reportedMessage}
                                </a>
                            </td>
                            <td>{report.reportType}</td>
                            <td>{report.reportedUser}</td>
                            <td>{report.reportUser}</td>
                            <td>{report.reportResult === null ? "미처리" : report.reportResult}</td>
                            <td>{report.adminReportResult}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
            <div className='rank_margin'>
            <nav>
                <ul className="pagination justify-content-center">
                    <li className={`page-item ${currentPage === 1 ? 'disabled' : ''}`}>
                        <button className="page-link" onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}>이전</button>
                    </li>
                    {pageNumbers.map(number => (
                        <li key={number} className={`page-item ${currentPage === number ? 'abc' : ''}`}>
                            <button className="page-link" onClick={() => setCurrentPage(number)}>{number}</button>
                        </li>
                    ))}
                    <li className={`page-item ${currentPage === totalPages ? 'disabled' : ''}`}>
                        <button className="page-link" onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}>다음</button>
                    </li>
                </ul>
            </nav>
            </div> 
            {modalOpen && <SingoModal setOpenModal={setModalOpen} report={selectedProject} fetchReportData={fetchReportData} />}
        </div>
    );
}

export default Rank;