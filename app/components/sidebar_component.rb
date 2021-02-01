class SidebarComponent < ApplicationComponent
  def nav_items
    {
      dashboard: {
        icon: 'home',
        link_path: dashboard_path
      },
      customers: {
        icon: 'users',
        link_path: customers_path
      },
      inventory: {
        icon: 'briefcase',
        link_path: items_path
      },
      sales: {
        icon: 'activity',
        link_path: sales_path
      },
      services: {
        icon: 'calendar',
        link_path: dashboard_path
      }
    }
  end

  def reports
    ['Total Inventory',
     'Inventory Bought',
     'Inventory Sold']
  end

  def sidebar_class
    'navbar navbar-vertical fixed-left navbar-expand-md navbar-light'
  end
end
