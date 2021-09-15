
window.addEventListener('input', function(){
  const price = document.getElementById("item-price");
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  price.addEventListener('input', function(){
    const tax = 0.10;
    const value = price.value;
    taxPrice.innerHTML = value*tax;
    profit.innerHTML = value*(1-tax);
  })
})