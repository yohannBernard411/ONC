const colorize = () => {
  if (document.getElementById("cart-index-title")){
    const allColorsTarget = document.querySelectorAll(".state-target");
    allColorsTarget.forEach((target) => {
      const texte = target.innerText;
      switch (texte) {
        case "payé":
          target.style.backgroundColor = "red";
          break;
        case "réalisation":
          target.style.backgroundColor = "orange";
          break;
        case "réalisé":
          target.style.backgroundColor = "yellow";
          break;
        case "envoi":
          target.style.backgroundColor = "green";
          break;
        case "cloturé":
          target.style.backgroundColor = "lightblue";
          break;
      }

    })

  }
}

export { colorize }