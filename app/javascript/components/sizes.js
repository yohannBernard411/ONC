const displaySizes = () => {
  const sizeField = document.getElementById("set-size");
  const sizeButton = document.getElementById("displaySize");
  sizeButton.addEventListener("click", (event) => {
    sizeField.classList.toggle("hidden-options");
  })
}

export { displaySizes };
