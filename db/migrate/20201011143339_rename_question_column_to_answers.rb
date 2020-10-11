class RenameQuestionColumnToAnswers < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :question, :answer
  end
end
