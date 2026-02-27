class AllowNullPatientOnIntakeLinks < ActiveRecord::Migration[7.2]
  def change
    change_column_null :intake_links, :patient_id, true
  end
end
