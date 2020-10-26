const accordionMenu = () => {
  //ciblage
  const btnconnection = document.getElementById("connection");
  const btnlangue = document.getElementById("language");
  const btncart = document.getElementById("cart");
  const menuconnection = document.getElementById("connectionMenu");
  const menulangue = document.getElementById("langue");
  const menucart = document.getElementById("cartMenu");
  //initialisation
  menuconnection.style.display = "none";
  menulangue.style.display = "none";
  menucart.style.display = "none";
  //action
  btnconnection.addEventListener("click", (event) => {
    if (menuconnection.style.display == "none"){
      menuconnection.style.display = "block";
      btnconnection.style.transform= "rotateZ(-90deg)";
    }else{
      menuconnection.style.display = "none";
      btnconnection.style.transform= "rotateZ(0deg)";
    }
  });
  btnlangue.addEventListener("click", (event) => {
    if (menulangue.style.display == "none"){
      menulangue.style.display = "block";
      btnlangue.style.transform= "rotateZ(-90deg)";
    }else{
      menulangue.style.display = "none";
      btnlangue.style.transform= "rotateZ(0deg)";
    } 
  });
  btncart.addEventListener("click", (event) => {
    if (menucart.style.display == "none"){
      menucart.style.display = "block";
      btncart.style.transform= "rotateZ(-90deg)";
    }else{
      menucart.style.display = "none";
      btncart.style.transform= "rotateZ(0deg)";
    } 
  });
}

export { accordionMenu};