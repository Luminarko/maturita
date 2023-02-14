var filter = new Array();

document.getElementById("btn") = function getChecked() {  
    var markedCheckbox = document.getElementsByName('checkbox');  
    for(var checkbox of markedCheckbox) {  
      if (checkbox.checked){  
        filter.push = checkbox.value;
      }
    }  
  }
console.log(filter);
document.getElementById("div").innerHTML = filter;