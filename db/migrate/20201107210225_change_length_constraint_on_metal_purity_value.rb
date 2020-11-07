class ChangeLengthConstraintOnMetalPurityValue < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        change_column :metal_purities, :value, :string, length: 10
      end

      dir.down do
        change_column :metal_purities, :value, :string, length: 4
      end
    end
  end
end
