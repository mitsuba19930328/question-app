class UsersController < ApplicationController
  before_action :require_login

  def index
  end

  def show
    # ユーザー情報を取得
    @user = User.find_by(id: params[:id])

    # 自分の質問を取得
    @my_questions = Question.all.where(user_id: params[:id])
  end

  private

    def require_login
      unless logged_in?
        flash[:error] = "ログインしてください"
        redirect_to new_user_session_path
      end
    end



end
