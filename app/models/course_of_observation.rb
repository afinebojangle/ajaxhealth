class CourseOfObservation
  #this is an aggregrate model combining courses with thier various other models
  
  def initialize(course_id)
    @course = Course[course_id]
    @observations = Observation.where(course_id: @course.id).all.sort {|a, b| a.start_date <=> b.start_date}
    @patient = Patient[@course.patient_id]
  end
  
  def observations
    @observations
  end
  
  def course
    @course
  end
  
  def patient
    @patient
  end

  
  
end