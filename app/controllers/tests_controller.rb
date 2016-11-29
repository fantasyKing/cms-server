class TestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @test = Test.new
  end

  def create
    logger.tagged("create params") { logger.debug req_params}
    picture = req_params[:picture]
    # File.open(Rails.root.join('public', 'uploads', picture.original_filename), 'wb') do |file|
    #   file.write(picture.read)
    # end
    uploader = PictureUploader.new
    uploader.store!(picture)
    # uploader.retrieve_from_store!('my_file.png')
    redirect_to :back
  end

  private
  def req_params
    params.require(:test)
  end
end