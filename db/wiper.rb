class Wiper
  # Hard-code sequence of tables to be wiped
  # Note: Make sure TABLES with foreign keys
  # appear before the tables they reference
  TABLES = %w[StoreTransactionLineItem
              StoreTransaction
              StoreTransactionCategory
              Person
              Household
              Party
              Gemstone
              DiamondCut
              DiamondClarity
              DiamondColor
              Piece
              MiscellaneousItem
              Metal
              MetalCategory
              MetalColor
              MetalPurity
              Item
              ItemStyle
              Address
              StateProvince
              EmailAddress
              PhoneNumber
              User].freeze

  def self.execute
    wiper = new
    wiper.wipe_tables
  end

  def wipe_tables
    log_begin
    tables.each do |table|
      log_wipe_for(table)
      wipe_table(table)
    end
    log_success
  end

  private

  def log_begin
    puts '== Wiping Tables'
  end

  def log_success
    puts "== Database: wiped!\n"
  end

  def log_wipe_for(table)
    puts "-- Wiping #{table}"
  end

  def tables
    TABLES.map(&:constantize)
  end

  def wipe_table(table)
    wipe(table)
    reset_pk_sequence_for(table)
  end

  def wipe(table)
    table.destroy_all
  end

  def reset_pk_sequence_for(table)
    ActiveRecord::Base.connection.reset_pk_sequence!(table.table_name)
  end
end
