const displayComments = () => {
  if (document.getElementById("displayComment")){
    const commentField = document.getElementById("all-comments");
    const commentButton = document.getElementById("displayComment");
    console.log(commentButton);
    commentButton.addEventListener("click", (event) => {
      console.log("tu as cliqué");
      commentField.classList.toggle("hidden-options");
    })
  }
}

export { displayComments };
