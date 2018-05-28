Dir[File.join(__dir__, '../src', '*.rb')].each { |file| load file }
puts 'app loaded'
