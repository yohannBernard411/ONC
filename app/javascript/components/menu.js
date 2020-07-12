const displayMenu = () => {
  const allItems = document.querySelectorAll(".my-card");
  allItems.forEach((card) => {
    card.style.transition = "0.5s";
    card.addEventListener("click", (event) => {
      allItems.forEach((item) => {
        if (item === event.path[1]){
          item.style.height = "70%";
          item.querySelector(".list").style.display = "block";
        } else {
          item.style.height = "10%";
          item.querySelector(".list").style.display = "none";
        }
      });
    })
  })
}

export { displayMenu };
