class CourseOfObservation
  
  
  def initialize(course)
    @course = course
    @observations = Observation.where(course_id: @course.id).all
  end
  
  def course_id
    @course.id
  end
  
end