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

        // 이미지 요소 추가 (1, 2, 3등에게만)
        if (index === 0) {
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
        }

        rankingList.appendChild(userRanking);
    });
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
                 userRanking.appendChild(star);
             }
         }

         rankingList.appendChild(userRanking);
     });
 });


*/
		
		