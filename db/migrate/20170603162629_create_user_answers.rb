class CreateUserAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_answers do |t|
      t.references :answer
      t.references :question
      t.references :game

      t.timestamps
    end
  end
end
