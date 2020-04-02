require_relative 'connection'

require_relative 'models/user'
require_relative 'models/event'

# users
puts User.all

# events
puts User.first.created_events