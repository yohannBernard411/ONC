const displayFlag = () => {
  const flag = document.getElementById("langue");
  const label = document.getElementById("labelLangue").innerText;

  if (label == "fr"){
      flag.style.backgroundImage = "url('/images/frenchFlag.png')";
  }
  if (label == "en"){
      flag.style.backgroundImage = "url('/images/englishFlag.png')";
  }
  if (label == "es"){
      flag.style.backgroundImage = "url('/images/spainFlag.png')";
  }
}

export { displayFlag };
