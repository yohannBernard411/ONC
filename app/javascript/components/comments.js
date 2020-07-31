const displayComments = () => {
  const commentField = document.getElementById("all-comments");
  const commentButton = document.getElementById("displayComment");
  commentButton.addEventListener("click", (event) => {
    commentField.classList.toggle("hidden-options");
  })
}

export { displayComments };
