Rails.application.routes.draw do
  root to: 'users#mypage'
  get 'users/mypage' => 'users#mypage'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
