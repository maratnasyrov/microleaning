class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :name

      t.references :user
      t.references :science

      t.timestamps
    end
  end
end
