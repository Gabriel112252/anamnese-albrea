class IntakeLink < ApplicationRecord
  belongs_to :patient, optional: true

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end