import React, { useState } from 'react';
import './Rank.css';
import SingoModal from '../Modal/SingoModal';

const projectData = [
  { id: 1, name: '23-03-22 10:53', email: 'hgover@gmail.com', project: '악의적인 후기', weeks: '내이름', status: '욕설', budget: '23-03-22 10:53' },
  { id: 2, name: '23-03-22 10:53', email: 'hgover@gmail.com', project: '폄하하는 내용', weeks: '강아지22', status: '욕설', budget: '23-03-22 10:53' },
  { id: 3, name: '23-03-22 10:53', email: 'hgover@gmail.com', project: '비난의 글', weeks: '홍길동', status: '욕설', budget: '23-03-22 10:53' },
  { id: 4, name: '23-03-22 10:53', email: 'hgover@gmail.com', project: '욕설이 난무', weeks: '코기이스베스트', status: '욕설', budget: '23-03-22 10:53' },
  { id: 5, name: '23-03-22 10:53', email: 'hgover@gmail.com', project: '이상함', weeks: '아이앰샘2', status: '욕설', budget: '23-03-22 10:53' },
];

const Rank = () => {
  const [modalOpen, setModalOpen] = useState(false);
  const [selectedProject, setSelectedProject] = useState(null);

  const handleContentClick = (project) => {
    setSelectedProject(project);
    setModalOpen(true);
  };

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
            <th>신고자</th>
            <th>처리일</th>
          </tr>
        </thead>
        <tbody>
          {projectData.map((project) => (
            <tr key={project.id}>
              <td>
                <div className="team-lead">
                  <div>
                    <div className="name">{project.id}</div>
                  </div>
                </div>
              </td>
              <td>{project.name}</td>
              <td><a onClick={() => handleContentClick(project)}>{project.project}</a></td>
              <td>{project.status}</td>
              <td>{project.weeks}</td>
              <td>{project.budget}</td>
            </tr>
          ))}
        </tbody>
      </table>
      {modalOpen && <SingoModal setOpenModal={setModalOpen} project={selectedProject} />}
    </div>
  );
};

export default Rank;