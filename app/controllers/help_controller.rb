class HelpController < ApplicationController

  def show
    help_pages = Dir.glob(Rails.root+"app/views/help/**/*.md*")
    requested_file = Rails.root+"app/views/help/"+(params[:help_page])
    unless help_pages.any? { |page| page.starts_with? requested_file.to_s }
      raise ActiveRecord::RecordNotFound
    else
      @page = params[:help_page]
      respond_to do |format|
        format.html
        format.any(:markdown, :text) do
          render :template => "help/#{@page}", :formats => [:md]
        end
      end
    end
  end

end
