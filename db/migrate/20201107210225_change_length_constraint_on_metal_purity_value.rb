class ChangeLengthConstraintOnMetalPurityValue < ActiveRecord::Migration[6.0]
  def change
    change_column :metal_purities, :value, :string, length: 5
  end
end
