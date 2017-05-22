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
    @ava_info.build_medicine
  end

  # GET /ava_infos/1/edit
  def edit
  end

  # POST /ava_infos
  # POST /ava_infos.json
  def create
	med = Medicine.find_or_create_by(medicine_name: ava_info_params[:medicine_attributes][:medicine_name],
	                                 dosage: ava_info_params[:medicine_attributes][:dosage],
	                                 quantity_or_volume: ava_info_params[:medicine_attributes][:quantity_or_volume],
	                                 manufacturer: ava_info_params[:medicine_attributes][:manufacturer],
	                                 need_recipe: ava_info_params[:medicine_attributes][:need_recipe],
	                                 price: ava_info_params[:medicine_attributes][:price],
	                                 category_id: ava_info_params[:medicine_attributes][:category_id])                            
    @ava_info = AvaInfo.new(pharmacy_id: ava_info_params[:pharmacy_id], medicine: med, quantity: ava_info_params[:quantity])
    respond_to do |format|
      if @ava_info.save
        format.html { redirect_to @ava_info, notice: 'Новая запись была успешно создана.' }
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
        format.html { redirect_to @ava_info, notice: 'Запись успешно обновлена' }
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
    med_id = @ava_info.medicine_id
    f=0
    if (AvaInfo.select(:medicine_id).where(medicine_id: med_id).group(:medicine_id).count.first[1] == 1)
      f=1
    end
    @ava_info.destroy
    if f==1
      Medicine.find(med_id).destroy
    end
    respond_to do |format|
      msg = 'Запись успешно удалена.'
      if f==1
        msg = msg + ' Также удалено лекарство, так как на него нет больше ссылок!'
      end
      format.html { redirect_to ava_infos_url, notice: msg }
      format.json { head :no_content }
    end
    Medicine
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ava_info
      @ava_info = AvaInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ava_info_params
      params.require(:ava_info).permit(:pharmacy_id, :medicine_id, :quantity,
      medicine_attributes: [:id, :medicine_name, :dosage, :quantity_or_volume, :manufacturer, :need_recipe, :price, :category_id,
      category_attributes: [:id, :_destroy, :category_name]])
    end
    
    def check_ctr_auth()
      if action_name.to_sym == :show or action_name.to_sym == :index
        return true
      else
        if @current_role_user.try(:is_admin?)
          return true
        else
          return false
        end
      end
    end
end
