class CreateGroupsReservableItems < ActiveRecord::Migration[6.0]
  def change
    create_join_table :groups, :reservable_items
  end
end
