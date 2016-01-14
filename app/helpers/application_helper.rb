module ApplicationHelper
  def aside_grouped_actions
    [
      {
          label: 'Listagem de Registros',
          actions: [
            {name: 'Lotes de NF-e', icon: 'icon ion-person', link: batches_path},
            {name: 'NF-e avulsas', icon: 'icon ion-person', link: invoices_path}
          ]
      }
    ]
  end
end
