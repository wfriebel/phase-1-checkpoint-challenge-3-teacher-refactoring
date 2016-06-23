require_relative 'person'

class Educator < Person
	attr_reader  :salary, :target_raise

	def initialize(options={})
    	super
	    @target_raise = 800
	    @phase = 3
	end

	def set_phase(num)
	    super
	    "Cool, I've always wanted to teach phase #{num}!"
  	end

  	def teach_stuff
  		response = ""
  		response += "Listen, class, this is how everything works. "
  		response += "*drops crazy knowledge bomb* "
  		response += "... You're welcome."
  		response
  	end

  	def salary=(new_salary)
  		puts "This better be good!"
  		@salary = new_salary
  	end

  	def receive_raise(raise)
  		@salary += raise
  	end

  	def set_performance_rating(rating)
  		response = ""
  		if rating > 80
  			response = "Yay, I'm a great employee!"
  			receive_raise(@target_raise)
  		else
  			response = "Oh, well -- thanks to this actionable, specific, and kind feedback, I'll do better next time."
  		end
  		response
 	end
end