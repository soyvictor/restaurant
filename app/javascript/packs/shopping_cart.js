const shoppingCartCards = document.querySelectorAll('.shopping-cart-card');

function doSomething(form) {
  form.submit();
}

function setDefaultQuantity(card) {
  console.log(card);
  const formOptions = card.querySelectorAll('.quantity-form-option');
  formOptions.forEach((option) => {
    if (option.value === card.dataset.quant) {
      option.selected = true;
    }
  });
  const quantityDropDown = card.querySelector('.quantity-list');
  console.log(quantityDropDown)
  quantityDropDown.addEventListener('change', (e) => doSomething(e.currentTarget));
}







// Initialize on page load
shoppingCartCards.forEach((card) => {
  setDefaultQuantity(card)
});


