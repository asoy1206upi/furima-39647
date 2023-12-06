const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  
  
  // 価格が入力されている場合に手数料を計算し表示する
  if (inputValue) {
    const tax = Math.floor(inputValue * 0.1); // 価格の10%を手数料とする
    addTaxDom.innerHTML = tax.toLocaleString(); // 手数料を表示
  } else {
    addTaxDom.innerHTML = "add-tax-price"; // 価格が入力されていない場合は手数料をクリアする
    profitDom.innerHTML = "profit";
  }
});