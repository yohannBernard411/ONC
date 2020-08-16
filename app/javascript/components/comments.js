const displayComments = () => {
  if (document.getElementById("displayComment")){
    const commentField = document.getElementById("all-comments");
    const commentButton = document.getElementById("displayComment");
    commentButton.addEventListener("click", (event) => {
      commentField.classList.toggle("hidden-options");
      commentField.classList.toggle("flex-options");
      if (commentField.classList.contains("flex-options")){
        document.getElementById("all-comments").scrollIntoView(); 
      }
    })
  }
}

export { displayComments };
