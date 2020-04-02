require_relative 'connection'

require_relative 'models/user'
require_relative 'models/event'

# users
puts "Users :"
puts User.all
puts

# events
puts "Created events of #{User.first} :"
puts User.first.created_events
puts
puts "Attributed events of #{User.first} :"
puts User.first.attributed_events
puts
