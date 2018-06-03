# Dir[File.join(__dir__, '../lib', '**/*.rb')].each do |file|
#   puts "loaded #{file}"
#   load file
# end

require 'require_all'
require 'highline'

require_all 'lib/**/*.rb'
