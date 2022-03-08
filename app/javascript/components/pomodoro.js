

export const initTimer = () => {

  const workBtn = document.getElementById("work-btn")
  const shortBreakBtn = document.getElementById("short-break-btn")
  const longBreakBtn = document.getElementById("long-break-btn")
  let timeDisplay = document.getElementById("time-display")
  let timeout;

  workBtn.addEventListener("click", function () { startTimer(25 * 60) })
  longBreakBtn.addEventListener("click", function () { startTimer(15 * 60) })
  shortBreakBtn.addEventListener("click", function () { startTimer(5 * 60) })

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
}
