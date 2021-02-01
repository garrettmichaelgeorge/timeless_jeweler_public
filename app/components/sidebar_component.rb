class SidebarComponent < ApplicationComponent
  def nav_items
    {
      dashboard: {
        icon: 'home',
        path: dashboard_path
      },
      customers: {
        icon: 'users',
        path: customers_path
      },
      inventory: {
        icon: 'briefcase',
        path: items_path
      },
      sales: {
        icon: 'activity',
        path: sales_path
      },
      services: {
        icon: 'calendar',
        path: dashboard_path
      }
    }
  end

  def reports
    ['Total Inventory',
     'Inventory Bought',
     'Inventory Sold']
  end
end
