class AnswersController < ApplicationController

  def index
    #インデックスは必要ない気がする。
    # 回答一覧っていらなくない？
    redirect_to(questions_path)
  end

  def create
    #
    # @answer = Answer.new(answer_id: アンサーID, user_id: 現在のユーザーID, question_id: クエスチョンID, answer: params[:answer])
    redirect_to(questions_path)
  end



end
