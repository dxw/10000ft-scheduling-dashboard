Rails.application.routes.draw do

  root 'schedules#index'
  get 'check', to: 'application#check'
end
