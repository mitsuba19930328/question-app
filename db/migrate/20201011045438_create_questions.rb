class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :question_id, null: false
      t.integer :user_id, null: false
      t.text :question, null: false
      t.boolean :solved_flag, default: false, null: false
      t.timestamps
    end
  end
end
