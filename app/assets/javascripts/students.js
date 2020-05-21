$(function () {
  console.log('students.js is loaded')
  listenForClick()
  listenForAssignmentDetailsClick()   //student's assignment details
  listenForSortClick()
});

function listenForSortClick(){
  $('button#user-subjects-sorted').on('click', function(event){
    event.preventDefault()
    getSubjAscOrder()
  })
}

function listenForClick() {
  $('button#user-subjects').on('click', function(event) {
    event.preventDefault()
    getUserSubjects()
  })
}

function listenForAssignmentDetailsClick() {
  $('.assignment-data').on('click', function(event) {
    event.preventDefault()
    // console.log("in listenForAssignmentDetailsClick")
    getAssignment()
  })
}

function getNewAssignmentForm() {
  // console.log("in GetNewAssignmentForm")
  s = event.target.getAttribute('id')
  let newAssignForm = Assignment.newAssignmentForm()
  $(`#${s}`).replaceWith(newAssignForm)

  $('#new_assignment_form').on("submit", function(e){
    e.preventDefault()
    const data = $(this).serialize()
    console.log(data)
    var url = '/subjects/' + s + '/assignments'

    $.ajax({
        url: url,
        type:"POST",
        data: data,
        success: function(data) {
          uid = window.location.href.split('/')[4]
          uid = uid.replace(/\D/g,'');
          newUrl = "/users/" + uid + "/subjects/" + s
          window.location.assign(newUrl);
        }
      })
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
};
function getSubjAscOrder() {
  uid = window.location.href.split('/')[4]
  uid = uid.replace(/\D/g,'');
  $.ajax({
    url: 'http://localhost:3000/users/'+ uid + '/subjects',
    method: 'get',
    dataType: 'json',
    success: function(data) {
      console.log("sort the data, add assignments")
      data.sort((a,b) => (a.name > b.name) ? 1 : -1)
      // console.log("the data is: ", data)
      data.map(subject => {
        const newSubject = new Subject(subject)
        const newSubjectWithAssignments = newSubject.withAssignmentsHTML()
        $('#ajax-sorted-subjects').append(newSubjectWithAssignments)
      })
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

function getStudentDetails(){
  sid = event.target.getAttribute('studentId')
  url = 'http://localhost:3000/students/'+ sid
  $.ajax({
    url: url,
    method: 'get',
    dataType: 'json',
    success: function(data){
      console.log("the data is", data)
      const newStudent = new Student(data)
      const newStudentHtml = newStudent.studentHTML()
      $(`.${sid}`).html(newStudentHtml)
    }
  })
}

class Student {
  constructor(obj){
    this.id = obj.id
    this.name = obj.name
    this.email = obj.email
    this.citizenship_grade = obj.citizenship_grade
  }
}

Student.prototype.studentHTML = function (){
  return (`
    <div class='student'>
      <p>
      <Strong>${this.name}</Strong><br>
			${this.email}<br>
			${this.citizenship_grade === "" ?  this.citizenship_grade : ""}
      </p>
		</div>
  `)
}

class Assignment{
  constructor(obj){
    this.id = obj.id
    this.subject_id = obj.subject_id
    this.assignment_type = obj.assignment_type
    this.name = obj.name
    this.notes = obj.notes
    this.created_at = obj.created_at
    this.updated_at = obj.updated_at
  }
  static newAssignmentForm(){
    return (`
      <br>
		<strong>New assignment form</strong>
			<form id="new_assignment_form">
				<input type='radio' id='HW' name='assignment_type' value='HW' checked >HW</input><br>
				<input type='radio' id='Project' name='assignment_type' value='Project' >Project</input><br>
				<input type='radio' id='Test' name='assignment_type' value='Test' >Test</input><br>
				<input type='radio' id='Quiz' name='assignment_type' value='Quiz' ></input>Quiz<br><br>
        Assignment Details: <br><input type='text' id='name' name='name' ></input><br>
        Assignment Notes: <br><input type='text' id='notes' name="notes" ></input><br><br>
				<input type='submit' id='post-assignment' value='Create Assignment' ><br><br>
			</form>
      		`)
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
    this.assignments = obj.assignments
  }
}

Subject.prototype.subjectHTML = function (){
  console.log("in subject prototype")
  let subjectId = this.id
  return (`
      <h3>${this.name}</h3>
			<p>${this.description}</p>
    <div id='${subjectId}' >
      <input type="button" id="${subjectId}" class='add-assignment' onclick="getNewAssignmentForm()" value="Add Assignment"  />
    </div>
  `)
}

Subject.prototype.withAssignmentsHTML = function (){
  console.log("in subject with assignment prototype")
  let subjectId = this.id
  let collection = this.assignments.map(a => {
    return (`
      <p>
      ${a.assignment_type}:  ${a.name}, ${a.notes}</p>
      `)
  }).join('')

  return (`
    <div class='subject'>
      <h3>${this.name}</h3>
			<p>${this.description}</p>
			<p>${collection}</p>
    </div>
  `)
}
