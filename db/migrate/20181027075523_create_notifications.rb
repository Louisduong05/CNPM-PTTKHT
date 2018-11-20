class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :link
      t.string :message
      t.timestamps
      t.belongs_to :user, index: true
    end
  end
end
