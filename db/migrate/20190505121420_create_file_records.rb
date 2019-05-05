class CreateFileRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :file_records do |t|
      t.string :timing
      t.string :class_name
      t.string :slot
      t.integer :uploaded_file_id
      t.integer :invigilator_id
      t.timestamps
    end
  end
end
