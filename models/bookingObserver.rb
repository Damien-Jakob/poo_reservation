require 'rails/observers/activerecord/active_record'
# Not sure if necessary
require_relative 'booking'

class BookingObserver < ActiveRecord::Observer
  observe :booking

  def after_create(booking)
    notification(booking, "#{booking} has been created")
  end

  def after_update(booking)
    notification(booking, "#{booking} has been updated")
  end

  # The notification needs to know the event's users, and that information is lost if the notification is sent on after_destroy
  def before_destroy(booking)
    notification(booking, "#{booking} has been deleted")
  end

  def notification(booking, message)
    puts "Notification for : "
    puts booking.concerned_users
    puts "Message : "
    puts message
  end
end