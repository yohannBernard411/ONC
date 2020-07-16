const sumInGrid = () => {
  if (document.getElementById("main-total")){
    const allSubTotal = document.querySelectorAll(".row-total");
    const myArray = [];
    const myArray2 = [];
    allSubTotal.forEach((subTotal) => {
      myArray.push(subTotal.innerText.slice(0, subTotal.innerText.length-7));
    });
    console.log(myArray);
    myArray.forEach((myString) => {
      myArray2.push(parseFloat(myString, 10));
    });
    console.log(myArray2);
    const total = myArray2.reduce((a, b)=> a + b,0);
    console.log(total);
    const totalTarget = document.getElementById("main-total");
    totalTarget.innerText = `${total}.00 Euros.`;
  }
}

export { sumInGrid };
