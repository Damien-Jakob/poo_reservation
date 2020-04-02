require_relative '../models/user'
require_relative '../models/event'

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