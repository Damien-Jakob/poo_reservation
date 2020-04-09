require_relative '../models/user'
require_relative '../models/event'
require_relative '../models/reservation'
require_relative '../models/room'
require_relative '../models/vehicle'
require_relative '../models/furniture'
require_relative '../models/group'

# users
bob = User.create(firstname: "Bob", lastname: "Lennon")
pascal = User.create(firstname: "Pascal", lastname: "Hurni")
xavier = User.create(firstname: "Xavier", lastname: "Carrel")

# events
zevent = User.first.created_bookings.create(
    name: "Z-Event",
    type: Event,
    start_at: Time.now,
    end_at: Time.now + 1.hours
)
zevent.attended_by << User.all
zevent.save
User.first.created_bookings.create(
    name: "bad-event",
    type: Event,
    created_for: pascal,
    start_at: Time.now,
    end_at: Time.now + 1.hours
)
bob_event = User.first.created_bookings.create(
    name: "bob-event",
    type: Event,
    created_for: bob,
    start_at: Time.now,
    end_at: Time.now + 1.hours
)
bob_event.attended_by << bob
bob_event.save

# Reservable items
# rooms
Room.create(name: "SC-C332")
Room.create(name: "404")
# vehicles
Vehicle.create(name: "batmobile", manual: "topSecret.pdf")
Vehicle.create(name: "FBI secret van", manual: "undisclosed.pdf")
# furnitures
Furniture.create(name: "lamp", responsibles: User.all)
bed = Furniture.create(name: "bed")
bed.responsibles << bob
bed.save
pascal.responsible_for_furnitures << bed

# Groups
all = Group.create(name: "all", members: User.all)
all.can_reserve << Room.first
admins = Group.create(name: "admins", can_reserve: ReservableItem.all)
admins.members << pascal
admins.save
pascal.member_of.create(name: "pascals")

# Reservations
User.first.created_bookings.create(
    type: Reservation,
    start_at: Time.now,
    end_at: Time.now + 1.hours,
    attended_by: User.all,
    reserved_items: ReservableItem.all
)
reservation = User.first.created_bookings.create(
    type: Reservation,
    created_for: pascal,
    start_at: Time.now,
    end_at: Time.now + 10.hours
)
reservation.reserved_items << Furniture.first
reservation.reserved_items << Room.all
