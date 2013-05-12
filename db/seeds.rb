# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ruby_job_text= 'We are a successful, growing, and well funded startup in the Boston area. We are looking to grow our development team and are in need of a Senior Ruby on Rails Developer. We are looking for a developer who stays current with the latest web trends and enjoys working in a fun startup environment. 
If you are a Senior Ruby on Rails Developer with experience, please read on!
What you need for this position:- Experience building consumer facing web applications with Ruby on Rails Consider yourself a Full Stack Developer Experience with MySQL, MongoDB, CoffeeScript, RVM, Git, and BundlerWhats in it for you: More than competitive compensation
- Awesome work environment
- Great benefits, including fully covered health insurance!
So, if you are a Senior Ruby on Rails Developer with experience, please apply today!
Must be authorized to work in the United States on a full-time basis for any employer.'

java_job_text= "Responsible for large-scale, e-commerce Web applications development, tools development and maintenance. 
Interact with the business to provide robust technical solutions to business problems; you will interact with junior engineers to provide guidance as to best practices in web development. This position will support our efforts in front-end web development team.
Assists in the design of new systems or the redesign of existing systems to meet business requirements, changing needs, or newer technology.
"

engineer_text= "Bridge Engineer - Structural - Civil Engineering
*This position is based just outside of Burlington, VT.
*We also have a Highway Engineer position available so apply as well if you have highway experience!
If you are have a strong Bridge Engineering experience and have your PE in the state of VT, please read on!
We have been ranked as one of the best Civil Engineering firms to work for!
We are a global engineering firm committed to providing a challenging, fun and rewarding work environment.
Our staff enjoys opportunities to grow professionally and work on interesting projects. Our dynamic, people-centric organization focuses on our culture of collaboration, personal development, and developing lasting relationships both inside and outside of our firm.
We are hiring for a motivated Bridge (Structural) Engineer to join our team!"

addresses= ['pekankatu 5, helsinki','kannelmäki, helsinki','kovukylä, helsinki','riihimäki','porvoo, finland','sipoo, finland','järvenpää','pasila, helsinki','kamppi','tampere, finland']
title_descriptions=[['Awesome Ruby coder needed',ruby_job_text],['Senior Ruby on Rails Developer',ruby_job_text],
	['Lead / Senior Java Developer', java_job_text],['Java web developer',java_job_text],
	['	Bridge Engineer - Civil Engineering - Structural Engineering', engineer_text]]
Category.delete_all
categories= Category.create(
	[{name: 'IT'},{name: 'Accounting '},{name: 'Administrative'},
		{name: 'Banking'},{name: 'Business'},{name: 'Creative Design'},
		{name: 'Customer Service'},{name: 'Editorial'},{name: 'Engineering'},
		{name: 'Finance'},{name: 'Human Resources'},{name: 'Legal'},
		{name: 'Logistics'}, {name: 'Maintenance'}, {name: 'Manufacturing'}, {name: 'Marketing'},
		{name: 'Project Management'},{name: 'R&D'}, {name: 'Sales'}])


10.times do |num|
	rand = Random.rand(0..4)
	c=CompanyProfile.new(name: "company profile "+num.to_s, 
		                      description:  title_descriptions+ num.to_s,
		                      street: "annankatu 12"+ num.to_s,
		                      city: "helsinki"+ num.to_s,
		                      country: "finland"+ num.to_s,
		                      zip: "10201",
		                      website: "website.com",
		                      contact: "contact person" )
	c.save
end



50.times do |num|
	rand = Random.rand(0..4)
	v=CompanyProfile.last.vacancies.build({  title: title_descriptions[rand][0],
						description: title_descriptions[rand][1],
						job_type: 'full-time',
						job_duration: 'more than 12 months',
						job_address: addresses[num.divmod(10).last],
						min_salary: 55000,
						max_salary: 95000,
						deadline: '2013-08-28 21:12:35'})
	v.save
end