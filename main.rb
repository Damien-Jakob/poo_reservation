require_relative 'connection'

require_relative 'models/user'
require_relative 'models/event'

# users
puts "Users :"
puts User.all
puts

puts "Users validity"
puts "Should be false :"
puts User.new.valid?
puts User.new(firstname: "bob").valid?
puts User.new(lastname: "lennon").valid?
puts User.new(lastname: "lennon", firstname: "").valid?
puts User.new(lastname: "", firstname: "bob").valid?
puts "Should be true :"
puts User.new(firstname: "bob", lastname: "lennon").valid?
puts User.new(firstname: "a", lastname: "b").valid?
puts

# events
puts "Created events of #{User.first} :"
puts User.first.created_events
puts
puts "Attributed events of #{User.first} :"
puts User.first.attributed_events
puts
