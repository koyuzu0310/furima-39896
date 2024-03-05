const price = () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener('input', () => {
    const price = parseFloat(priceInput.value);

    if (!isNaN(price)) {
      const taxPrice = Math.floor(price * 0.1);
      const profit = Math.floor(price * 0.9);

      document.getElementById("add-tax-price").textContent = taxPrice;
      document.getElementById("profit").textContent = profit;
    } else {
      // 金額が数値ではない場合の処理
      document.getElementById("add-tax-price").textContent = 0;
      document.getElementById("profit").textContent = 0;
    }
  });
};

window.addEventListener("turbo:load",price);
window.addEventListener("turbo:render", price)