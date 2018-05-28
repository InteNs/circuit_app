Dir[File.join(__dir__, '../src', '*.rb')].each { |file| require file }
puts 'app loaded'
