const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = parseInt(priceInput.value); // 入力された価格を整数に変換
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  
  if (!isNaN(inputValue)) { // 入力値が数値であることを確認
    const tax = Math.floor(inputValue * 0.1); // 価格の10%を手数料とする
    addTaxDom.innerHTML = tax.toLocaleString(); // 手数料を表示
    
    const profit = inputValue - tax; // 利益を計算
    profitDom.innerHTML = profit.toLocaleString(); // 利益を表示
  } else {
    addTaxDom.innerHTML = "0"; // 価格が入力されていない場合は手数料をクリアする
    profitDom.innerHTML = "0"; // 利益もクリア
  }
});