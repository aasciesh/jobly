require 'test_helper'
require 'deadline_after_creation_date_validator'

class VacancyTest < ActiveSupport::TestCase
  
  test "Vacancy should not save if Title not present" do
  	vacancy = vacancies(:one)
  	vacancy.deadline = DateTime.now + 1.day
  	vacancy.title = ""
    assert vacancy.invalid?
    assert !vacancy.save
  end
  test "Title characters should not exceed total length of 150" do
  	vacancy = vacancies(:one)
  	vacancy.deadline = DateTime.now + 1.day
  	vacancy.title = "This is test. This is test. This is test. This is test. This is test.
  						This is test.This is test.This is test.This is test.This is test.
  						This is test.This is test.This is test.This is test.This is test."
    assert vacancy.invalid?
    assert !vacancy.save
  end

  test "Deadline cannot be before or the same day as vacancy post date" do
  	vacancy = vacancies(:one)
  	vacancy.deadline = DateTime.now - 1.day
  	assert vacancy.invalid?
  	assert !vacancy.save
  end

  test "Deadline valid if it is later than creation date" do
  	vacancy = vacancies(:one)
  	vacancy.deadline = DateTime.now + 5.days
  	assert vacancy.valid?
  	assert vacancy.save
  end

  test "Job address must be present" do 
  	vacancy = vacancies(:one)
  	vacancy.deadline = DateTime.now + 1.day
  	vacancy.job_address = ""
  	assert vacancy.invalid?
  	assert !vacancy.save
  end

  test "description must be more than 10 characters" do
  	vacancy = vacancies(:one)
  	vacancy.deadline = DateTime.now + 1.day
  	vacancy.description = "hello"
  	assert vacancy.invalid?
  	assert !vacancy.save
  end

  test "job types must be either fulltime part time traineeship fixed term" do
  	vacancy = vacancies(:one)
  	vacancy.deadline = DateTime.now + 1.day
  	vacancy.job_type = "fulltime"
  	assert vacancy.valid?
  	assert vacancy.save
  end

  test "salary must not save if not numbers" do
  	vacancy = vacancies(:one)
  	vacancy.deadline = DateTime.now + 1.day
  	vacancy.min_salary = "one thousand"
  	assert vacancy.invalid?
  	assert !vacancy.save
  end

  test "salary is saved if in numbers" do
  	vacancy = vacancies(:one)
  	vacancy.deadline = DateTime.now + 1.day
  	vacancy.max_salary = 2000
  	assert vacancy.valid?
  	assert vacancy.save
  end
end
