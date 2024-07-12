(function() {
     
/*
채팅방 커버 파일 미리보기
*/
var imageUpload = document.getElementById('imageUpload');
imageUpload.addEventListener('change', function(event) {  
	var file = event.target.files[0];
 		 if (file) {   
  	 		var reader = new FileReader();
   				 reader.onload = function(event) {      
  	 				var previewImage = document.createElement('img');      
   	 				previewImage.src = event.target.result;      
 	   				previewImage.style.width = '300px'; // 미리보기 이미지 크기 조절      
  	  				previewImage.style.height = '400px';// 미리보기 이미지를 원하는 위치 (예: 컨테이너 요소)에 표시
    				var previewContainer = document.getElementById('previewContainer'); 
    				$('#previewContainer img').remove();
    				previewContainer.appendChild(previewImage);    
    			};//end of reader.onload function
    		reader.readAsDataURL(file);  
   		 } //end of if
 });//end of imageUpload addEventListener

})();
