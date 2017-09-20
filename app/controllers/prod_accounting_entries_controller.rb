class ProdAccountingEntriesController < ApplicationController
  #before_action :set_prod_accounting_entry, only: [:show, :edit, :update, :destroy]

  # GET /prod_accounting_entries
  # GET /prod_accounting_entries.json
  def index
    @prod_accounting_entries = Policy.limit(10).page(params[:page])
  end

  # GET /prod_accounting_entries/1
  # GET /prod_accounting_entries/1.json
  def show
    @prod_accounting_entry = Policy.find(params[:id])
  end

  # GET /prod_accounting_entries/new
  def new
    @prod_accounting_entry = Policy.new
  end

  # GET /prod_accounting_entries/1/edit
  def edit
  end

  # POST /prod_accounting_entries
  # POST /prod_accounting_entries.json
  def create
    @prod_accounting_entry = Policy.new(prod_accounting_entry_params)

    respond_to do |format|
      if @prod_accounting_entry.save
        format.html { redirect_to @prod_accounting_entry, notice: 'Prod accounting entry was successfully created.' }
        format.json { render :show, status: :created, location: @prod_accounting_entry }
      else
        format.html { render :new }
        format.json { render json: @prod_accounting_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prod_accounting_entries/1
  # PATCH/PUT /prod_accounting_entries/1.json
  def update
    respond_to do |format|
      if @prod_accounting_entry.update(prod_accounting_entry_params)
        format.html { redirect_to @prod_accounting_entry, notice: 'Prod accounting entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @prod_accounting_entry }
      else
        format.html { render :edit }
        format.json { render json: @prod_accounting_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prod_accounting_entries/1
  # DELETE /prod_accounting_entries/1.json
  def destroy
    @prod_accounting_entry.destroy
    respond_to do |format|
      format.html { redirect_to prod_accounting_entries_url, notice: 'Prod accounting entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prod_accounting_entry
      @prod_accounting_entry = Policy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prod_accounting_entry_params
      params.fetch(:prod_accounting_entry, {})
    end
end
