require_relative 'connection'

require_relative 'models/user'
require_relative 'models/event'
require_relative 'models/room'
require_relative 'models/vehicle'
require_relative 'models/furniture'
require_relative 'models/group'
require_relative 'models/eventObserver'

# TODO Give a way to users to access Event or Reservation, not just Booking
# TODO Give a better way to allow users to create Events/Reservations (bob.events.create, instead of bob.bookings.create(type: Event))

# TODO Booking add validation check - start < end

# TODO User validation : must have at least one group
# TODO delete join table content when the event or the user is deleted
# TODO check what happens to the join table between furnitures and and responsibles
# TODO check what happens to the join table between groups and members
# TODO check what happens to the join table between groups and can_reserve
# TODO force vehicle manual to end with .pdf
# TODO check that the vehicle manual is a valid path

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

# bookings
puts "Created bookings of #{User.first} :"
puts User.first.created_bookings
puts
puts "Attributed bookings of #{User.first} :"
puts User.first.attributed_bookings
puts

puts "Events validity"
puts "Should be false :"
puts Event.new.valid?
puts "Should be true :"
puts Event.new(created_by: User.first, start_at: Time.now, end_at: Time.now + 1.hours).valid?
puts

# Attendants
puts "Attendants validity"
puts "Bookings attended by #{User.first} :"
puts User.first.attended_bookings
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
new_event = User.first.created_bookings.create(
    name: "MEGA-event",
    type: Event,
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

# Reservable Items
puts "All reservable items : "
puts ReservableItem.all
puts
puts "Rooms : "
puts Room.all
puts
puts "Vehicles : "
puts Vehicle.all
puts
puts "Furniture : "
puts Furniture.all
puts
puts "Reservable items validation : "
puts "Should be false :"
puts Room.new.valid?
puts Room.new(name: "").valid?
puts Vehicle.new.valid?
puts Vehicle.new(name: "toyota", manual: ".pdf").valid?
puts Vehicle.new(name: "", manual: "man.pdf").valid?
puts Furniture.new.valid?
puts Furniture.new(name: "").valid?
puts
puts "Should be true :"
puts Room.new(name: "B").valid?
puts Vehicle.new(name: "X", manual: "x.pdf").valid?
puts Furniture.new(name: "t").valid?
puts
puts "User responsibles for #{Furniture.first} : "
puts Furniture.first.responsibles
puts
puts "Furnitures #{User.first} is responsible for : "
puts User.first.responsible_for_furnitures
puts

# Groups
puts "Groups :"
puts Group.all
puts
puts "Members of #{Group.first} :"
puts Group.first.members
puts
puts "Groups of #{User.find_by(firstname: "pascal")} :"
puts User.find_by(firstname: "pascal").member_of
puts
puts "Members of #{Group.find_by(name: "admins")} can reserve :"
puts Group.find_by(name: "admins").can_reserve
puts
puts "#{Room.first} can be reserved by :"
puts "Groups :"
puts Room.first.can_be_reserved_by_groups
puts "Users :"
puts Room.first.can_be_reserved_by_users
puts
