module ApplicationHelper
  def aside_grouped_actions
    [
      {
          label: 'Listagem de Registros',
          actions: [
            {name: 'Lotes de NF-e', icon: 'large-icon ion-ios-box-outline', link: batches_path},
            {name: 'NF-e avulsas', icon: 'large-icon ion-ios-paper-outline', link: invoices_path}
          ]
      }
    ]
  end
end