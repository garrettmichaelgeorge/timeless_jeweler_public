class AddAcquiredAtToItems < ActiveRecord::Migration[6.1]
  def change
    # Defaults to time of transaction (PostgreSQL 'CURRENT_TIMESTAMP')
    # https://stackoverflow.com/a/40647191/12344822
    # https://www.postgresql.org/docs/current/functions-datetime.html

    add_column :items, :acquired_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    change_column_null :items, :acquired_at, false
  end
end
