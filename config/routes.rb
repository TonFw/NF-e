Rails.application.routes.draw do
  # List all Invoices
  resources :invoices

  # Specific Batches Scope
  resources :batches do
    resources :invoices
    get 'process' => 'batches#process_nfes', as: :process
  end

  # RootRoute to batch upload
  root to: 'batches#index'
end