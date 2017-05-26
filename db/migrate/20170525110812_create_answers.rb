class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :name, null: false
      t.boolean :correct, null: false, default: false

      t.references :question

      t.timestamps
    end
  end
end
