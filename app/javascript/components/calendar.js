const date = new Date();
const currentMonth = new Date();
let selectedDate = new Date();

const renderTasks = (tasks, dayForTasks) => {
  let dayOfMonth = new Date(currentMonth)
  dayOfMonth.setDate(dayForTasks)
  const formattedDayOfMonth = dayOfMonth.toISOString().split('T')[0]
  const tasksOfDay = tasks.find(task => task.calendar_date == formattedDayOfMonth);
  let renderedTasks = ""
  if(tasksOfDay){
    JSON.parse(tasksOfDay.task_titles).forEach (taskTitle => {
      renderedTasks += `<div class="task">
        <p class="card-text">${taskTitle}</p>
       </div>`
    })
  }
  return renderedTasks;
}

const renderPomodoroButton = async(dayForPomodoro) => {
  const dateForPomodoro = new Date(currentMonth);
  dateForPomodoro.setDate(dayForPomodoro);
  const formattedDate = dateForPomodoro.toISOString().split('T')[0];
  const response = await fetch(`select_day_from_date?selected_date=${formattedDate}`);
  const responseJson = await response.json();
  console.log(responseJson["DayID"])
  return `<button class="card-btn"><a href="/days/${responseJson["DayID"]}">Pomodoro</a></button>`
}

const renderTaskCards = async (tasks) => {
  const taskCards = document.querySelector("#task-cards");
  const pomodoroButton = await renderPomodoroButton(currentMonth.getDate())
  taskCards.innerHTML = `
  <div class="task-card">
  <div class="row-card">
    <div class="card" style="width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">${currentMonth.getDate()-1}</h5>
        ${renderTasks(tasks, currentMonth.getDate() - 1)}
      </div>
    </div>
  </div>
  <div class="task-card">
    <div class="row-card">
      <div class="card" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title-center">${currentMonth.getDate()}</h5>
          ${renderTasks(tasks, currentMonth.getDate())}
          ${pomodoroButton}
        </div>
      </div>
    </div>
  </div>
  <div class="task-card">
    <div class="row-card">
      <div class="card" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title">${currentMonth.getDate() + 1}</h5>
          ${renderTasks(tasks, currentMonth.getDate() + 1)}
        </div>
      </div>
    </div>
  </div>
</div>`

}





//RENDER CALENDAR FUNCTION
export const renderCalendar = async() => {
  const tasks = await tasksOfMonth()

  await renderTaskCards(tasks)

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

    let taskDot = ""
    if (tasksOfDay) {
      if (dayOfMonth.getTime() > new Date().getTime()) {
        taskDot = `<span class="dot">🗓</span>`
      }
      else if (tasksOfDay.total == tasksOfDay.total_done){
        taskDot = `<span class="dot">✅</span>`
      }else {
        taskDot = `<span class="dot">❌</span>`
      }
    }


    if (
      i === new Date().getDate() &&
      date.getMonth() === new Date().getMonth()
    ) {
      days += `<div class="each-day today"><span id="date-span">${i}</span>${taskDot}</div>`;
    } else {
      days += `<div class="each-day"><span id="date-span">${i}</span>${taskDot}</div>`;
    }
    monthDays.innerHTML = days;
  }
  for (let j = 1; j <= nextDays; j++) {
    days += `<div class="next-date">${j}</div>`;
    monthDays.innerHTML = days;
  }

  document.querySelectorAll(".each-day").forEach(day => {
    day.addEventListener("click", async event => {
      selectedDate = new Date(date);
      selectedDate.setDate(event.target.querySelector("#date-span").innerHTML);
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
