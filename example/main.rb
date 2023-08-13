# generate ruby sample code
module Sample
  class SampleClass
    def initialize(name)
      @name = name
    end

    def hello
      puts "Hello #{@name}"
    end

    def self.hello
      puts 'Hello World'
    end
  end
end

s = Sample::SampleClass.new('dev')

s.hello
Sample::SampleClass.hello
