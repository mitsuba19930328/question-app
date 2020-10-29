class AnswersController < ApplicationController
  before_action :require_login

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
      # 回答の保存に成功した場合、質問ページへ
      redirect_to(question_path(question_id))
    else
      # 回答の保存に失敗した場合、同様に質問ページへ
      redirect_to(question_path(question_id))
    end
  end

  private

    def require_login
      unless logged_in?
        flash[:alert] = "ログインしてください"
        render new_user_session_path
      end
    end
end
