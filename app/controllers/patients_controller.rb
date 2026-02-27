class PatientsController < ApplicationController
  before_action :require_login

  def index
    @patients = Patient.order(created_at: :desc)
  end

  def show
    @patient = Patient.find(params[:id])
  end
end