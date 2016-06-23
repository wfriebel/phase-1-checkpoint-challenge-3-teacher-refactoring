require_relative 'person'
require_relative 'educator'

class ApprenticeTeacher < Educator

  def attend_training_session
    puts "Whoa. I know ruby-fu"
  end
end
