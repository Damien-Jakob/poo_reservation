require_relative '../models/user'
require_relative '../models/event'
require_relative '../models/room'
require_relative '../models/vehicle'
require_relative '../models/furniture'
require_relative '../models/group'

# users
bob = User.create(firstname: "Bob", lastname: "Lennon")
pascal = User.create(firstname: "Pascal", lastname: "Hurni")
xavier = User.create(firstname: "Xavier", lastname: "Carrel")

# events
zevent = User.first.created_events.create(
    name: "Z-Event"
)
zevent.attended_by << User.all
zevent.save
User.first.created_events.create(
    name: "bad-event",
    created_for: pascal
)
bob_event = User.first.created_events.create(
    name: "bob-event",
    created_for: bob
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
