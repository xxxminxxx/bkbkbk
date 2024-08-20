$(document).ready(function() {
    // 날짜 정보 설정
    const currentDate = new Date();
    const currentYear = currentDate.getFullYear();
    const currentMonth = currentDate.getMonth() + 1;
    const monthStart = `${currentYear}-${String(currentMonth).padStart(2, '0')}-01`;
    const monthEnd = `${currentYear}-${String(currentMonth).padStart(2, '0')}-${new Date(currentYear, currentMonth, 0).getDate()}`;

    // 대회 정보 업데이트
    document.getElementById('competition-title').innerText = `${currentYear} 상반기 독서왕 선발대회`;
    document.getElementById('competition-period').innerText = `대회 기간: ${monthStart} ~ ${monthEnd}`;

    // 유저 데이터
   var users=[];
    
   //책 목록 가져오는 함수
   function fetchBooksForUsers(users) {
       // 각 사용자에 대해 책 데이터를 가져오는 AJAX 요청을 생성합니다.
       const requests = users.map(user => {
           return $.ajax({
               url: '/getBooksByUserId',
               method: 'POST',
               data: { userId: user.name },
               success: function(bookData) {
                   user.books = bookData; // 각 사용자의 책 정보를 저장합니다.
               }
           });
       });

       // 모든 AJAX 요청이 완료될 때까지 기다립니다.
       return Promise.all(requests);
   }
   
   
   $.ajax({
      url:'/usersReadRank',
      method:'POST',
      success:function(data){
         for(let i =0; i<data.length;i++){
            users.push({name:data[i].userId, booksRead:data[i].readBooks, level:data[i].characterStage});
         }
         console.log(users);
      
       // 모든 사용자에 대해 책 데이터를 가져옵니다.
        fetchBooksForUsers(users).then(() => {
            // 모든 비동기 요청이 완료된 후 HTML 업데이트
            const rankingList = document.getElementById('ranking-list');
         
             users.forEach((user, index) => {
               if(index<10){
                 const userRanking = document.createElement('div');
                 userRanking.classList.add('user-ranking');
               
            
                 if (index === 0) {
                     userRanking.classList.add('special', 'top-1');
                 } else if (index === 1) {
                     userRanking.classList.add('special', 'top-2');
                 } else if (index === 2) {
                     userRanking.classList.add('special', 'top-3');
                 }

               //1~3등만 트로피와 별 표시
               if(index==0){
               var rankImg = '<div class="rank"><dotlottie-player src="https://lottie.host/d69ea43f-5be4-4ed0-a532-4d214084ded3/4L2bQ50PMr.json" background="transparent" speed="1" style="width: 50px; height: 50px;" loop autoplay></dotlottie-player>   </div>'   
               }else if (index==1){
               var rankImg = '<div class="rank"><dotlottie-player src="https://lottie.host/8cd5a22b-6589-4aea-a752-6f5d3f0863da/JRr9GmfHzT.json" background="transparent" speed="1" style="width: 50px; height: 50px;" loop autoplay></dotlottie-player>   </div>'   
               }else if(index==2){
               var rankImg = '<div class="rank"><dotlottie-player src="https://lottie.host/8dd93672-ffbd-4b42-bd96-cf061bef1684/WvFnHwIvMO.json" background="transparent" speed="1" style="width: 50px; height: 50px;" loop autoplay></dotlottie-player></div>'   
               }else{
               var rankImg = '<div class="rank">'+(index+1)+'</div>'   
         
               }
               
            userRanking.innerHTML = rankImg + `
                                   <div><img width="50px" height="50px" src="../img/코기${user.level}.png"></div>
                                   <div class="details">
                                       <div class="name">${user.name}</div>
                                        <div class="books-read">읽은 책 수: ${user.booksRead} 권   <i class="ri-information-line tooltip-icon"></i>
                                    <div class="tooltip-content">
                                           ${user.books.map((book, bookIndex) => `<div>${bookIndex + 1}. ${book.bookTitle}</div>`).join('')}
                                        </div>
                                  </div>
                                   </div>
                             <div class="animation"></div>

                               `;
                          
           // Tooltip toggle on click
              const tooltipIcon = userRanking.querySelector('.tooltip-icon');
              const tooltipContent = userRanking.querySelector('.tooltip-content');

              tooltipIcon.addEventListener('click', (event) => {
                event.stopPropagation(); // 클릭 이벤트가 상위 요소로 전파되지 않도록 함
                tooltipContent.style.display = tooltipContent.style.display === 'block' ? 'none' : 'block';
              });

              // Hide tooltip when clicking outside
              document.addEventListener('click', () => {
                const openTooltips = document.querySelectorAll('.tooltip-content');
                openTooltips.forEach(tooltip => tooltip.style.display = 'none');
              });
             
                 rankingList.appendChild(userRanking);
               }//end of if
             });//end of for
            
            var corgiBalloon = '<dotlottie-player src="https://lottie.host/85ae5a6d-be96-47d3-a22e-e69198c62848/8DdrT7N9Sy.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></dotlottie-player>';
            var corgiUn='<dotlottie-player src="https://lottie.host/46b132cd-f789-45f7-b089-db0152ffff19/JycbiEbYrh.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></dotlottie-player>';
            var dachshund='<dotlottie-player src="https://lottie.host/3900df04-acd6-46c5-9e6f-01c9d2b53728/Ae4dNNxEJF.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></dotlottie-player>'
            $('.top-1').append(corgiBalloon);
            $('.top-2').append(corgiUn);
            $('.top-3').append(dachshund);
            });
      },
      error:function(err){
         console.log(err);
      }
   });//end of ajax
   
    
   //책더미 아이콘
   var html='<dotlottie-player src="https://lottie.host/fdd9dd0f-cf36-4b70-9ea0-3f8b4829b5d1/dB9wXWV8ZQ.json" background="transparent" speed="1" style="width: 300px; height: 300px;" loop autoplay></dotlottie-player>';
   $('#booksIcon').append(html);
   
   //달려가는 코기
   /*var corgiHtml='<dotlottie-player src="https://lottie.host/0b1593a6-9ae3-4ccb-ba6a-8d53ccdbf6e2/QODqyq9juZ.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></dotlottie-player>';
   $('.top-1').append(corgiHtml);*/
   
   
});




      
      