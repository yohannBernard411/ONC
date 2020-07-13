const displayDropDownMenu = () => {
  const burger = document.getElementById("burger");
  const cross = document.getElementById("cross");
  const cubic = document.getElementById("cubic");
  const menu = document.getElementById("menu");
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