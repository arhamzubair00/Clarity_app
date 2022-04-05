# Clarity
## A diary for the neurodiverse
.
### Enjoy!

The application is available here:
## Clarity (https://www.clarityapp.xyz/)

<img width="1440" alt="image" src="https://user-images.githubusercontent.com/71766604/161750119-45737f86-e8e3-4993-a236-5a19626fe767.png">

<table>
  <tr>
    <td><img alt="image" src="https://user-images.githubusercontent.com/71766604/161750179-625272cf-cde1-4133-a607-81a9ea23d49d.png"></td>
    <td><img alt="image" src="https://user-images.githubusercontent.com/71766604/161752326-1d4e8b5d-de93-4eb6-b53b-abb870e74695.png"></td>
    <td><img alt="image" src="https://user-images.githubusercontent.com/71766604/161752671-3921754b-66f9-4524-864c-13309d405dce.png"></td>
    <td><img alt="image" src="https://user-images.githubusercontent.com/71766604/161750307-df1ec09a-e428-47a3-b3c0-1dbe9ac977a0.png"></td>
  </tr>
  <tr>
    <td><img alt="image" src="https://user-images.githubusercontent.com/71766604/161824001-875134cd-7343-4ee1-b887-8502ce58340c.png"></td>
    <td><img alt="image" src="https://user-images.githubusercontent.com/71766604/161824850-2bff7ef2-68da-4584-b659-53061cb95c03.png"></td>
    <td><img alt="image" src="https://user-images.githubusercontent.com/71766604/161825131-a8df7b56-36c9-4ecb-ab2c-fa8bebacb533.png"></td>
  </tr>
</table>

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```


### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

### Testing
### Log in as sophie@tremblay.com
### Password: topsecret

---


## Dev log

### Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping


<h3 align="center">Languages and Tools:</h3>
<p align="center">
<a href="https://www.ruby-lang.org/en/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/ruby/ruby-original.svg" alt="ruby" width="40" height="40"/> </a>
<a href="https://rubyonrails.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/rails/rails-original-wordmark.svg" alt="rails" width="40" height="40"/> </a>
<a href="https://www.postgresql.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg" alt="postgresql" width="40" height="40"/> </a>
<a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/javascript/javascript-original.svg" alt="javascript" width="40" height="40"/> </a>
<a href="https://www.w3.org/html/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original-wordmark.svg" alt="html5" width="40" height="40"/> </a>
<a href="https://www.w3schools.com/css/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/css3/css3-original-wordmark.svg" alt="css3" width="40" height="40"/> </a>
<a href="https://getbootstrap.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bootstrap/bootstrap-plain-wordmark.svg" alt="bootstrap" width="40" height="40"/> </a>
<a href="https://git-scm.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/git-scm/git-scm-icon.svg" alt="git" width="40" height="40"/> </a> <a href="https://heroku.com" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/heroku/heroku-icon.svg" alt="heroku" width="40" height="40"/> </a>
<a href="https://www.figma.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/figma/figma-icon.svg" alt="figma" width="40" height="40"/> </a>
</p>

---

## Design user flow using whimsical

<table>
  <tr>
    <td><img alt="image" src="https://user-images.githubusercontent.com/71766604/161825642-2bcd40dc-f9aa-4435-a4d4-3d4aa69331f4.png"></td>
</table>

---

## UX/UI using Figma


<table>
  <tr>
    <td><img  alt="image" src="https://user-images.githubusercontent.com/71766604/161823799-8f814e09-db89-4b31-bdcd-1ac4cb871036.png"></td>
</table>


---

## DB Schema 

### The final schema of the application:
<img alt="image" src="https://user-images.githubusercontent.com/71766604/161826464-a5380be9-bb83-44ae-b16d-12911b02870f.png">


---


## Back End

- User
	- Entire User logic was created using [DEVISE](https://github.com/heartcombo/devise)
	- Added Authentication logic to each page

- Mood
	- Entire User logic was created using [DEVISE](https://github.com/heartcombo/devise)

- Task
	- Entire User logic was created using [DEVISE](https://github.com/heartcombo/devise)

- Day
	- Entire User logic was created using [DEVISE](https://github.com/heartcombo/devise)
<!-- 
- Place
	- Photo attachment using [Cloudinary](https://cloudinary.com/) as active_storage
	- Phisical object, schools of dance, music clubs with occuring dancing events
- Event
	- Photo attachment using [Cloudinary](https://cloudinary.com/) as active_storage
	- Is taking place in "The Place" (duh!)
	- Created by User, owner of the Place
	- May have many attendants, groups and invites
- Invite
	- User can either add yourself to the even, invite someone else straight to the event or create a grou or add someone an existing group of people going together to the given event.
	- Each user story have differen routes and path and its carrying different sets of params throughout all views. Not challenging at all. Not even a bit... 
- Group
	- Backbone of the aplication
	- Internal dashboard for group of people going together to that one given event in that one place.
	- Fully dynamic with responsive menu allowing to add participants and with build in chat created using WebSocket and ActionCable
- Review
	- After participating with some other user in an event or after beeing with him in a group you can leave a "review" at his profile pic that only you will be able to modify, a part of gamification aspect of the application, depending on rating of those reviews each user will progress with level and get a new achievement.
- Chatroom
	- Part of the live chat logic in Group model
- Message
	- Look above! -->

---

## Extra features

- Entire User logic with authentication done with [DEVISE](https://github.com/heartcombo/devise)
- Webpack and Action Cable for Live Chat in Groups

---


## Front End


### feature
<!-- Animated background of the application is done purely with use of CSS and this is something I'm the most proud of.
It consists of a div with gradient moving basically left to right and top to bottom.
Inside the div, there is an empty list that serves as those animated squares in the background.
```
<div class="gradient"></div>
<ul class="circles">
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
</ul>
```

While gradient is just translating its position in two axis, list elements are moving vertically, rotating and decreasing opacity at the same time in a loop.

```
.gradient {
  z-index: -10;
  position: fixed;
  width: 100%;
  height: 100%;
  background: linear-gradient(-45deg, #8741e6, #b2519f, #da5e58, #d8b46e);
  background-size: 400% 400%;
  animation: my-gradient 10s ease infinite;
  overflow: hidden;
}

@keyframes my-gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.circles{
  padding: 0;
  margin: 0;
  z-index: -9;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.circles li{
  position: absolute;
  display: block;
  list-style: none;
  width: 40vw;
  height: 40vh;
  background: rgba(255, 255, 255, 0.2);
  animation: animate 25s linear infinite;
  bottom: -150px;
  
}

.circles li:nth-child(1){
  left: 25%;
  width: 80px;
  height: 80px;
  animation-delay: 0s;
}
``` -->

### Responsive Design
Lanping page is available for responsive designed
It could use some final touches, but overall I'd like to present examples below:

<table>
  <tr>
    <td><img src="" ></td>
    <td><img src="" ></td>
  </tr>
</table>


## Conclusion

Le Wagon Coding Bootcamp was simply the most amazing learning experience in my life with teaching quality I've never seen before and that application is the final showdown of all the skills acquired during the bootcamp.
There is still so much to do, but it's mostly refactoring and working on the front end.
The only important bit that is really missing is Testing and any TDD, CI/CD principles, but realistically, considering the time given - that was a necessary sacrifice.
Considering that this application is shared effort, despite all those missing elements I think it is a viable product and it suffices to leave it in that state.

## Acknowledgements

Big thank you to the most amazing team ever!

[Sophie Mattacks](https://github.com/SophieMatts)  For the initial idea and giving your heart and soul into this app. 🤍
     
     
[Arham Zubair](https://github.com/arhamzubair00) 
     
     
[Anton Gordon](https://github.com/JacqSiir) 
     
     
[Minsoo Cho](https://github.com/minsoocho-hj) 


## License
This project is licensed under the MIT License.
