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
    
   
   $.ajax({
      url:'/usersReadRank',
      method:'POST',
      success:function(data){
         for(let i =0; i<data.length;i++){
            users.push({name:data[i].userId, booksRead:data[i].readBooks, level:data[i].characterStage});
         }
         console.log(users);
         const rankingList = document.getElementById('ranking-list');
            
             users.forEach((user, index) => {
               if(index<30){
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
               
                 userRanking.innerHTML += rankImg+`
                     <div class=""><img width="50px" heighit="50px" src="../img/코기${user.level}.png"></div>
                     <div class="details">
                         <div class="name">${user.name}</div>
                         <div class="books-read">읽은 책 수: ${user.booksRead}</div>
                     </div>
                  <div class="animation">
                  </div>
                 `;
               /*if(index<3){
                  const specials = document.getElementsByClassName('special');
               
                  for (let i = 0; i < specials.length; i++) {
                      // 새로운 div 요소를 생성합니다.
                      const newDiv = document.createElement('div');
                      newDiv.className = '<dotlottie-player src="https://lottie.host/4cb2f0df-76d2-47c3-aa8e-027bd070804a/VFyOOLZd9w.json" background="transparent" speed="1" style="width: 600px; height: 100px;" loop autoplay></dotlottie-player>'; // div 요소에 클래스 이름 'add'를 추가합니다.

                      // 가져온 요소의 자식 요소로 새로 생성한 div를 추가합니다.
                      specials[i].appendChild(newDiv);
                  }
               }*/
               
                 // 이미지 요소 추가 (1, 2, 3등에게만)
                /* if (index === 0) {
                     for (let i = 0; i < 10; i++) {
                         const dog = document.createElement('div');
                         dog.classList.add('dog-top-1');
                         dog.style.left = `${Math.random() * 100}%`;
                         dog.style.animationDelay = `${Math.random() * 2}s`;
                         userRanking.appendChild(dog);
                     }
                 } else if (index === 1) {
                     for (let i = 0; i < 10; i++) {
                         const dog = document.createElement('div');
                         dog.classList.add('dog-top-2');
                         dog.style.left = `${Math.random() * 100}%`;
                         dog.style.animationDelay = `${Math.random() * 2}s`;
                         userRanking.appendChild(dog);
                     }
                 } else if (index === 2) {
                     for (let i = 0; i < 10; i++) {
                         const dog = document.createElement('div');
                         dog.classList.add('dog-top-3');
                         dog.style.left = `${Math.random() * 100}%`;
                         dog.style.animationDelay = `${Math.random() * 2}s`;
                         userRanking.appendChild(dog);
                     }
                 }*/

                 rankingList.appendChild(userRanking);
               }//end of if
             });//end of for
            
            var corgiBalloon = '<dotlottie-player src="https://lottie.host/85ae5a6d-be96-47d3-a22e-e69198c62848/8DdrT7N9Sy.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></dotlottie-player>';
            var corgiUn='<dotlottie-player src="https://lottie.host/46b132cd-f789-45f7-b089-db0152ffff19/JycbiEbYrh.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></dotlottie-player>';
            var dachshund='<dotlottie-player src="https://lottie.host/3900df04-acd6-46c5-9e6f-01c9d2b53728/Ae4dNNxEJF.json" background="transparent" speed="1" style="width: 100px; height: 100px;" loop autoplay></dotlottie-player>'
            $('.top-1').append(corgiBalloon);
            $('.top-2').append(corgiUn);
            $('.top-3').append(dachshund);
            
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



/*
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
     const users = [
         {name: "짹짹이", booksRead: 100},
         {name: "냥냥이", booksRead: 90},
         {name: "멍멍이", booksRead: 80},
         {name: "토끼", booksRead: 70},
         {name: "사자", booksRead: 65}
         // ... 45명의 유저 더 추가 (데모 데이터로 5명만 추가)
     ];

     const rankingList = document.getElementById('ranking-list');

     users.forEach((user, index) => {
         const userRanking = document.createElement('div');
         userRanking.classList.add('user-ranking');

         if (index === 0) {
             userRanking.classList.add('special', 'top-1');
         } else if (index === 1) {
             userRanking.classList.add('special', 'top-2');
         } else if (index === 2) {
             userRanking.classList.add('special', 'top-3');
         }

         userRanking.innerHTML += `
             <div class="rank">${index + 1}</div>
             <div class="avatar"></div>
             <div class="details">
                 <div class="name">${user.name}</div>
                 <div class="books-read">읽은 책 수: ${user.booksRead}</div>
             </div>
         `;

         // 별 요소 추가 (1, 2, 3등에게만)
         if (index < 3) {
             for (let i = 0; i < 10; i++) {
                 const star = document.createElement('div');
                 star.classList.add('star');
                 star.style.left = `${Math.random() * 100}%`;
                 star.style.animationDelay = `${Math.random() * 2}s`;
                 userRanking.appendChild(별);
             }
         }

         rankingList.appendChild(userRanking);
     });
 });


*/
      
      
