class CreateForms < ActiveRecord::Migration[7.2]
  def change
    create_table :forms do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :processed_in_job, default: false

      t.timestamps
    end
  end
end
