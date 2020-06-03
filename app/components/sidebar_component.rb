class SidebarComponent < ApplicationComponent
  # attr_accessor :nav_items, :reports

  def initialize(browser)
    @browser = browser
    @nav_items = {}
    @reports = {}
    @sidebar_class = ""
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

  def sidebar_class
    puts "@browser is #{@browser}"
    if @browser.device.tablet?
      puts "\tI'm mobile!"
      @sidebar_class = "navbar navbar-vertical navbar-vertical-sm fixed-left navbar-expand-md navbar-dark navbar-vibrant"
    else
      puts "\tI'm not mobile!"
      @sidebar_class = "navbar navbar-vertical fixed-left navbar-expand-md navbar-light"
    end
  end
end
