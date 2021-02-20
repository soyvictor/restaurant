const orderType = document.getElementById('order-type-form');
const orderAmount = document.querySelector('.order-amount');
const addressFieldset = document.querySelector('.address-fieldset');
const deliveryInfoHeading = document.querySelector('.delivery-info-heading');

function updateCheckoutPrice(e) {
  if (e.target.value === 'pickup') {
    orderAmount.innerText = orderAmount.dataset.amount - orderAmount.dataset.delivery;
    addressFieldset.disabled = true;
    addressFieldset.classList.add('pickup');
    deliveryInfoHeading.innerText = "Pickup Location"
  } else {
    orderAmount.innerText = orderAmount.dataset.amount + orderAmount.dataset.delivery;
    addressFieldset.classList.remove('pickup');
    deliveryInfoHeading.innerText = "Delivery Info"
    addressFieldset.disabled = false;
  }
}

orderType.addEventListener('change', updateCheckoutPrice);
