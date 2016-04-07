module MeasureMath
    
  TESTVALUES = [10, 50, 17, 12, 15, 5, 4, 9, 11, 40, 37, 25, 22, 59, 60, 3, 14, 11, 16, 12]    
  
  class Measure
    attr_accessor :values
  
    def initialize(array)
        @values = array
    end
    
    def mean
      puts "change me to give the arithmetic mean of the dataset"
    end
    
    def mode
      puts "change me to caluculate the mode of the dataset"
    end
    
    def median
      puts "change me to calculate the median of the dataset"
    end
    
    def normalize
        puts "change me to normalize TESTVALUES to standard normal range"
    end
    
    def expected_value
        puts "change me to give the probability weighted mean of the dataset"
    end
    
    def standard_deviation(value)
      puts "change me to caluculate the standard deviation of value compared to test values"
    end
    
    private
    
    #this is where you put methods that help you make the public methods. Private methods cannot be called outside of the class they are defined in.
    
  end
  
end