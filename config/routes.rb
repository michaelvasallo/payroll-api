Rails.application.routes.draw do
  namespace :api do
    resources :uploads, only: :create
    resource :payroll_report, only: :show, controller: :payroll_report
  end
end
