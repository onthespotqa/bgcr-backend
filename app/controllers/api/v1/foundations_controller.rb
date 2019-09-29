class Api::V1::FoundationsController < Api::V1::BaseController
  before_action :set_foundation, only: [:show, :update, :destroy]
  before_action :set_guru, only: [:create]

  # POST /gurus/:id/foundations
  def create
    @foundation = @guru.foundations.new(foundation_params)

    if @foundation.save
      render json: @guru, status: :created
    else
      render json: @foundation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gurus/:id/foundations/1
  def update
    if @foundation.update(foundation_params)
      render json: @foundation
    else
      render json: @foundation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gurus/:id/foundations/1
  def destroy
    @foundation.destroy
  end

  private
    def set_guru
      @guru = Guru.find(params[:guru_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_foundation
      @foundation = Foundation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def foundation_params
      params.require(:foundation).permit(:brand, :shade, :group)
    end
end
