require_relative 'connection'

require_relative 'models/user'
require_relative 'models/event'
require_relative 'models/reservation'
require_relative 'models/room'
require_relative 'models/vehicle'
require_relative 'models/furniture'
require_relative 'models/group'
require_relative 'models/bookingObserver'

# TODO bug in eventObserver : Event creation -> empty list of users, Reservation creation/update/delete -> empty list of users

# TODO Give a way to users to access Event or Reservation, not just Booking
# TODO Give a better way to allow users to create Events/Reservations (bob.events.create, instead of bob.bookings.create(type: Event))

# TODO User validation : must have at least one group

# TODO check what happens to the join tables when one of the parent is deleted
# TODO force vehicle manual to end with .pdf
# TODO check that the vehicle manual is a valid path

ActiveRecord::Base.observers << :booking_observer
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
puts "Bookings : "
puts Booking.all
puts
puts "Created bookings of #{User.first} :"
puts User.first.created_bookings
puts
puts "Attributed bookings of #{User.first} :"
puts User.first.attributed_bookings
puts

puts "Events validity"
puts "Should be false :"
puts Event.new.valid?
puts Event.new(created_by: User.first, start_at: Time.now, end_at: Time.now - 1.hours).valid?
puts "Should be true :"
puts Event.new(created_by: User.first, start_at: Time.now, end_at: Time.now + 1.hours).valid?
puts

# Reservation
puts "Reservations :"
puts Reservation.all

# Attendants
puts "Attendants validity"
puts "Bookings attended by #{User.first} :"
puts User.first.attended_bookings
puts
puts "#{Event.first} is attended by :"
puts Event.first.attended_by
puts
puts "#{Reservation.first} is attended by :"
puts Reservation.first.attended_by
puts

# Concerned users
puts "Concerned users"
puts "Users concerned by #{Event.first} :"
puts Event.first.concerned_users
puts
puts "Users concerned by #{Reservation.first} :"
puts Reservation.first.concerned_users
puts

# Observers
puts "Observer :"
puts "new event :"
new_event = User.first.created_bookings.create(
    name: "MEGA-event",
    type: Event,
    created_by: User.first,
    start_at: Time.now,
    end_at: Time.now + 1.years
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

puts "Observer :"
puts "new reservation :"
new_reservation = User.first.created_bookings.create(
    type: Reservation,
    start_at: Time.now,
    end_at: Time.now + 1.years
)
puts
puts "update reservation :"
new_reservation.reserved_items << Furniture.first
new_reservation.save
puts
puts "delete reservation :"
new_reservation.destroy
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

puts Reservation.first.concerned_users
puts

# Availability
puts "Availability"
puts "Items"
puts "available between"
puts "should be true"
puts Room.first.available_between?(Time.now + 10.years, Time.now + 20.years)
puts Room.first.available_between?(Time.now - 10.years, Time.now - 10.years + 1.hours)
puts "should be false"
puts "(but only shortly after seeding)"
puts Room.first.available_between?(Time.now, Time.now + 1.years)
puts Room.first.available_between?(Time.now - 1.years, Time.now)

puts "available for"
puts "should be false"
puts Room.first.available_for?(Event.first)
puts "should be true"
puts Room.first.available_for?(Event.last)
puts

# Reservation validation
puts "Reservation validation"
reservation = User.first.created_bookings.new(
    type: Reservation,
    created_for: User.first,
    start_at: Time.now - 10.years,
    end_at: Time.now + 10.years
)
puts "Should be true"
puts reservation.valid?
reservation.errors.each do |attribute, message|
  puts "#{attribute} : #{message}"
end
reservation.reserved_items << Room.all
puts "Should be false"
puts reservation.valid?
reservation.errors.each do |attribute, message|
  puts "#{attribute} : #{message}"
end
puts

