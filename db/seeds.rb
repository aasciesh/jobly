# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


		50.times do |numb|

		    @user_profile = UserProfile.new(firstname: 'tester'+numb.to_s,
		                                      lastname: 'testinen',
		                                      user_name: 'test_tester'+numb.to_s,
		                                      birth_date: '1990-03-28',
		                                      gender: 'Male',
		                                      full_address: 'testernenkatu, helsinki, finland',
		                                      street: 'testernenkatu',
		                                      city: 'helsinki',
		                                      country: 'finland',
		                                      zip: 00001,
		                                      self_info: 'I am a tester. I like to test while want to test. so let me test',
		                                      hobbies: 'I like testing, test and testify the test' )

		    @user = User.new(email: numb.to_s+"job_seeker@email.com",
		    				password: "mypassword",
		    				password_confirmation: "mypassword")		    
		    
		    @user.save
		    @user_profile.user = @user

		   @language_skill = LanguageSkill.new(level: 5 ,
	                                        name: 'Nepali'+numb.to_s,
	                                        skill_type: 'spoken')
		    @language_skill.save  
		    @user_profile.language_skills<<@language_skill


			@experience = Experience.new(business_field: 'IT 5 character',
			                				full_address: "merokatu timrosahar hamro desh",
			    							start_date: '2008-05-09', 
			                				employer: 'mero oy',
			 								position: 'Personal Assistant',
			 								responsibilities: 'Outbound customer calling to company standards 
			 								and targets with related supporting administrative tasks')
		    @experience.save
		    @user_profile.experiences<<@experience

		   @qualification = Qualification.new(degree_type: 'Bachelor In Business Information Technology'+numb.to_s, 
        									institute_name: 'Haaga-Helia UAS'+numb.to_s,
        									address: 'Pasila, Helsinki'+numb.to_s,        								
        									start: Time.now+numb.years
        								)
		    @qualification.save	 	   
		    @user_profile.qualifications<<@qualification	

		   @reference = Reference.new(referee_name: 'Jack'+numb.to_s,
                      email: numb.to_s+'jack@email.com')
		    @reference.save	 	   
		    @user_profile.references<<@reference    
		  
		    @user_profile.save
	    end  



		50.times do |numb|
		     @company_profile = CompanyProfile.new(name: "company profile Oy"+numb.to_s, 
		                      description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed posuere interdum sem. Quisque ligula eros ullamcorper quis, 
		                      lacinia quis facilisis sed sapien. Mauris varius diam vitae arcu. Sed arcu lectus auctor vitae, consectetuer et venenatis eget velit.
		                       Sed augue orci, lacinia eu tincidunt et eleifend nec lacus. Donec ultricies nisl ut felis, suspendisse potenti. Lorem ipsum ligula ut hendrerit mollis,
		                        ipsum erat vehicula risus, eu suscipit sem libero nec erat. Aliquam erat volutpat. Sed congue augue vitae neque. 
		                      Nulla consectetuer porttitor pede. Fusce purus morbi tortor magna condimentum vel, placerat id blandit sit amet tortor.Mauris sed libero.
		                      Suspendisse facilisis nulla in lacinia laoreet, lorem velit accumsan velit vel mattis libero nisl et sem. Proin interdum maecenas massa turpis sagittis in, 
		                      interdum non lobortis vitae massa. Quisque purus lectus, posuere eget imperdiet nec sodales id arcu. Vestibulum elit pede dictum eu, viverra non tincidunt eu ligula.",
							 street: "companinkatu 12"+numb.to_s,
		                      city: "helsinki",
		                      country: "finland",
		                      zip: "10201",
		                      website: "website.com",
		                      contact: "contact person" )
		    @user = User.new(email: numb.to_s+"company@email.com",	password: "mypassword",
		    				password_confirmation: "mypassword")
		   
		    

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

			addresses= ['pekankatu 5, helsinki','kannelmaki, helsinki','kovukyla, helsinki','riihimaki','porvoo, finland','sipoo, finland','jarvenpaa','pasila, helsinki','kamppi','tampere, finland']
			
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
		
		rand = Random.rand(0..4)
		@vacancy=Vacancy.new(	
						title: title_descriptions[rand][0]+numb.to_s,
						description: title_descriptions[rand][1],
						job_type: 'full-time',
						job_duration: 'more than 12 months',
						job_address: addresses[numb.divmod(10).last],
						min_salary: 55000+rand.years,
						max_salary: 95000+rand.years,
						deadline: Time.now+rand.years) 	

		    @vacancy.company_profile=@company_profile
		    @vacancy.save
		    @application=Application.new(user_id: numb, vacancy_id: @vacancy.id)
		    @application.save
	  		@company_profile.user=@user
	  		@user.save
		   	@company_profile.save		

	end


