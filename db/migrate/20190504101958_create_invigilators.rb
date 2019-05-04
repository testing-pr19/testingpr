class CreateInvigilators < ActiveRecord::Migration[5.2]
  def change
    create_table :invigilators do |t|
      t.string :name
      t.string :invigilator_type
      t.timestamps
    end
  end
end
