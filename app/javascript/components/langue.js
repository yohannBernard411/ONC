const displayFlag = () => {
  const flag = document.getElementById("langue");
  const label = document.getElementById("labelLangue").innerText;

  if (label == "fr"){
      flag.style.backgroundImage = "url('http://res.cloudinary.com/do3nu0tns/image/upload/v1594636554/uhp1p9zd9r3r5ebdhgut.png')";
  }
  if (label == "en"){
      flag.style.backgroundImage = "url('http://res.cloudinary.com/do3nu0tns/image/upload/v1594636536/tnwihq9ujhejylxdoie7.png')";
  }
  if (label == "es"){
      flag.style.backgroundImage = "url('http://res.cloudinary.com/do3nu0tns/image/upload/v1594636570/xiavqojbs4lkpl7gpiaw.png')";
  }
}

export { displayFlag };
