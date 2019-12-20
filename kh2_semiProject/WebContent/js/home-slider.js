function item3__slider() {
  // var item3__img = document.querySelector(".item3__img");
  // item3__img.
  var list = document.querySelectorAll(".item3__list > img");
  // for(var i=0; i < list.length; i++){

  // }

  //   list.forEach(function(element, index) {
  //     //element에 각각 click이벤트를 설정
  //     element.addEventListener("click", function() {
  //       //this == 선택된 이미지 태그
  //       var target = document.querySelector(".item3__imagebox > img");
  //       target.src = this.src;
  //     });
  //   });

  for (var i = 0; i < list.length; i++) {
    list[i].addEventListener("click", function() {
      var target = document.querySelector(".item3__imagebox > img");
      target.src = this.src;

      //전체 비활성화 처리
      for (var k = 0; k < list.length; k++) {
        list[k].classList.remove("active");
      }
      //활성화 처리
      this.classList.add("active");
    });
  }
}
