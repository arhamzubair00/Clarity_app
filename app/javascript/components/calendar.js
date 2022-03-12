const date = new Date();
let selectedDate = new Date();

export const renderCalendar = () => {

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
    if (
      i === new Date().getDate() &&
      date.getMonth() === new Date().getMonth()
    ) {
      days += `<div class="each-day today"><span>${i}</span><button class="btn-add-task">➕</button></div>`;
      console.log("found current date: " + i);
    } else {
      console.log("adding day: " + i);
      days += `<div class="each-day"><span>${i}</span><button class="btn-add-task">➕</button></div>`;
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
      console.log(selectedDate);
      const response = await fetch('select_day_from_date');
      const responseJson = await response.json();
      console.log(responseJson["Message"])
    });
  })

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






//3. Create POST request to send the date to a controller method (task/new)
//4. Once date in controller method, create new task (day.calendar_date)
//4a. Create instance of day, assign that day to the below new task - new task has a day_id attached to it.
//4b. day= Day.new(user_id: 1, calendar_date: <date from frontend>), need to convert date from frontend into Ruby date format.
//4c. Task.new(day_id: day, title:)
//5. If we created a task for 5th March, Task.where(day_id: Day.where(calendar_date: <date from frontend>))
