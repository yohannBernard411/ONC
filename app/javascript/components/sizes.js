const displaySizes = () => {
  if (document.getElementById("displaySize")){
    const sizeField = document.getElementById("set-size");
    const sizeButton = document.getElementById("displaySize");
    sizeButton.addEventListener("click", (event) => {
      sizeField.classList.toggle("hidden-options");
      sizeField.classList.toggle("test");
      if (sizeField.classList.contains("test")){
        document.getElementById("set-size").scrollIntoView(); 
      }
    })
  }
}

export { displaySizes };
