const shoppingCartCards = document.querySelectorAll('.shopping-cart-card');

function setDefaultQuantity(card) {
  console.log(card);
  const formOptions = card.querySelectorAll('.quantity-form-option');
  formOptions.forEach((option) => {
    if (option.value === card.dataset.quant) {
      option.selected = true;
    }
  });
}







// Initialize on page load
shoppingCartCards.forEach((card) => {
  setDefaultQuantity(card)
});
