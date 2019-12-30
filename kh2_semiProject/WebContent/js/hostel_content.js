const list_btn = document.querySelector(".js-list-btn");
//const location_btn = document.querySelector(".js-location-btn");
const review_btn = document.querySelector(".js-review-btn");
//const content_location = document.querySelector(".js-location");
const content_review = document.querySelector(".js-review");
const content_list = document.querySelector(".js-list");

function clicked_list_btn(event) {
  list_btn.classList.add("on");
//  location_btn.classList.remove("on");
  review_btn.classList.remove("on");
  content_on(content_list);
  content_off(content_review);
}

//function clicked_location_btn(event) {
//  location_btn.classList.add("on");
//  list_btn.classList.remove("on");
//  review_btn.classList.remove("on");
//  content_on(content_location);
//  content_off(content_list, content_review);
//}

function clicked_review_btn(event) {
  review_btn.classList.add("on");
//  location_btn.classList.remove("on");
  list_btn.classList.remove("on");
  content_on(content_review);
  content_off(content_list);
}

function content_on(t) {
  t.style.display = "block";
}

function content_off(t1) {
  t1.style.display = "none";
//  t2.style.display = "none";
}

function init() {
  clicked_list_btn("click");
  list_btn.addEventListener("click", clicked_list_btn);
//  location_btn.addEventListener("click", clicked_location_btn);
  review_btn.addEventListener("click", clicked_review_btn);
}

init();
