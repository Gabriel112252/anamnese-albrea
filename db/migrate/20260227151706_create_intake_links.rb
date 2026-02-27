class CreateIntakeLinks < ActiveRecord::Migration[7.2]
  def change
    create_table :intake_links do |t|
      t.string :token
      t.references :patient, null: false, foreign_key: true
      t.datetime :used_at

      t.timestamps
    end
  end
end
