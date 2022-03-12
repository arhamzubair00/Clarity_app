const date = new Date();
let selectedDate = new Date();

export const renderCalendar = async() => {
  const tasks = await tasksOfMonth()

  date.setDate(1);
  const monthDays = document.querySelector(".days");
  const lastDay = new Date(
    date.getFullYear(),
    date.getMonth() + 1,
    0
  ).getDate();
  const prevLastDay = new Date(
    date.getFullYear(),
    date.getMonth(),
    0
  ).getDate();
  const firstDayIndex = date.getDay();
  const lastDayIndex = new Date(
    date.getFullYear(),
    date.getMonth() + 1,
    0
  ).getDay();
  const nextDays = 7 - lastDayIndex - 1;
  const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  document.querySelector(".date h1").innerHTML = months[date.getMonth()];
  document.querySelector(".date p").innerHTML = new Date().toDateString();
  let days = "";
  for (let x = firstDayIndex; x > 0; x--) {
    days += `<div class="prev-date ">${prevLastDay - x + 1}
    </div>`;
  }
  for (let i = 1; i <= lastDay; i++) {
    let dayOfMonth = new Date(date)
    dayOfMonth.setDate(i)
    const formattedDayOfMonth = dayOfMonth.toISOString().split('T')[0]
    const tasksOfDay = tasks.find(task => task.calendar_date == formattedDayOfMonth);
    const totalTasks = tasksOfDay ? tasksOfDay.total : ""
    if (
      i === new Date().getDate() &&
      date.getMonth() === new Date().getMonth()
    ) {
      days += `<div class="each-day today"><span>${i}</span>${totalTasks}</div>`;
    } else {
      days += `<div class="each-day"><span>${i}</span>${totalTasks}</div>`;
    }
    monthDays.innerHTML = days;
  }
  for (let j = 1; j <= nextDays; j++) {
    days += `<div class="next-date">${j}</div>`;
    monthDays.innerHTML = days;
  }

  document.querySelectorAll(".each-day span").forEach(day => {
    day.addEventListener("click", async event => {
      selectedDate = new Date(date);
      selectedDate.setDate(event.target.innerHTML);
      const formattedDate = selectedDate.toISOString().split('T')[0];
      const response = await fetch(`select_day_from_date?selected_date=${formattedDate}`);
      const responseJson = await response.json();
      console.log(responseJson["DayID"])
      window.location.href = `/days/${responseJson["DayID"]}`;
    });
  });

};

const tasksOfMonth = async () => {
  console.log('tasksOfMonth')
  const response = await fetch(`all_tasks`);
  const responseJson = await response.json();
  return responseJson;
  // console.log(JSON.parse(responseJson[1].task_titles));
};

const calendar = document.getElementById("calendar")
if (calendar){
  document.querySelector(".prev").addEventListener("click", () => {
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
  });

  document.querySelector(".next").addEventListener("click", () => {
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
  });


}





//If statement that checks if tasks on the date.
//If there aren't tasks, then direct to task/new page
//else direct to days/show (pomodoro)
