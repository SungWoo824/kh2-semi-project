function scroll() {
  var bar = document.querySelector(".top-bar");

  if (window.scrollY > 70) {
    bar.classList.add("menu-fixed");
  } else {
    bar.classList.remove("menu-fixed");
  }
}
