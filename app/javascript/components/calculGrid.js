const sumInGrid = () => {
  if (document.getElementById("main-total")){
    const allSubTotal = document.querySelectorAll(".row-total");
    const myArray = [];
    const myArray2 = [];
    allSubTotal.forEach((subTotal) => {
      myArray.push(subTotal.innerText.slice(0, subTotal.innerText.length-7));
    });
    myArray.forEach((myString) => {
      myArray2.push(parseFloat(myString, 10));
    });
    const total = myArray2.reduce((a, b)=> a + b,0);
    const totalTarget = document.getElementById("main-total");
  }
}

export { sumInGrid };
