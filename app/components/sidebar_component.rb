class SidebarComponent < ApplicationComponent
  def initialize(browser:)
    @browser = browser
  end

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

  def sidebar_class
    if browser.device.tablet?
      'navbar navbar-vertical navbar-vertical-sm fixed-left navbar-expand-md navbar-dark navbar-vibrant'
    else
      'navbar navbar-vertical fixed-left navbar-expand-md navbar-light'
    end
  end

  private

  attr_reader :browser
end
