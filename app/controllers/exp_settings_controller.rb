class ExpSettingsController < ApplicationController
  before_action :set_exp_setting, only: [:show, :update, :destroy]

  # GET /exp_settings
  def index
    @exp_settings = ExpSetting.all

    render json: @exp_settings
  end

  # GET /exp_settings/1
  def show
    render json: @exp_setting
  end

  # POST /exp_settings
  def create
    @exp_setting = ExpSetting.new(exp_setting_params)

    if @exp_setting.save
      render json: @exp_setting, status: :created, location: @exp_setting
    else
      render json: @exp_setting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exp_settings/1
  def update
    if @exp_setting.update(exp_setting_params)
      render json: @exp_setting
    else
      render json: @exp_setting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exp_settings/1
  def destroy
    @exp_setting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exp_setting
      @exp_setting = ExpSetting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exp_setting_params
      params.require(:exp_setting).permit(:references, :partnerSecret, :partnerId)
    end
end
