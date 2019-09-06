Rails.application.routes.draw do
  root 'schedules#index'

  get "/check", to: proc { [200, {}, ["OK"]] }
end
