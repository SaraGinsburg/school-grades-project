$(function () {
  console.log('students.js is loaded')
  listenForClick()
  listenForAssignmentDetailsClick()
  // listenFor.....()
});

function listenForClick() {
  $('button#user-subjects').on('click', function(event) {
    event.preventDefault()
    getUserSubjects()
  })
}

function listenForAssignmentDetailsClick() {
  $('.assignment-data').on('click', function(event) {
    event.preventDefault()
    console.log("in listenForAssignmentDetailsClick")
    getAssignment()
  })
}


function getAssignment(){
  console.log("in getAssignment")
  a = event.target.getAttribute('assignid')
  s = event.target.getAttribute('subjectid')

  $.ajax({
    url: 'http://localhost:3000/subjects/' + s + '/assignments/' + a,
    method: 'get',
    dataType: 'json',
    success: function(data){
      console.log("the assignment data is: ", data)
      const newAssignment = new Assignment(data)
      const newAssignmentHtml = newAssignment.assignHTML()
$(`#${a}`).html(newAssignmentHtml)
      event.target.innerHTML = newAssignmentHtml
    }
  })
}

function getUserSubjects(){
  uid = window.location.href.split('/')[4]
  uid = uid.replace(/\D/g,'');
  console.log("in getUserSubjects")

  $.ajax({
    url: 'http://localhost:3000/users/'+ uid + '/subjects',
    method: 'get',
    dataType: 'json',
    success: function(data) {
      console.log("the data is: ", data)
      data.map(subject => {
        const newSubject = new Subject(subject)
        const newSubjectHtml = newSubject.subjectHTML()
        document.getElementById('ajax-subjects').innerHTML += newSubjectHtml
      })
    }
  })
}

class Assignment{
  constructor(obj){
    this.id = obj.id
    this.subject_id = obj.subject_id
    this.assignment_type = obj.assignment_type
    this.name = obj.name
    this.notes = obj.notes
  }
}


Assignment.prototype.assignHTML = function (){
  return (`
    <div class='assignment'>
      <p>
      ${this.name}<br>
			${this.notes}<br>
			${typeof this.description !== "undefined" ?  this.description : ""}
      </p>
		</div>
  `)
}

class Subject {
  constructor(obj){
    this.id = obj.id
    this.name = obj.name
    this.description = obj.description
  }
}

Subject.prototype.subjectHTML = function (){
  return (`
    <div class='subject'>
      <h3>${this.name}</h3>
			<p>${this.description}</p>
		</div>
  `)
}
