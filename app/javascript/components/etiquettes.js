const print = () => {
  if (document.getElementById("make")){
    const makeButton = document.getElementById("make");
    const allAdress = document.querySelectorAll(".info-right");
    makeButton.addEventListener("click", (event) => {
      const my_window = window.open('', 'mywindow', 'status=1,width=800,height=800');
      my_window.document.write('<html><head><title>Print Adress</title></head>');
      my_window.document.write('<body onafterprint="self.close()" style="overflow: scroll;">');
      my_window.document.write('<div style="display: flex; flex-flow: row wrap; justify-content: space-between;">');
        allAdress.forEach((adress) => {
          my_window.document.write(`<div style="border: dashed 1px black; width: 350px; height: auto; padding: 10px; margin-bottom: 5px">`);
          my_window.document.write(`<p>${adress.querySelector(".name").innerHTML}</p>`);
          my_window.document.write(`<div style="float: right; margin-top:-70px;"><p>Expédition:</p><img src="https://res.cloudinary.com/do3nu0tns/image/upload/v1597409542/phbwgxql8yjnhsgk21qi.png" style="width: 100px; height: auto"></div>`);
          my_window.document.write(`<p>${adress.querySelector(".adress").innerHTML}</p>`);
          my_window.document.write(`<p>${adress.querySelector(".zip-city").innerHTML}</p>`);
          if (adress.querySelector(".instructions")){
            my_window.document.write(`<p>${adress.querySelector(".instructions").innerHTML}</p>`);
          }
          if (adress.querySelector(".code")){
            my_window.document.write(`<p>${adress.querySelector(".code").innerHTML}</p>`);
          }
          my_window.document.write(`</div>`);
        });
      my_window.document.write('</div>');
      my_window.document.write('<button id="print">Imprimer les étiquettes</button>');
      my_window.document.write('</body></html>');
      const printButton = my_window.document.getElementById("print");
      printButton.addEventListener("click", (event) => {
        printButton.style.display = "none";
      my_window.print();
      });
    });
  };
};

export { print }