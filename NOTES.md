# PROJECT HANDCANNON 

An app to connect those interested in learning more about firearms to those with the capability to educate. No politics, no fear, just community and education.

## DEVLOG - 06/13/2019
### Database Models

We have users (broken into teachers/students), locations, and meetings.

Teacher and student are basically the same class, so rather than repeat them, I'm going to make a self-referential relationship through a meeting. We can do this in the database, I'll have to play around in the console to see what relationships I can expose to the front-end. Serializers will be necessary

What information do I want to expose?

Thus:
A user(teacher) has many users(students) through a meeting
A user(student) has many users(teachers) through their meetings
That's basically a many to many relationship.

A meeting belongs to a user(teacher)
A meeting has many users(students)

USER
---------
name: string
username: string
email: string
student: boolean
teacher: boolean
password_digest (bcrypt)
belongs_to :location
self-referential many-to-many through meetings. Ready?
has_many :students, through: :student_meetings, source: :student
has_many :student_meetings, foreign_key: :teacher_id, class_name: "Meeting"
has_many :teachers, through: :teacher_meetings, source: :teacher
has_many :teacher_meetings, foreign_key: :student_id, class_name: "Meeting"

MEETING
————————
title: string
address: string
start_date: datetime
end_date: datetime
subject: string (purpose of the meeting)
description:string (additional information)
belongs_to location
join table for many-to-many self-join of users
belongs_to :teacher, foreign_key: "teacher_id", class_name: "User"
belongs_to :student, foreign_kay: "student_id", class_name: "User"
has_many :students
belongs_to :teacher

LOCATION
————————
city: string
state: string
zipcode: integer
has_many :users
has_many :meetings

=========================

Frontend Ideas

We’ll be using React/Redux for the frontend.

WELCOME PAGE
—————————

Also the landing page. Here you’ll find an overview of upcoming meetings, a description of the organization, a signup/login modal, maybe some other things as we need them.

ABOUT PAGE
—————————

Further descriptions and contact information for myself. A small biography about our mission, ideals, and progress.

MEETINGS PAGE
—————————

meetings#index (see all meetings)
Shows an index of all available meetings. Requests for meetings in a particular 
location will be ordered by location and nested accordingly.
meetings#show (see specific meeting)
Contains information about a specific meeting. Title, time, date, description, 
teacher, attendees, etc.

LOCATIONS PAGE
—————————
Lists teachers, students, and meetings by a particular location.
All of those resources would need to be nested under locations, we’ll need routes for it.

handcannon.com/locations/phoenixAZ/meetings

Maybe a map on this page, to view meetings by location. —Stretch goal

USERS PAGE
—————————
Needs a full resource
Looks the same for teachers/students
Profile page, basically.
Displays name, upcoming meetings, biography, other model information

DESIGN CONCEPTS


https://www.blazingsword.org - Has pretty much the same idea, but LGBTQ specific
https://dribbble.com/shots/6625574-Project-Management-Tool - Clean Google looking interface
https://www.grubhub.com/restaurant/sabai-modern-thai-4121-e-thomas-rd-phoenix/245999 - I really like GrubHub’s style, and it’s built in React.
https://webflow.com/blog/20-web-design-trends-for-2019 - Good current design trends.
