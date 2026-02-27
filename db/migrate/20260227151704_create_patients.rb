class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.integer :age
      t.string :name
      t.string :cpf
      t.string :phone
      t.jsonb :answers
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
