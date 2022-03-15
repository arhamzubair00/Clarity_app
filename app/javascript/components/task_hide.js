/* export const hideTask = () {
  // Get the container element
  var btnContainer = document.getElementById("task-list");

  // Get all buttons with class="btn" inside the container
  var btns = btnContainer.getElementsByClassName("task-list-title");

  // Loop through the buttons and add the active class to the current/clicked button
  for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function () {
      var current = document.getElementsByClassName("active");

      // If there's no active class
      if (current.length > 0) {
        current[0].className = current[0].className.replace(" active", "");
      }

      // Add the active class to the current/clicked button
      this.className += " active";
    });
  }

  function hideNewTask() {
    const error = document.querySelector(".invalid-feedback");
    console.log(error)
    var x = document.getElementById("hidden");
    var y = document.getElementById("cancel-task-btn");
    var z = document.getElementById("new-task-btn");
    console.log(x)
    if (x.style.display === "none") {
      x.style.display = "block";
      y.style.display = "block";
      z.style.display = "none";
    } else {
      x.style.display = "none";
      y.style.display = "none";
      z.style.display = "block";
    }
  }
}
 */
