export const initTimer = () => {

  const workBtn = document.getElementById("work-btn")
  const shortBreakBtn = document.getElementById("short-break-btn")
  const longBreakBtn = document.getElementById("long-break-btn")
  const startBtn = document.getElementById("start-btn")
  const colors = ['#456FAB', '#EF9D82']

  let timeDisplay = document.getElementById("time-display")
  let timeout;
  let index = 0;

  workBtn.addEventListener("click", function () { startTimer(25 * 60) })
  longBreakBtn.addEventListener("click", function () { startTimer(15 * 60) })
  shortBreakBtn.addEventListener("click", function () { startTimer(5 * 60) })

  function startTimer(time) {
    if (typeof timeout !== undefined) {
      clearInterval(timeout)
    }
    let allowedTime = time
    let isPaused = true
    startBtn.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" viewBox="0 0 512 512"><title>ionicons-v5-c</title><path fill="#456fab" d="M256,48C141.31,48,48,141.31,48,256s93.31,208,208,208,208-93.31,208-208S370.69,48,256,48Zm74.77,217.3L216.32,334.44A10.78,10.78,0,0,1,200,325.13V186.87a10.78,10.78,0,0,1,16.32-9.31L330.77,246.7A10.89,10.89,0,0,1,330.77,265.3Z"/></svg>`
    showTime(time)
    timeout = setInterval(function () {
      if (allowedTime == 0) {
        clearInterval(timeout)
        showTime(0)
      } else {
        if (!isPaused) {
          allowedTime--
          showTime(allowedTime)
        }

      }
    }, 1000);

    function showTime(allowedTime) {
      let minutes = pad(Math.floor(allowedTime / 60))
      let seconds = pad(allowedTime % 60)

      let time = `${minutes}:${seconds}`
      document.title = time
      timeDisplay.innerText = time
    }

    function pad(number) {
      return number < 10 ? `0${number.toString()}` : number
    }




    startBtn.addEventListener("click", function (e) {
      e.preventDefault();
      isPaused = !isPaused;

      if (isPaused) {
        startBtn.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" viewBox="0 0 512 512"><title>ionicons-v5-c</title><path fill="#456fab" d="M256,48C141.31,48,48,141.31,48,256s93.31,208,208,208,208-93.31,208-208S370.69,48,256,48Zm74.77,217.3L216.32,334.44A10.78,10.78,0,0,1,200,325.13V186.87a10.78,10.78,0,0,1,16.32-9.31L330.77,246.7A10.89,10.89,0,0,1,330.77,265.3Z"/></svg>`
      } else {
        startBtn.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" viewBox="0 0 512 512"><title>ionicons-v5-c</title><path fill="#456fab" d="M256,48C141.31,48,48,141.31,48,256s93.31,208,208,208,208-93.31,208-208S370.69,48,256,48ZM224,320a16,16,0,0,1-32,0V192a16,16,0,0,1,32,0Zm96,0a16,16,0,0,1-32,0V192a16,16,0,0,1,32,0Z"/></svg>`
      }
    })
  }


}
