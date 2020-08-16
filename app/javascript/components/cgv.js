const checkboxcgv = () => {
  if (document.getElementById("btncgv")){
    const btncgv = document.getElementById("btncgv");
    const btnsignup = document.getElementById("btn-signup");
    btncgv.addEventListener("click", (event) => {
      if (btnsignup.disabled){
        btnsignup.disabled = false;
      }else if (!btnsignup.disabled){
        btnsignup.disabled = true;
      }
      btnsignup.classList.toggle("inactifbtn");
    });
  };
}

export { checkboxcgv }
