require 'test_helper'

class VacanciesControllerTest < ActionController::TestCase
 	
 	test "should get new form for vacancy" do
		get :new
		assert_response :success
		# user=params[:vacancy_profile].user
		# assert user=User.new
	end

	test "should get vacancy index" do 
		get :index
		assert_response :success
	end

	test "should create vacancy" do
		assert_difference "Vacancy.count", +1, "This is failing" do
			post :create, vacancy: {title: "MyString",
								  description: "10 characters for description",
								  deadline: '2013-05-28 21:12:35',
								  job_type: "full-time",
								  job_address: "MyString",
								  street: "MyString",
								  city: "MyString",
								  country: "MyString",
								  zip: 12345,
								  latitude: '1.5',
								  longitude: '1.5',
								  min_salary: 2000,
								  max_salary: 20000,
								  job_duration: "3to12" }
			end
		assert_redirected_to vacancies_path, "FAILED"
		assert_equal "Vacancy created successfully !", flash.now[:success], "FAILED"  
	end

	test "should show fail message and render new with invalid params," do
		assert_no_difference("Vacancy.count") do
			post :create, vacancy: {title: "MyString",
								  description: "10 characters for description",
								  deadline: '2013-05-28 21:12:35',
								  job_type: "invalid: should be only full-time",
								  job_address: "MyString",
								  street: "MyString",
								  city: "MyString",
								  country: "MyString",
								  zip: 12345,
								  latitude: '1.5',
								  longitude: '1.5',
								  min_salary: 2000,
								  max_salary: 20000,
								  job_duration: "3to12" }
			end
		assert_template :new, "FAILED"
		assert_equal "Something went wrong!", flash.now[:error], "FAILED"  
	end

	test "should show vacancy" do
		get :show, id: vacancies(:one).id
		assert_response :success
	end

	test "should get edit form" do
		get :edit, id: vacancies(:one).id
		assert_response :success
	end

	test "should update vacancy information" do
		vacancy1 = Vacancy.new		
		vacancy1.title="Title",
		vacancy1.description="10 characters for description",
		vacancy1.deadline='2013-05-28 21:12:35',
		vacancy1.job_type="full-time",
		vacancy1.job_address="MyString",
		vacancy1.street="MyString",
		vacancy1.city="MyString",
		vacancy1.country="MyString",
		vacancy1.zip=12345,
		vacancy1.latitude='1.5',
		vacancy1.longitude='1.5',
		vacancy1.min_salary=2000,
		vacancy1.max_salary=20000,
		vacancy1.job_duration="3to12"
		vacancy1.save
		put :update, id: vacancy1.id,
			vacancy: {title: "Updated title",
					description: "10 characters for description",
					deadline: '2013-05-28 21:12:35',
					job_type: "full-time",
					job_address: "MyString",
					street: "MyString",
					city: "MyString",
					country: "MyString",
					zip: 12345,
					latitude: '1.5',
					longitude: '1.5',
					min_salary: 2000,
					max_salary: 20000,
					job_duration: "3to12" }
		assert_redirected_to vacancy_path(vacancy1)
		assert_equal "Information updated successfully!", flash.now[:success]
	end
end
