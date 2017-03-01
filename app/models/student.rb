require_relative '../../db/config'

class Student < ActiveRecord::Base
	
	 validates :email, uniqueness: true
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	 validates_inclusion_of :birthday,
   :in=>Date.new(1900)..Time.now.years_ago(5).to_date, :message=> "you most be older than 5"
   

  
  # implement your Student model here
  	def name
  		return "#{first_name} #{last_name}"
  	end
  	
  	def age
  		str = (DateTime.now).to_s
  		date = Date.parse str
  		answer = (date - birthday)/365
  		 return answer.to_i
  	end

end
