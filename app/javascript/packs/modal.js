// Selectors
const modal = document.querySelector('.modal');
const modalInner = modal.querySelector('.modalInner')
const bodyContent = document.querySelector('body');
const minusQuantity = modalInner.querySelector('.minus-quantity');
const plusQuantity = modalInner.querySelector('.plus-quantity');
const modalCounter = modalInner.querySelector('.modalCounter');
const modalCount = parseInt(modalCounter.innerText, 10);
let counter = 1;
const modalForm = modalInner.querySelector('.modalForm');
const modalSubmitButtonValue = modalInner.querySelector('.modal-button');
const items = document.querySelectorAll('.item');
const buttonPrice = modalInner.querySelector('.button-price');
const hiddenModalQuantity = document.getElementById('modalQuantity');
const hiddenItemId = document.getElementById('itemId');
const optionsSection = document.querySelector('.options-section');
const optionsTitle = modalInner.querySelector('.options-title');
const modalButtonPrice = modalInner.querySelector('.modal-button-price');
let optionPriceCounter = 0;

function openModal() {
    console.info('Opening Modal...');
    // First check if the modal is already open
    if(modal.matches('.open')) {
      console.info('Modal already open');
      return; //stop the function from opening
    }
    modal.classList.add('open');
    bodyContent.classList.add('closed');
    // Event listeners to be bound when we open the modal.
  }

  function closeModal() {
    bodyContent.classList.remove('closed');
    modal.classList.remove('open');
    optionsTitle.innerHTML = '';
    optionsSection.innerHTML = '';
    optionPriceCounter = 0;
    // TODO: add event listeners for clicks and keyboard...
    // window.removeEventListener('keyup', handleKeyUp);
    // nextButton.removeEventListener('click', showNextImage);
    // prevButton.removeEventListener('click', showPrevImage);
  }

  function resetModal(seconds) {
    setTimeout(function(){
      closeModal();
      counter = 1;
      updateButtonText()
      modalCounter.innerText = counter;
      hiddenModalQuantity.value = counter;
    }, seconds);
  }

  function addOrder() {
    modalSubmitButtonValue.setAttribute("value", `Added!`);
    resetModal(700);
  }

  function handleClickOutside(e) {
    if(e.target === e.currentTarget) {
      // closeModal();
      resetModal(0);
    }
  }

  function updateButtonText() {
    modalSubmitButtonValue.setAttribute("value", `Add ${counter} to Order`)
  }



  function showItem(el) {
    if(!el) {
      console.info('item');
      return
    }

    // update the modal with this info
    // const image = el.querySelector('img');
    // const source = `http://res.cloudinary.com/vc334/image/upload/${el.dataset.photo}`;
    const source = 'https://cdn.shopify.com/s/files/1/0023/0922/6566/products/Torta_de_pierna_2_1024x1024.jpg?v=1539568978';
    modal.querySelector('img').src = source
    modal.querySelector('h2').textContent = el.dataset.name;
    modal.querySelector('p').textContent = el.dataset.description;
    buttonPrice.innerText = el.dataset.price;
    hiddenItemId.value = el.dataset.id;
    currentItem = el;
    modalInner.scrollTop = 0;
    const itemOptionsArray = JSON.parse(el.dataset.options);
    if (itemOptionsArray.length > 0) {
      optionsTitle.insertAdjacentHTML('afterbegin', '<h5>Options</h5>')
    };
    const optionPrices = JSON.parse(el.dataset.prices);
    console.log(optionPrices);
    itemOptionsArray.forEach((option) => {

          optionsSection.insertAdjacentHTML('afterbegin', `<div style="display: flex; justify-content: space-between; align-items: center;"><div><input id=${option} type="checkbox" name="options[]" value=${option}>
        <label for=${option}>${option}</label></div><h6>+${optionPrices[optionPriceCounter]}</h6></div>
        <br>`)
        optionPriceCounter += 1;
        })
        ;
    const itemPrice = el.dataset.price
    modalButtonPrice.innerText = `$${itemPrice}`;

    function changeQuantity(direction) {
      const theItemPrice = parseInt(itemPrice, 10);
      if (direction === 'plus') {
        counter += 1;
        modalCounter.innerText = counter;
        updateButtonText();
        hiddenModalQuantity.value = counter;
        modalButtonPrice.innerText = `$${theItemPrice * counter}`;
      } else {
        if (counter === 1) {
          return;
        } else {
        counter -= 1;
        modalCounter.innerText = counter;
        updateButtonText();
        hiddenModalQuantity.value = counter;
        modalButtonPrice.innerText = `$${theItemPrice * counter}`;
        }
      }
    }

    minusQuantity.addEventListener('click', () => changeQuantity('minus'));
    plusQuantity.addEventListener('click', () => changeQuantity('plus'));

    openModal();

  }

// These are our event listeners
// foodItem.addEventListener('click', openModal);
modal.addEventListener('click', handleClickOutside);

items.forEach(image => image.addEventListener('click', (e) => showItem(e.currentTarget)));
modalForm.addEventListener('submit', addOrder);
