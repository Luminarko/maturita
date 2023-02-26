var targetDiv = document.getElementById("checkboxes");
var btn = document.getElementById("toggle");
var body = document.getElementById("body");

targetDiv.style.visibility = "hidden";
function clear(){
  document.getElementById("form").reset();
};
function toggle_filtr() {
  if (targetDiv.style.visibility == "hidden") {
    targetDiv.style.visibility = "visible";
  } else {
    targetDiv.style.visibility = "hidden"
  }

};