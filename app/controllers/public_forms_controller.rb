class PublicFormsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def show
    @link = IntakeLink.find_by(token: params[:token])
    return render plain: "Link inválido" unless @link

    return render plain: "Link já utilizado" if @link.used_at.present?
  end

  def submit
    link = IntakeLink.find_by(token: params[:token])
    return render plain: "Link inválido" unless link

    patient = Patient.create!(
      age: params[:age],
      name: params[:name],
      cpf: params[:cpf],
      phone: params[:phone],
      answers: params[:answers],
      submitted_at: Time.current
    )

    link.update!(patient: patient, used_at: Time.current)

    render plain: "Formulário enviado com sucesso!"
  end
end