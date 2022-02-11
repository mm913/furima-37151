window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  const commission = document.getElementById("add-tax-price")
  const gain = document.getElementById("profit")

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  
  commission.innerHTML = Math.floor(inputValue * 0.1);
  
  gain.innerHTML = Math.floor(inputValue - commission.innerHTML );
  })
})
