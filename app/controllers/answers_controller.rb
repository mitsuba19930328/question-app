class AnswersController < ApplicationController

  def index
    #インデックスは必要ない気がする。
    # 回答一覧っていらなくない？
    redirect_to(questions_path)
  end

  def create
    # answer提出時の作成処理
    # answer_idはanswerの数＋1です
    answer_id = Answer.all.size + 1

    # ログイン中ユーザーのID取得
    current_user_id = current_user.id

    # question_idは該当のquestionの数値になります。
    question_id = params[:answer][:question_id]
    # answer_contentは回答分が入っている。
    answer_content = params[:answer][:answer]
    # idはanswer_idと同じです。
    id = Answer.all.size + 1

    answer = Answer.new(id: id, answer_id: answer_id, user_id: current_user_id, question_id: question_id, answer: answer_content)
    if answer.save
      p "save ok"
      redirect_to(question_path(question_id))
    else
      p "save not ok"
      redirect_to(questions_path)
    end
  end



end
