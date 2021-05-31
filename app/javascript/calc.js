const calc = () =>{
  const item_price = document.getElementById("item-price");
  const item_tax = document.getElementById("add-tax-price");
  const item_benefit = document.getElementById("profit");
  const tax = 0.1;
  let num_tax = 0;
  let num_benefit = 0;
  item_price.addEventListener("keyup",()=>{
    item_tax.innerHTML = calc_tax(item_price,tax);
    const sum_tax = calc_tax(item_price,tax);
    item_benefit.innerHTML = calc_benefit(item_price,sum_tax);
  })
}

function calc_tax(item_price,tax){
 num_tax = item_price.value * tax;
 return num = Math.floor(num_tax);
};

function calc_benefit(item_price,sum_tax){
  num_benefit = item_price.value - sum_tax;
  return num_benefit;
}

window.addEventListener('load', calc)