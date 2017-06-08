class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :answers_number, null: false
      t.boolean :comleted, default: false 

      t.references :user
      t.references :test

      t.timestamps
    end
  end
end
