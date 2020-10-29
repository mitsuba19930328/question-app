class QuestionsController < ApplicationController
  before_action :require_login

  def index
    @questions = Question.all

    # 解答用変数の用意
    @new_answer = Answer.new

    # ログイン中ユーザーのID取得
    @current_user_id = current_user.id
  end

  def show
    # 質問をparams[:id]から取得
    @question = Question.find_by(id: params[:id])

    # 質問に対する全ての回答を用意
    @exist_answers = Answer.where(question_id: params[:id])

    # 解答用変数の用意
    @new_answer = Answer.new

    # ログイン中ユーザーのID取得
    @current_user_id = current_user.id
  end

  def create
    # Question model作成のための下準備
    # questionの数＋1をquestion_idに採用
    all_questions_size = Question.all.size
    question_id = all_questions_size + 1

    # ログイン中ユーザーのID取得
    current_user_id = current_user.id

    # 必要なデータが揃ったので、questionインスタンス作成
    @question = Question.new(question_id: question_id, user_id: current_user_id, question: params[:question])
    if @question.save
      # 保存に成功したらquestions_pathに遷移
      redirect_to(questions_path)
    else
      # 保存に失敗したら質問ページに再度戻る
    end
  end

  def new
    @user = User.find_by(id: params[:id])
    @question = Question.new
  end

  def destroy
    question = Question.find(params[:id])
    #現行ユーザーとユーザーIDが同じ場合、destroyメソッドを使用し対象の質問を削除する。
    if question.user_id == current_user.id
      question.destroy
      redirect_to questions_path
    else
      render action: :show
    end
  end

  private

    def require_login
      unless logged_in?
        flash[:error] = "ログインしてください"
        redirect_to new_user_session_path
      end
    end

end
