class FixPieceReferenceInMetals < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        add_reference :metals, :piece, foreign_key: true, null: false
      end

      dir.down do
        remove_reference :metals, :piece, foreign_key: true, null: false
      end
    end
  end
end
