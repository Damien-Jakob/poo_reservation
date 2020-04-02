require_relative '../models/user'
require_relative '../models/event'

# users
bob = User.create(firstname: "Bob", lastname: "Lennon")
pascal = User.create(firstname: "Pascal", lastname: "Hurni")
xavier = User.create(firstname: "Xavier", lastname: "Carrel")