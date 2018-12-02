TODO

sessions#create - differentiate whether it is through google or not.

Student can view only an assignment and his grade.
TEACHER CAN GRADE A STUDENT
Teacher should be able to print all grades of a particular student
Teacher should be able to print all students' Grades, after considering the weight of each assignment


<%= button_tag "Buy", {:class => "bttn-and-txt", :name => "submit", :value => "buy"} %>
<%= button_tag "Sell", {:class => "bttn-and-txt", :name => "submit", :value => "sell"} %>

= button_tag 'Add', type: 'button', id: 'poll-btn', class: 'btn-bg'
case params[:submit]
when "buy"
  # do buy actions
when "sell"
  # do sell actions
end
