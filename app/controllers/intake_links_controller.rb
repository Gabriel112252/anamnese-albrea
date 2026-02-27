class IntakeLinksController < ApplicationController
  before_action :require_login

  def index
    @links = IntakeLink.order(created_at: :desc)
  end

  def create
    link = IntakeLink.create!
    redirect_to intake_links_path, notice: public_form_url(link.token)
  end
end