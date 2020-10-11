class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :answer_id, null: false
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.text :question, null: false
      t.timestamps
    end
  end
end
