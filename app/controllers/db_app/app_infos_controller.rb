module DbApp
  class AppInfosController < ApplicationController
    def index
      @app_app_info_grid = AppAppInfoGrid.new(params[:app_app_info_grid]) do |scope|
        scope.page(params[:page]).per(25)
      end
    end

    def show
      @app_info = AppAppInfo.find(params[:id])
    end

    def edit
        @app_info = AppAppInfo.find(params[:id])
    end

    def destroy
      @app_info = AppAppInfo.find(params[:id]).delete
      redirect_to :back, notice: "Deleted." #dashboard_users_path
    end

    def create
      @app_info = AppAppInfo.create(app_info_params)
      redirect_to :back, notice: "Created." #dashboard_users_path
    end

    def update
      @app_info = AppAppInfo.find(params[:id])
      if @app_info.update(app_info_params)
        redirect_to :back, notice: "Updated." #dashboard_users_path
      end
    end

    def new
      @app_info = AppAppInfo.new
    end
    private
    def app_info_params
      reqParams = params.require(:app_app_info).permit(AppAppInfo.valid_attrs)

      reqParams.each do |reqp|
        if AppAppInfo.fields[reqp[0]] && AppAppInfo.fields[reqp[0]].options[:type] == Array then
          reqParams[reqp[0]] = reqp[1].split(" ")
        end
        if AppAppInfo.fields[reqp[0]] && AppAppInfo.fields[reqp[0]].options[:type] == Hash then
          reqParams[reqp[0]] = JSON.parse(reqp[1])
        end
      end

      return reqParams
    end
  end
end
