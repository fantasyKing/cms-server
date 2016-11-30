class TestsController < ApplicationController
  require 'pathname'
  before_action :authenticate_user!
  def initialize
    super
    @uuid = UUID.new
    @domain = 'http://o4a7cbihz.qnssl.com/'
    @bucket = 'fengkou'
  end

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
    filename = picture.original_filename
    pn = Pathname.new "./public/uploads/files/#{filename}"
    # pn.realdirpath
    filepath = pn.realdirpath.to_s
    # logger.tagged("create params") { logger.debug pn.realdirpath.to_s }
    qnpath = upToQn(filename ,filepath)
    logger.tagged("qnpath") { logger.debug qnpath }
    uploader.remove!
    redirect_to :back
  end

  private
  def req_params
    params.require(:test)
  end

  def upToQn(key, filePath)
    begin
      bucket = @bucket
      fileName = "#{@uuid.generate}_#{key}"
      logger.tagged("upToQn fileName") { logger.debug fileName}
      put_policy = Qiniu::Auth::PutPolicy.new(
        bucket,
        fileName,
        3600)
      upToken = Qiniu::Auth.generate_uptoken(put_policy)
      code, result, response_headers = Qiniu::Storage.upload_with_token_2(
        upToken,
        filePath,
        fileName,
        nil,
        bucket: bucket)
      logger.tagged("upToQn code") { logger.debug code}
      logger.tagged("upToQn result") { logger.debug result}
      logger.tagged("upToQn response_headers") { logger.debug response_headers}
      if code.to_s === '200' then
        return "#{@domain}#{fileName}"
      end
      return false
    rescue 
      return false
    end
  end
end