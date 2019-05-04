class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.string :from
      t.string :from_am_pm
      t.string :to
      t.string :to_am_pm
      t.timestamps
    end
  end
end
