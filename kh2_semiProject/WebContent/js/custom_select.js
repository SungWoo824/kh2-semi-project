window.addEventListener('load', function(){
    Object.prototype.insertAt = function(newNode, index){
    if(this.childNodes.length < index){
        throw "인덱스 범위 초과로 추가할 수 없습니다";
    }

    //비어있거나 최종 위치일경우 신규 추가
    if(!this.childNodes.length || this.childNodes.length <= index){
        this.appendChild(newNode);
        return;
    }

    var current = this.childNodes[0];

    for(var i=0; i < index; i++)
        current = current.nextSibling;
    
    this.insertBefore(newNode, current);
}

var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.querySelectorAll(".custom-select");
for (i = 0; i < x.length; i++) {
    selElmnt = x[i];
    /* select를 div로 포장하기 위한 코드*/
    var outer = document.createElement("div");
    outer.style.display = "inline-block";
    outer.style.paddingTop = "3px";
    outer.style.textAlign = "left";
    outer.style.verticalAlign = "middle";
    var parent = selElmnt.parentNode;
    var index = 0;
    var tmp = selElmnt;
    while((tmp = tmp.previousSibling) != null) index++;
    
    outer.appendChild(selElmnt);
    parent.insertAt(outer, index);

    /*for each element, create a new DIV that will act as the selected item:*/
    a = document.createElement("DIV");
    a.setAttribute("class", "select-selected");
    a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
    outer.appendChild(a);
    /*for each element, create a new DIV that will contain the option list:*/
    b = document.createElement("DIV");
    b.setAttribute("class", "select-items select-hide");
    for (j = 0; j < selElmnt.length; j++) {
        /*for each option in the original select element,
        create a new DIV that will act as an option item:*/
        c = document.createElement("DIV");
        c.innerHTML = selElmnt.options[j].innerHTML;
        c.addEventListener("click", function (e) {
            /*when an item is clicked, update the original select box,
            and the selected item:*/
            var y, i, k, s, h;
            s = this.parentNode.parentNode.querySelector(".custom-select");
            h = this.parentNode.previousSibling;
            for (i = 0; i < s.length; i++) {
                if (s.options[i].innerHTML == this.innerHTML) {
                    s.selectedIndex = i;
                    h.innerHTML = this.innerHTML;
                    s.options[i].selected = true;
                    y = this.parentNode.getElementsByClassName("same-as-selected");
                    for (k = 0; k < y.length; k++) {
                        y[k].removeAttribute("class");
                    }
                    this.setAttribute("class", "same-as-selected");
                    break;
                }
            }
            h.click();
        });
        b.appendChild(c);
    }
    outer.appendChild(b);
    a.addEventListener("click", function (e) {
        /*when the select box is clicked, close any other select boxes,
        and open/close the current select box:*/
        e.stopPropagation();
        closeAllSelect(this);
        this.nextSibling.classList.toggle("select-hide");
        this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
    /*a function that will close all select boxes in the document,
    except the current select box:*/
    var x, y, i, arrNo = [];
    x = document.getElementsByClassName("select-items");
    y = document.getElementsByClassName("select-selected");
    for (i = 0; i < y.length; i++) {
        if (elmnt == y[i]) {
            arrNo.push(i)
        } else {
            y[i].classList.remove("select-arrow-active");
        }
    }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
});