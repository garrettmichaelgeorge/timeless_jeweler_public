class SidebarComponent < ApplicationComponent
  # attr_accessor :nav_items, :reports

  def initialize
    @nav_items = {}
    @reports = {}
  end

  def nav_items
    @nav_items = {
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
        link_path: products_path
      },
      transactions: {
        name: 'Transactions',
        icon: 'fe fe-activity',
        link_path: store_transactions_path
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
end
