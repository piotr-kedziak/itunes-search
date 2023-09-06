class ItunesController < ApplicationController
  def index; end

  def search
    @results = ItunesSearchService.new.call(params[:query])

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end
end
