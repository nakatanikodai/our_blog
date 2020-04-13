class PostsController < ApplicationController
#3　ターミナルでrails g controller posts
  #でコントローラーの作成
#4　コントローラーにアクションを記載
  def index
#@postにpostsテーブルの全ての情報を代入している
    @posts = Post.includes(:user)
  end

  def new #ルーティング、コントローラーの処理が終わったので、次はビューファイルへ
    @post = Post.new#インスタンスを生成
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content).merge(user_id: current_user.id)

    end

end
