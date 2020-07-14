const displayStars = () => {
  // recup id
  const scores = document.getElementsByClassName("slide");
  const displays = document.getElementsByClassName("displaystars");
  for (let rang = 0; rang < scores.length; rang +=1 ){
    const score = scores[rang];
    console.log(score);
    const display = displays[rang];
    const value = score.innerHTML;
    const id = score.id.slice(5-(score.id.length));
    const full = parseInt(Math.floor(value), 10);
    let decount = full;
    while (decount > 0){
      display.insertAdjacentHTML("beforeend", "<i class='fas fa-star'></i>");
      decount -= 1;
    }
    let remaind = (value - full).toFixed(1);
    if (remaind > 0.25 && remaind < 0.75){
      display.insertAdjacentHTML("beforeend", "<i class='fas fa-star-half-alt'></i>");
      full += 1;
    }
    if (remaind > 0.75){
      display.insertAdjacentHTML("beforeend", "<i class='fas fa-star'></i>");
      full += 1;
    }
    while (5 - full > 0){
      display.insertAdjacentHTML("beforeend", "<i class='far fa-star'></i>");
      full += 1;
    }
    // //add color to delivery
    console.log(id);
    const delivery = document.getElementById("delivery"+id);
    delivery.style.color = document.getElementById("indexColor"+id).innerText;
    //check empty option
    const option = document.getElementById("option"+id);
    if (option.innerText == "" ){
        option.style.visibility = "hidden";
    }
  }
}

export { displayStars };
