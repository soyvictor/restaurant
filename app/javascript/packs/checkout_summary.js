// const orderType = document.getElementById('order-type-form');
// const orderAmount = document.querySelector('.order-amount');
// const addressFieldset = document.querySelector('.address-fieldset');
// const deliveryInfoHeading = document.querySelector('.delivery-info-heading');
// const pickupLocationDiv = document.querySelector('.pickup-location');
// const deliveryFee = document.querySelector('.delivery-fee');

// function updateCheckoutPrice(e) {
//   e.currentTarget.submit();
//   if (e.target.value === 'pickup') {
//     orderAmount.innerText = orderAmount.dataset.amount;
//     addressFieldset.disabled = true;
//     addressFieldset.classList.add('pickup');
//     deliveryInfoHeading.innerText = "Pickup Location"
//     pickupLocationDiv.innerHTML = '<p>Tortas Mr. Elorduy</p><p>2849 Olive Ave</p><p>Fremont, CA 94539</p>';
//   } else {
//     orderAmount.innerText = (parseInt(orderAmount.dataset.amount, 10) + parseInt(orderAmount.dataset.delivery, 10)).toFixed(2);
//     addressFieldset.classList.remove('pickup');
//     deliveryInfoHeading.innerText = "Delivery Info"
//     addressFieldset.disabled = false;
//         pickupLocationDiv.innerHTML = '';
//   }

// }

// orderType.addEventListener('change', updateCheckoutPrice);
