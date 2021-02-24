const shoppingCartCards = document.querySelectorAll('.shopping-cart-card');
const orderType = document.getElementById('order-type-form');
const nextCheckoutButton = document.querySelector('.next-checkout-button');
const orderTypeButton = document.querySelector('.order-type-button');
console.log(orderTypeButton);
const inputRadio = document.querySelectorAll('.form-check-input');
const deliveryFee = document.querySelector('.delivery-fee');
const orderTotal = document.querySelector('.order-total');

function doSomething(form) {
  console.log(form);
  const butt = form.querySelector('.quant-button');
  butt.click();
}

function setDefaultQuantity(card) {
  const formOptions = card.querySelectorAll('.quantity-form-option');
  formOptions.forEach((option) => {
    if (option.value === card.dataset.quant) {
      option.selected = true;
    }
  });
  const quantityDropDown = card.querySelector('.quantity-list');
  quantityDropDown.addEventListener('change', (e) => doSomething(e.currentTarget));
}

function updateCheckoutPrice(e) {
  if (e.target.value === 'pickup') {
    deliveryFee.innerText = '---';
    orderTotal.innerText = orderTotal.dataset.subtotal

    // orderAmount.innerText = orderAmount.dataset.amount;
    // addressFieldset.disabled = true;
    // addressFieldset.classList.add('pickup');
    // deliveryInfoHeading.innerText = "Pickup Location"
    // pickupLocationDiv.innerHTML = '<p>Tortas Mr. Elorduy</p><p>2849 Olive Ave</p><p>Fremont, CA 94539</p>';
  } else {
    deliveryFee.innerText = deliveryFee.dataset.delivery;
    orderTotal.innerText = (parseInt(deliveryFee.dataset.delivery, 10) + parseInt(orderTotal.dataset.subtotal, 10)).toFixed(2);
    // orderAmount.innerText = (parseInt(orderAmount.dataset.amount, 10) + parseInt(orderAmount.dataset.delivery, 10)).toFixed(2);
    // addressFieldset.classList.remove('pickup');
    // deliveryInfoHeading.innerText = "Delivery Info"
    // addressFieldset.disabled = false;
    //     pickupLocationDiv.innerHTML = '';
  }

}



// Initialize on page load
shoppingCartCards.forEach((card) => {
  setDefaultQuantity(card)
});

// Event Listeners
orderType.addEventListener('change', updateCheckoutPrice);



