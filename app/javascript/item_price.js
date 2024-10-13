function calculate (){
  const itemPriceText  = document.getElementById("item-price");
  itemPriceText.addEventListener("keyup", () => {
    const itemPriceValue = itemPriceText.value;
    const addTaxPriceText  = document.getElementById("add-tax-price");
    const profitText  = document.getElementById("profit");
    
    addTaxPriceText.innerHTML = `${Math.floor(itemPriceValue * 0.1)}`;
    profitText.innerHTML = `${Math.floor(itemPriceValue * 0.9)}`;
  });
};
window.addEventListener('turbo:load', calculate);
