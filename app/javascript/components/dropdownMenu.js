const displayDropDownMenu = () => {
  const cubic = document.getElementById("cubic");
  const menu = document.getElementById("menu");
  let repartX = document.querySelector(".header").offsetWidth * 0.1;
  const burger = document.getElementById("burger");
  const cross = document.getElementById("cross");
  const latMenu = (cubic.offsetHeight - burger.offsetHeight) / 2;
  const longMenu = (cubic.offsetWidth - burger.offsetWidth) / 2;
  burger.style.marginTop = - (latMenu - 40) + "px";
  burger.style.marginLeft = - (longMenu - 40) + "px";
  cross.style.marginTop = - (latMenu - 40) + "px";
  cross.style.marginLeft = - (longMenu - 40) + "px";
  if (document.querySelector(".header").offsetWidth >= 750){
    repartX = ((document.querySelector(".header").offsetWidth - 600) / 2);
  }
  menu.style.transform = `translate(${repartX}px, -300px`
  
  
  burger.classList.add("wait");
  cross.classList.add("action2");
  burger.style.transformOrigin= "center center";
  cross.style.transformOrigin= "center center";
  burger.addEventListener("click", () => {
    burger.classList.remove("wait");
    burger.classList.add("action");
    cross.classList.remove("action2");
    cross.classList.add("wait");
    cubic.classList.remove("restrict");
    cubic.classList.add("expand");
    menu.classList.remove("menuup");
    menu.classList.add("menudown");
  });
  cross.addEventListener("click", () => {
    cross.classList.remove("wait");
    cross.classList.add("action2");
    burger.classList.remove("action");
    burger.classList.add("wait");
    cubic.classList.remove("expand");
    cubic.classList.add("restrict");
    menu.classList.remove("menudown");
    menu.classList.add("menuup");
  });
}

export { displayDropDownMenu };