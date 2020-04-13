Rails.application.routes.draw do
  devise_for :users
#1　ルートパスにアクセスした際に呼び出す
#2　コントローラーやアクションを指定する
  root to: 'posts#index'
  resources :posts, except: :index #newアクションに対するルーティングを生成
  #次はコントローラーにアクションを設定する（posts_controller.rbへ行く）
  resources :users, only: :show
end
