var targetDiv = document.getElementById("checkboxes");
var btn = document.getElementById("toggle");

targetDiv.style.visibility = "hidden"
targetDiv.style.top = "-1000em"
targetDiv.style.position= "fixed"

function toggle_filtr() {
  if (targetDiv.style.visibility == "visible") {
    targetDiv.style.top = "-1000em"
    targetDiv.style.visibility = "hidden"
  } else {
    targetDiv.style.top = "5em"
    targetDiv.style.visibility = "visible"
  }
};