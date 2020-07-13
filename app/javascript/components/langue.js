const displayFlag = () => {
  const flag = document.getElementById("langue");
  const label = document.getElementById("labelLangue").innerText;

  if (label == "fr"){
      flag.style.backgroundImage = "url('assets/frenchFlag.png')";
  }
  if (label == "en"){
      flag.style.backgroundImage = "url('assets/englishFlag.png')";
  }
  if (label == "es"){
      flag.style.backgroundImage = "url('assets/spainFlag.png')";
  }
}

export { displayFlag };
