class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true, null: false
      t.references :resource, polymorphic: true, null: false
      t.string :state
      t.string :kind

      t.timestamps
    end
  end
end
