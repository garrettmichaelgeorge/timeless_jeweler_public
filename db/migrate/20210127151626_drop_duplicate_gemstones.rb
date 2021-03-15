class DropDuplicateGemstones < ActiveRecord::Migration[6.1]
  # As the data model has evolved, the naming convention for the Gemstone table
  # has changed back and forth between two main options.

  # The present decision is to call the table :gemstones to highlight its being
  # the chief representation in the DB of a gemstone, and the hub of the many
  # associations branching out from it.

  # An accidental consequence of the instability in naming conventions is the
  # presence of duplicate tables, one called :gemstones and the other called
  # :gemstone_profiles. One must therefore be dropped.

  # Most related tables currently reference :gemstone_profiles; only one table,
  # :mountings, references :gemstones. The solution is below.

  # [TODO] In a subsequent migration: rename all FK columns and indices
  # referencing the old :gemstone_profiles table

  def change
    # (Only perform the transaction if both duplicate tables exist)
    return unless duplicate_tables_exist?

    # remove the :gemstone reference from :mountings
    remove_reference :mountings, :gemstone

    # drop :gemstones
    drop_table :gemstones

    # rename :gemstone_profiles => :gemstones
    rename_table :gemstone_profiles, :gemstones

    # add the correct FK column to :mountings, referencing
    # the (newly renamed) :gemstones table
    add_reference :mountings, :gemstone, index: true,
                                         foreign_key: true,
                                         null: false
  end

  private

  def duplicate_tables_exist?
    table_exists?(:gemstone_profiles) && table_exists?(:gemstones)
  end
end
