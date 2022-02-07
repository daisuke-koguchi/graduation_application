Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'users#top'
  get 'users/top' => 'users#top'
  get 'users/mypage' => 'users#mypage'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do 
    post 'users/guest_sign_in' => 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in' => 'users/sessions#admin_guest_sign_in'
    post 'users/sign_up/confirm' => 'users/registrations#confirm'
    get 'users/sign_up/complete' => 'users/registrations#complete'
  end

  resources :users, only: %i{ index show }
  resources :conversations do 
    resources :messages 
  end
  post 'schedules/create/:id' => 'schedules#create'
  delete 'schedules/destroy/:id' => 'schedules#destroy'
  resources :exercises
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end