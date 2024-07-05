document.addEventListener('DOMContentLoaded', function() {
  const modal = document.getElementById('modal');
  const modalText = document.getElementById('modalText');
  const closeButton = document.getElementById('closeButton');
  const termsLink = document.getElementById('termsLink');
  const privacyLink = document.getElementById('privacyLink');

  function openModal(content) {
    modalText.innerHTML = content;
    modal.style.display = 'block';
  }

  function closeModal() {
    modal.style.display = 'none';
  }

  async function fetchContent(url) {
    try {
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return await response.text();
    } catch (error) {
      console.error('Fetch error:', error);
      return '내용을 불러오는 데 실패했습니다.';
    }
  }

  termsLink.addEventListener('click', async () => {
    const content = await fetchContent('./serviceLink.html');
    openModal(content);
  });

  privacyLink.addEventListener('click', async () => {
    const content = await fetchContent('./privacyLink.html');
    openModal(content);
  });

  closeButton.addEventListener('click', closeModal);

  window.addEventListener('click', (event) => {
    if (event.target === modal) {
      closeModal();
    }
  });
});