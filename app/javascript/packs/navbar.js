const hamburgerButton = document.querySelector('.hamburger-button');
const modalOutside = document.querySelector('.modalOutside');
console.log(hamburgerButton);

function openModalOutside() {
    if(modalOutside.matches('.open')) {
      console.info('ModalOutside already open');
      return; //stop the function from opening
    }
    modalOutside.classList.add('open');
    // Event listeners to be bound when we open the modal.
  }

  function closeModalOutside() {
    modalOutside.classList.remove('open');
    // TODO: add event listeners for clicks and keyboard...
    // window.removeEventListener('keyup', handleKeyUp);
    // nextButton.removeEventListener('click', showNextImage);
    // prevButton.removeEventListener('click', showPrevImage);
  }

  function handleClickOutsideModalOutside(e) {
    if(e.target === e.currentTarget) {
      closeModalOutside();
    }
  }


  // Event Listeners

  hamburgerButton.addEventListener('click', openModalOutside);
  modalOutside.addEventListener('click', handleClickOutsideModalOutside);

