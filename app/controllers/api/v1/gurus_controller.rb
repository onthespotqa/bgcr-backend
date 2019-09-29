class Api::V1::GurusController < Api::V1::BaseController
  before_action :set_guru, only: [:show, :update, :destroy]

  # GET /gurus
  def index
    @gurus = GuruBlueprint.render Guru.all, view: :normal

    render json: @gurus
  end

  # GET /gurus/1
  def show
    guru = GuruBlueprint.render @guru, view: :normal
    render json: guru
  end

  # POST /gurus
  def create
    @guru = Guru.new(guru_params)

    if @guru.save
      render json: @guru
    else
      render json: @guru.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gurus/1
  def update
    if @guru.update(guru_params)
      render json: @guru
    else
      render json: @guru.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gurus/1
  def destroy
    @guru.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_guru
    @guru = Guru.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def guru_params
    params.require(:guru).permit(:blog, :group, skin: [], undertone: [])
  end
end

