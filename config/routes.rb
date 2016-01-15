Rails.application.routes.draw do
  # List all Invoices
  resources :invoices

  # Specific Batches Scope
  resources :batches do
    resources :invoices
    get 'process' => 'batches#process_nfe', as: :process
  end

  # RootRoute to batch upload
  root to: 'batches#index'
end