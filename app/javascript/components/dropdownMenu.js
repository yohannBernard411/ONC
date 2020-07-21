const displayDropDownMenu = () => {
  const cubic = document.getElementById("cubic");
  const menu = document.getElementById("menu");
  cubic.insertAdjacentHTML("beforeend", '<p id="burger" class="wait">&equiv;</p>');
  cubic.insertAdjacentHTML("beforeend", '<p id="cross" class="action2">&times;</p>');
  const burger = document.getElementById("burger");
  const cross = document.getElementById("cross");
  burger.style.right = ((90 - burger.getBoundingClientRect()) / 2) + "px";
  cross.style.right = "22px";
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