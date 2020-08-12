const displayViewer = () => {
  if (document.getElementById("showmain")){
    //recup les elements
    let rank = 0;
    const allPictures = document.querySelectorAll(".picture");
    const allOptionShow = document.querySelectorAll(".option-show");
    const allOverflowOption = document.querySelectorAll(".overflow_option");
    const leftButton = document.getElementById("left-button");
    const rightButton = document.getElementById("right-button");
    const miniatures = document.querySelectorAll(".miniature");
    if (allPictures.length > 1){
      
      rightButton.addEventListener("click", (event) => {
        rank -= 1;
        if (rank === -1){
          rank = (miniatures.length-1);
        }
        displayPicture();
      });
      leftButton.addEventListener("click", (event) => {
        rank += 1;
        if (rank === miniatures.length){
          rank = 0;
        }
        displayPicture();
      });
      
      miniatures.forEach((miniature) => {
        miniature.addEventListener("click", (event) => {
          rank = parseInt(event.target.id.slice(9, event.target.id.length), 10);
          displayPicture();
        })
      });

      const displayPicture = () => {
        allPictures.forEach((picture) => {
          picture.style.display = "none";
        });
        allOptionShow.forEach((option) => {
          option.style.display = "none";
        });
        allOverflowOption.forEach((overflow) => {
          overflow.style.display = "none";
        });
        allPictures[rank].style.display = "block";
        allOptionShow[rank].style.display = "block";
        allOverflowOption[rank].style.display = "block";
      }

      displayPicture();
    }else{
      leftButton.style.display = "none";
      rightButton.style.display = "none";
      miniatures[0].style.display = "none";
    }
  }
}

export { displayViewer };
