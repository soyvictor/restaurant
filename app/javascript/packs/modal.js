// Selectors
const foodItem = document.querySelector('.testItem');
const modal = document.querySelector('.modal');
const mainContent = document.querySelector('body');
const minusQuantity = document.querySelector('.minus-quantity');
const plusQuantity = document.querySelector('.plus-quantity');
const quantityOutside = document.querySelector('.quantity-outside');
const quantityOutsideInteger = parseInt(quantityOutside.innerText, 10);
let counter = 1;
const modalSubmitButtonValue = document.querySelector('.modal-button');
console.log(modalSubmitButtonValue);

function openModal() {
    console.info('Opening Modal...');
    // First check if the modal is already open
    if(modal.matches('.open')) {
      console.info('Modal already open');
      return; //stop the function from opening
    }
    modal.classList.add('open');

    mainContent.classList.add('closed');

    // Event listeners to be bound when we open the modal.
  }

  function closeModal() {
    mainContent.classList.remove('closed');
    modal.classList.remove('open');
    // TODO: add event listeners for clicks and keyboard...
    window.removeEventListener('keyup', handleKeyUp);
    nextButton.removeEventListener('click', showNextImage);
    prevButton.removeEventListener('click', showPrevImage);

  }

  function handleClickOutside(e) {
    if(e.target === e.currentTarget) {
      closeModal();
    }
  }

  function updateButtonText() {
    modalSubmitButtonValue.setAttribute("value", `Add ${counter} to Order`)
  }

  function changeQuantity(direction) {
    if (direction === 'plus') {
      counter += 1;
      quantityOutside.innerText = counter;
      updateButtonText();
    } else {
      counter -= 1;
      quantityOutside.innerText = counter;
      updateButtonText();
    }
  }


// These are our event listeners
foodItem.addEventListener('click', openModal);
modal.addEventListener('click', handleClickOutside);
minusQuantity.addEventListener('click', () => changeQuantity('minus'));
plusQuantity.addEventListener('click', () => changeQuantity('plus'));
