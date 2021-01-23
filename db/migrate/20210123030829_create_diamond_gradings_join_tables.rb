class CreateDiamondGradingsJoinTables < ActiveRecord::Migration[6.2]
  def change
    create_table :diamond_cut_gradings, id: false do |t|
      t.references :diamond_cut,      null: false, foreign_key: true
      t.references :gemstone_profile, null: false, foreign_key: true
    end

    create_table :diamond_color_gradings, id: false do |t|
      t.references :diamond_color,    null: false, foreign_key: true
      t.references :gemstone_profile, null: false, foreign_key: true
    end

    create_table :diamond_clarity_gradings, id: false do |t|
      t.references :diamond_clarity,  null: false, foreign_key: true
      t.references :gemstone_profile, null: false, foreign_key: true
    end
  end
end
