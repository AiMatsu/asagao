Rails.application.routes.draw do
  root "top#index"
  get  "about" => "top#about", as: "about"

  1.upto(18) do |n| # 1〜18までの数値を表示
    get "lesson/step#{n}(/:name)" => "lesson#step#{n}"
  end

  resources :members do
    get "search", on: :collection
  end

end
