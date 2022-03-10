

export const initTimer = () => {

  const workBtn = document.getElementById("work-btn")
  const shortBreakBtn = document.getElementById("short-break-btn")
  const longBreakBtn = document.getElementById("long-break-btn")
  const startBtn = document.getElementById("start-btn")
  const pauseBtn = document.getElementById("pause-btn")
  const resetBtn = document.getElementById("reset-btn")



  let timeDisplay = document.getElementById("time-display")
  let timeout;



  workBtn.addEventListener("click", function () { startTimer(25 * 60) })
  longBreakBtn.addEventListener("click", function () { startTimer(15 * 60) })
  shortBreakBtn.addEventListener("click", function () { startTimer(5 * 60) })

  startBtn.addEventListener("click", function () { restartTimer() })
  pauseBtn.addEventListener("click", function () { pauseTimer() })
  resetBtn.addEventListener("click", function () { resetTimer() })


  function startTimer(time) {
    if (typeof timeout !== undefined) {
      clearInterval(timeout)
    }
    let allowedTime = time
    showTime(time)
    timeout = setInterval(function () {
      if (allowedTime == 0) {
        clearInterval(timeout)
        showTime(0)
      } else {
        allowedTime--
        showTime(allowedTime)
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

  }




  function pauseTimer(time) {

  }

  function restartTimer(time) {

  }

  function resetTimer(time) {


  }





























}
