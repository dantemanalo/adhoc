class IncurredLossesController < ApplicationController
  # before_action :set_incurred_loss, only: [:show, :edit, :update, :destroy]

  # GET /incurred_losses
  # GET /incurred_losses.json
  def index
      start_date = params[:start_date]
      end_date = params[:end_date]
      number = params[:number]
    	@incurred_losses = Policy.accounting_entry_search_date(start_date,end_date).search_by_assured(number).group(:linecode).page(params[:page])
  end

  def by_assured
    @q = Assured.search(params[:q])
    @assureds = @q.result.all.page(params[:page])
  end

  # GET /incurred_losses/1
  # GET /incurred_losses/1.json
  def show
  end

  # GET /incurred_losses/new
  def new
  end

  # GET /incurred_losses/1/edit
  def edit
  end

  # POST /incurred_losses
  # POST /incurred_losses.json
  # def create
  #   @incurred_loss = IncurredLoss.new(incurred_loss_params)
  #
  #   respond_to do |format|
  #     if @incurred_loss.save
  #       format.html { redirect_to @incurred_loss, notice: 'Incurred loss was successfully created.' }
  #       format.json { render :show, status: :created, location: @incurred_loss }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @incurred_loss.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /incurred_losses/1
  # # PATCH/PUT /incurred_losses/1.json
  # def update
  #   respond_to do |format|
  #     if @incurred_loss.update(incurred_loss_params)
  #       format.html { redirect_to @incurred_loss, notice: 'Incurred loss was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @incurred_loss }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @incurred_loss.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /incurred_losses/1
  # # DELETE /incurred_losses/1.json
  # def destroy
  #   @incurred_loss.destroy
  #   respond_to do |format|
  #     format.html { redirect_to incurred_losses_url, notice: 'Incurred loss was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  # # private
  # #   # Use callbacks to share common setup or constraints between actions.
  # #   def set_incurred_loss
  # #     @incurred_loss = IncurredLoss.find(params[:id])
  # #   end
  # #
  # #   # Never trust parameters from the scary internet, only allow the white list through.
  # #   def incurred_loss_params
  # #     params.fetch(:incurred_loss, {})
  # #   end
end
