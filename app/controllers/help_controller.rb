class HelpController < ApplicationController

  def show
    help_pages = Dir.glob(Rails.root+"app/views/help/**/*.md")
    @requested_page = Rails.root+"app/views/help/"+(params[:help_page]+".md")
    unless help_pages.include? @requested_page.to_s
      raise ActiveRecord::RecordNotFound
    else
      respond_to do |format|
        format.html
        format.markdown do
          render :text => File.read(@requested_page)
        end
      end
    end
  end

end
