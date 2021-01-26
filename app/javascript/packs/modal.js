// Selectors
const foodItem = document.querySelector('.testItem');
const modal = document.querySelector('.modal');


function openModal() {
    console.info('Opening Modal...');
    // First check if the modal is already open
    if(modal.matches('.open')) {
      console.info('Modal already open');
      return; //stop the function from opening
    }
    modal.classList.add('open');

    // Event listeners to be bound when we open the modal.
  }


foodItem.addEventListener('click', openModal);
