const orderType = document.getElementById('order-type-form');
const orderAmount = document.querySelector('.order-amount');
console.log(orderAmount);

function updateCheckoutPrice(e) {
  if (e.target.value === 'pickup') {
    orderAmount.innerText = orderAmount.dataset.amount - orderAmount.dataset.delivery;
  } else {
    orderAmount.innerText = orderAmount.dataset.amount;
  }
}

orderType.addEventListener('change', updateCheckoutPrice);
