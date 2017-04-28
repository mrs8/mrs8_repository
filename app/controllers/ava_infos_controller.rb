class AvaInfosController < ApplicationController
  before_action :set_ava_info, only: [:show, :edit, :update, :destroy]

  # GET /ava_infos
  # GET /ava_infos.json
  def index
    @ava_infos = AvaInfo.all
  end

  # GET /ava_infos/1
  # GET /ava_infos/1.json
  def show
  end

  # GET /ava_infos/new
  def new
    @ava_info = AvaInfo.new
  end

  # GET /ava_infos/1/edit
  def edit
  end

  # POST /ava_infos
  # POST /ava_infos.json
  def create
    @ava_info = AvaInfo.new(ava_info_params)

    respond_to do |format|
      if @ava_info.save
        format.html { redirect_to @ava_info, notice: 'Ava info was successfully created.' }
        format.json { render :show, status: :created, location: @ava_info }
      else
        format.html { render :new }
        format.json { render json: @ava_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ava_infos/1
  # PATCH/PUT /ava_infos/1.json
  def update
    respond_to do |format|
      if @ava_info.update(ava_info_params)
        format.html { redirect_to @ava_info, notice: 'Ava info was successfully updated.' }
        format.json { render :show, status: :ok, location: @ava_info }
      else
        format.html { render :edit }
        format.json { render json: @ava_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ava_infos/1
  # DELETE /ava_infos/1.json
  def destroy
    @ava_info.destroy
    respond_to do |format|
      format.html { redirect_to ava_infos_url, notice: 'Ava info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ava_info
      @ava_info = AvaInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ava_info_params
      params.require(:ava_info).permit(:pharmacy_id, :medicine_id, :quantity)
    end
end
