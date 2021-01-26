class SidebarComponent < ApplicationComponent
  def nav_items
    {
      dashboard: {
        name: 'Dashboard',
        icon: 'fe fe-home',
        link_path: dashboard_path
      },
      customers: {
        name: 'Customers',
        icon: 'fe fe-users',
        link_path: customers_path
      },
      inventory: {
        name: 'Inventory',
        icon: 'fe fe-briefcase',
        link_path: items_path
      },
      transactions: {
        name: 'Sales',
        icon: 'fe fe-activity',
        link_path: sales_path
      },
      services: {
        name: 'Service',
        icon: 'fe fe-calendar',
        link_path: dashboard_path
      }
    }
  end

  def reports
    @reports = [
      'Total Inventory',
      'Inventory Bought',
      'Inventory Sold'
    ]
  end

  def sidebar_class
    'navbar navbar-vertical fixed-left navbar-expand-md navbar-light'
  end

  def sign_out_text(translator = I18n)
    translator.t('devise.actions.sign_out')
  end
end
