class TopProducersController < ApplicationController
  # before_action :set_top_producer, only: [:show, :edit, :update, :destroy]

  # GET /top_producers
  # GET /top_producers.json
  def index
    start_date = params[:start_date]
    end_date = params[:end_date]
    issuecode = params[:issuecode]
    no_of_records = params[:no_of_records]
  	@policies = Policy.accounting_entry_search_date(start_date,end_date).search_by_branch(issuecode&.upcase)

    @invoices = CommissionInvoice.where(policy_id: @policies).limit(no_of_records)
    #.page(params[:page])
    #@agents = Intermediary.where(number: @comminv)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_top_producer
  #     @top_producer = Policy.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def top_producer_params
  #     params.fetch(:top_producer, {})
  #   end
end
