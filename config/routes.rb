Rails.application.routes.draw do
  # List all Invoices
  resources :invoices

  # Specific Batch Scope
  resources :batches do
    resources :invoices
  end

  # RootRoute to batch upload
  root to: 'batches#index'
end