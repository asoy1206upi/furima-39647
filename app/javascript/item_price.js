window.addEventListener('turbo:load', () => {
window.addEventListener('turbo:render', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    
    if (inputValue) {
      const tax = Math.floor(inputValue * 0.1);
      const profit = inputValue - tax;
      addTaxDom.innerHTML = tax.toLocaleString();
      profitDom.innerHTML = profit.toLocaleString();
    } else {
      addTaxDom.innerHTML = "";
      profitDom.innerHTML = "";
    }
  });
});
});