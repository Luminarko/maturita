var targetDiv = document.getElementById("checkboxes");
var btn = document.getElementById("toggle");
var body = document.getElementById("body");

targetDiv.style.top = "-20em"
targetDiv.style.position= "fixed"

function toggle_filtr() {
  if (targetDiv.style.top == "-20em") {
    targetDiv.style.top = "10em"
  } else {
    targetDiv.style.top = "-20em"
  }

};