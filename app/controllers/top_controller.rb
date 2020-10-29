class TopController < ApplicationController

  def index
    # ログイン中の場合はログインユーザー用トップ画面へ遷移する
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end
end
