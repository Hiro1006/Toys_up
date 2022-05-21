Rails.application.routes.draw do
    get 'genres/show' #TOPページのジャンル検索用
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  #顧客側のTOPページとaboutページのルーティング
  root "public/homes#top"
  get "about" => "public/homes#about"
  get 'genres/show'

  #ゲストログイン用
  post '/guests/guest_sign_in', to: 'public/guests#new_guest'




  # 顧客用
  # URL /end_users/sign_in ...
  devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  #管理者側のルーティング
  namespace :admin do
    root "homes#top"
    resources :end_users,only: [:index, :show, :edit, :update] do
    end
    resources :toys,only: [:index, :show, :edit, :update, :destroy] do
    end
    resources :genres,only: [:index, :create, :edit, :update] do
    end
  end

  #ユーザ側のルーティング
  scope module: :public do
      #お問い合わせ機能
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
    resources :messages, only: [:create]
    resources :rooms, only: [:create,:show]
    get 'end_users/search', to: 'end_users#search'
    patch '/end_users/withdraw' => 'end_users#withdraw', as: 'withdraw'
    get 'end_users/unsubscribe' => 'end_users#unsubscribe', as: 'unsubscribe'
    resources :end_users,only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
      get :favorites
      end
    end
    get 'toys/search', to: 'toys#search'
    resources :toys,only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :genres, only: [:show]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
