const displayMenu = () => {

  const smartphoneMenu = () => {
    const allItems = document.querySelectorAll(".my-card");
    allItems.forEach((card) => {
      card.style.transition = "0.5s";
      card.addEventListener("click", (event) => {
        allItems.forEach((item) => {
          if (item === event.path[1] || item === event.path[0]){
            item.style.height = "calc( calc( 100vh - 150px ) * 0.7 )";
            item.querySelector(".list").style.display = "block";
          } else {
            item.style.height = "calc( calc( 100vh - 150px ) * 0.1 )";
            item.querySelector(".list").style.display = "none";
          }
        });
      })
    })
  }
  const tabletteMenu = () => {
    const allItems = document.querySelectorAll(".my-card");
    const home = document.getElementById("home");
    const shop = document.getElementById("shop");
    const articles = document.getElementById("articles");
    const partners = document.getElementById("partners");
    allItems.forEach((item) => {
      item.style.transition = "all 1s ease-out";
    })
    home.addEventListener("click", (event) => {
      home.style.width = "70%";
      home.style.height = "70%";
      home.querySelector(".list").style.display = "block";
      shop.style.width = "30%";
      shop.style.height = "70%";
      shop.querySelector(".list").style.display = "none";
      articles.style.width = "70%";
      articles.style.height = "30%";
      articles.querySelector(".list").style.display = "none";
      partners.style.width = "30%";
      partners.style.height = "30%";
      partners.querySelector(".list").style.display = "none";
    })
    shop.addEventListener("click", (event) => {
      home.style.width = "30%";
      home.style.height = "70%";
      home.querySelector(".list").style.display = "none";
      shop.style.width = "70%";
      shop.style.height = "70%";
      shop.querySelector(".list").style.display = "block";
      articles.style.width = "30%";
      articles.style.height = "30%";
      articles.querySelector(".list").style.display = "none";
      partners.style.width = "70%";
      partners.style.height = "30%";
      partners.querySelector(".list").style.display = "none";
    })
    articles.addEventListener("click", (event) => {
      home.style.width = "70%";
      home.style.height = "30%";
      home.querySelector(".list").style.display = "none";
      shop.style.width = "30%";
      shop.style.height = "30%";
      shop.querySelector(".list").style.display = "none";
      articles.style.width = "70%";
      articles.style.height = "70%";
      articles.querySelector(".list").style.display = "block";
      partners.style.width = "30%";
      partners.style.height = "70%";
      partners.querySelector(".list").style.display = "none";
    })
    partners.addEventListener("click", (event) => {
      home.style.width = "30%";
      home.style.height = "30%";
      home.querySelector(".list").style.display = "none";
      shop.style.width = "70%";
      shop.style.height = "30%";
      shop.querySelector(".list").style.display = "none";
      articles.style.width = "30%";
      articles.style.height = "70%";
      articles.querySelector(".list").style.display = "none";
      partners.style.width = "70%";
      partners.style.height = "70%";
      partners.querySelector(".list").style.display = "block";
    })
  }

  const desktopMenu = () => {
    const allItems = document.querySelectorAll(".my-card");
    allItems.forEach((card) => {
      card.style.transition = "0.5s";
      card.addEventListener("click", (event) => {
        allItems.forEach((item) => {
          if (item === event.path[1]){
            item.style.width = "70%";
            item.querySelector(".list").style.display = "block";
          } else {
            item.style.width = "10%";
            item.querySelector(".list").style.display = "none";
          }
        });
      })
    })
  }

  if (document.getElementById("home")){
    if (window.matchMedia("(max-width: 500px)").matches) {
      smartphoneMenu();
    } else if (window.matchMedia("(min-width: 500px)").matches && window.matchMedia("(max-width: 1200px)").matches) {
      tabletteMenu();
    } else {
      desktopMenu();
    }
  }

}

export { displayMenu };
