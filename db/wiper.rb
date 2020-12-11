class Wiper
  # Make sure MODELS with foreign keys
  # come before the tables they reference
  MODELS = %w[StoreTransactionLineItem
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
              PhoneNumber].freeze

  def self.execute
    log_begin
    new.execute
    log_success
  end

  def execute
    MODELS.map(&:constantize).each do |table|
      log_wipe_for table
      wipe table
      reset_pk_sequence_for table.table_name
    end
  end

  private

  def wipe(table)
    table.destroy_all
  end

  def reset_pk_sequence_for(table_name)
    ActiveRecord::Base.connection.reset_pk_sequence! table_name
  end

  def log_wipe_for(table)
    puts "-- Wiping #{table}"
  end

  class << self
    def log_begin
      puts '== Wiping Tables'
    end

    def log_success
      puts '== Database: wiped!'
      puts ''
    end
  end
end
