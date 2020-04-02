require 'rails/observers/activerecord/active_record'
# Not sure if necessary
require_relative 'event'

class EventObserver < ActiveRecord::Observer
  observe :event

  def after_create(event)
    notification(event, "#{event} has been created")
  end

  def after_update(event)
    notification(event, "#{event} has been updated")
  end

  # The notification needs to know the event's users, and that information is lost if the notification is sent on after_destroy
  def before_destroy(event)
    notification(event, "#{event} has been deleted")
  end

  def notification(event, message)
    puts "Notification for : "
    puts event.concerned_users
    puts "Message : "
    puts message
  end
end