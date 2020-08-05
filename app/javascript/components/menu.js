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
    const delay = 50;
    const transition = ".2s";
    const allItems = document.querySelectorAll(".my-card");
    const body = document.getElementById("home-body");
    const home = document.getElementById("home");
    const shop = document.getElementById("shop");
    const articles = document.getElementById("articles");
    const partners = document.getElementById("partners");
    let currentTarget = home.querySelector(".list");

    home.addEventListener("click", (event) => {
      body.style.transition = "0s";
      body.style.opacity = "0";
      const redisplay = () => {
        body.style.transition = transition;
        body.style.opacity = "1";
      }
      body.style.backgroundImage = "linear-gradient(315deg, rgba(236, 234, 226, 1), rgba(250, 250, 250, 0)), url('https://res.cloudinary.com/do3nu0tns/image/upload/v1596535301/ffuiowogord1ullhpb2w.jpg')";
      const tempo = setTimeout(redisplay, delay);
      currentTarget.style.transform = "translateX(100vw)";
      currentTarget = home.querySelector(".list");
      currentTarget.style.transform = "translateX(0)";
      const list = home.querySelector(".list");
      const screenWidth = document.body.getBoundingClientRect().width;
      const listWidth = home.querySelector(".list").getBoundingClientRect().width;
      const offsetX = (screenWidth - listWidth) / 2;
      list.style.margin = `50px ${offsetX}px`;
      
    })
    shop.addEventListener("click", (event) => {
      body.style.transition = "0s";
      body.style.opacity = "0";
      const redisplay = () => {
        body.style.transition = transition;
        body.style.opacity = "1";
      }
      body.style.backgroundImage = "linear-gradient(315deg, rgba(236, 234, 226, 1), rgba(250, 250, 250, 0)), url('https://res.cloudinary.com/do3nu0tns/image/upload/v1596535601/tv6wbiqqx0a6bo95rmhn.jpg')";
      const tempo = setTimeout(redisplay, delay);
      currentTarget.style.transform = "translateX(100vw)";
      currentTarget = shop.querySelector(".list");
      currentTarget.style.transform = "translateX(0)";
      const list = shop.querySelector(".list");
      const screenWidth = document.body.getBoundingClientRect().width;
      const listWidth = shop.querySelector(".list").getBoundingClientRect().width;
      const offsetX = ((screenWidth - listWidth) / 2) - shop.getBoundingClientRect().width;
      list.style.margin = `50px ${offsetX}px`;
      list.style.transform = "translateX(0)";
    })
    articles.addEventListener("click", (event) => {
      body.style.transition = "0s";
      body.style.opacity = "0";
      const redisplay = () => {
        body.style.transition = transition;
        body.style.opacity = "1";
      }
      body.style.backgroundImage = "linear-gradient(315deg, rgba(236, 234, 226, 1), rgba(250, 250, 250, 0)), url('https://res.cloudinary.com/do3nu0tns/image/upload/v1596535860/oaj8rjccadp4n7lgcgst.jpg')";
      const tempo = setTimeout(redisplay, delay);
      currentTarget.style.transform = "translateX(100vw)";
      currentTarget = articles.querySelector(".list");
      currentTarget.style.transform = "translateX(0)";
      const list = articles.querySelector(".list");
      const screenWidth = document.body.getBoundingClientRect().width;
      const listWidth = articles.querySelector(".list").getBoundingClientRect().width;
      const offsetX = ((screenWidth - listWidth) / 2) - (articles.getBoundingClientRect().width * 2);
      list.style.margin = `50px ${offsetX}px`;
      list.style.transform = "translateX(0)";
    })
    partners.addEventListener("click", (event) => {
      body.style.transition = "0s";
      body.style.opacity = "0";
      const redisplay = () => {
        body.style.transition = transition;
        body.style.opacity = "1";
      }
      body.style.backgroundImage = "linear-gradient(315deg, rgba(236, 234, 226, 1), rgba(250, 250, 250, 0)), url('https://res.cloudinary.com/do3nu0tns/image/upload/v1596536935/tbtiwdgieww6vve0fwap.jpg')";
      const tempo = setTimeout(redisplay, delay);
      currentTarget.style.transform = "translateX(100vw)";
      currentTarget = partners.querySelector(".list");
      currentTarget.style.transform = "translateX(0)";
      const list = partners.querySelector(".list");
      const screenWidth = document.body.getBoundingClientRect().width;
      const listWidth = partners.querySelector(".list").getBoundingClientRect().width;
      const offsetX = ((screenWidth - listWidth) / 2) - (partners.getBoundingClientRect().width * 3);
      list.style.margin = `50px ${offsetX}px`;
      list.style.transform = "translateX(0)";
    })
  }

  if (document.getElementById("home")){
    if (window.matchMedia("(max-width: 500px)").matches) {
      smartphoneMenu();
    } else if (window.matchMedia("(min-width: 501px)").matches && window.matchMedia("(max-width: 1200px)").matches) {
      tabletteMenu();
    } else {
      desktopMenu();
    }
  }

}

export { displayMenu };
