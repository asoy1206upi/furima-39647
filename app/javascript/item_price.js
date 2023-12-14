window.addEventListener('turbo:load', () => {
window.addEventListener('turbo:render', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    
    // 価格が入力されている場合に手数料と利益を計算して表示する
    if (inputValue) {
      const tax = Math.floor(inputValue * 0.1); // 価格の10%を手数料とする
      const profit = inputValue - tax; // 利益を計算
      addTaxDom.innerHTML = tax.toLocaleString(); // 手数料を表示
      profitDom.innerHTML = profit.toLocaleString(); // 利益を表示
    } else {
      addTaxDom.innerHTML = ""; // 価格が入力されていない場合は手数料をクリアする
      profitDom.innerHTML = ""; // 価格が入力されていない場合は利益をクリアする
    }
  });
});
});