Rails.application.routes.draw do
  root "top#index"
  get  "about" => "top#about", as: "about"

  1.upto(18) do |n| # 1〜18までの数値を表示
    get "lesson/step#{n}(/:name)" => "lesson#step#{n}"
  end

  resources :members do
    get "search", on: :collection
    resources :entries, only: [:index]
  end

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password ,only: [:show, :edit, :update]

  resources :articles
  resources :entries
end
