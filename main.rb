require_relative 'connection'

require_relative 'models/user'
require_relative 'models/event'
require_relative 'models/eventObserver'

# TODO delete join table content when the event or the user is deleted

ActiveRecord::Base.observers << :event_observer
ActiveRecord::Base.instantiate_observers

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

puts "Events validity"
puts "Should be false :"
puts Event.new.valid?
puts "Should be true :"
puts Event.new(created_by: User.first).valid?
puts

# Attendants
puts "Attendants validity"
puts "Events attended by #{User.first} :"
puts User.first.attended_events
puts "#{Event.first} is attended by :"
puts Event.first.attended_by
puts

# Concerned users
puts "Concerned users"
puts "Users concerned by #{Event.first} :"
puts Event.first.concerned_users
puts

# Observers
puts "Observer :"
puts "new event :"
new_event = User.first.created_events.create(
    name: "MEGA-event",
    created_by: User.first
)
puts
puts "update event :"
new_event.attended_by << User.all
new_event.save
puts
puts "delete event :"
# ATTENTION : never use delete
new_event.destroy
puts