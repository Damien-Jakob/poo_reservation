require_relative '../models/user'
require_relative '../models/event'

# users
bob = User.create(firstname: "Bob", lastname: "Lennon")
pascal = User.create(firstname: "Pascal", lastname: "Hurni")
xavier = User.create(firstname: "Xavier", lastname: "Carrel")

# events
User.first.created_events.create(
    name: "Z-Event"
)
User.first.created_events.create(
    name: "bad-event",
    created_for: pascal
)
User.first.created_events.create(
    name: "bob-event",
    created_for: bob
)