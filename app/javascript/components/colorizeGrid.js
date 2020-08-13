const colorize = () => {
  if (document.getElementById("cart-index-title")){
    const allColorsTarget = document.querySelectorAll(".state-target");
    allColorsTarget.forEach((target) => {
      const texte = target.innerText;
      switch (texte) {
        case "paid":
          target.style.backgroundColor = "red";
          break;
        case "awaiting":
          target.style.backgroundColor = "orange";
          break;
        case "pending":
          target.style.backgroundColor = "orange";
          break;
        case "dispatched":
          target.style.backgroundColor = "yellow";
          break;
        case "closed":
          target.style.backgroundColor = "green";
          break;
      }

    })

  }
}

export { colorize }