require 'pry'

class GirlsController < ApplicationController
  before_action :set_girl, only: [:show, :edit, :update, :destroy]

  # GET /girls
  # GET /girls.json
  def index
    @girls = Girl.all
  end

  # GET /girls/1
  # GET /girls/1.json
  def show
  end

  # GET /girls/new
  def new
    @mmm  = '2323'
    @girl = Girl.new
    binding.pry
  end

  # GET /girls/1/edit
  def edit
  end

  # POST /girls
  # POST /girls.json
  def create
    @girl = Girl.new(girl_params)
    respond_to do |format|
      if @girl.save
        format.html { redirect_to @girl, notice: 'Girl was successfully created.' }
        format.json { render :show, status: :created, location: @girl }
      else
        format.html { render :new }
        format.json { render json: @girl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /girls/1
  # PATCH/PUT /girls/1.json
  def update
    respond_to do |format|
      if @girl.update(girl_params)
        format.html { redirect_to @girl, notice: 'Girl was successfully updated.' }
        format.json { render :show, status: :ok, location: @girl }
      else
        format.html { render :edit }
        format.json { render json: @girl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /girls/1
  # DELETE /girls/1.json
  def destroy
    @girl.destroy
    respond_to do |format|
      format.html { redirect_to girls_url, notice: 'Girl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_girl
      @girl = Girl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def girl_params
      params.require(:girl).permit(:name, :number)
    end
end
