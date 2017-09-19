class AdhocsController < ApplicationController
  before_action :set_adhoc, only: [:show, :edit, :update, :destroy]

  # GET /adhocs
  # GET /adhocs.json
  def index
    @adhocs = Adhoc.all
  end

  # GET /adhocs/1
  # GET /adhocs/1.json
  def show
  end

  # GET /adhocs/new
  def new
    @adhoc = Adhoc.new
  end

  # GET /adhocs/1/edit
  def edit
  end

  # POST /adhocs
  # POST /adhocs.json
  def create
    @adhoc = Adhoc.new(adhoc_params)

    respond_to do |format|
      if @adhoc.save
        format.html { redirect_to @adhoc, notice: 'Adhoc was successfully created.' }
        format.json { render :show, status: :created, location: @adhoc }
      else
        format.html { render :new }
        format.json { render json: @adhoc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adhocs/1
  # PATCH/PUT /adhocs/1.json
  def update
    respond_to do |format|
      if @adhoc.update(adhoc_params)
        format.html { redirect_to @adhoc, notice: 'Adhoc was successfully updated.' }
        format.json { render :show, status: :ok, location: @adhoc }
      else
        format.html { render :edit }
        format.json { render json: @adhoc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adhocs/1
  # DELETE /adhocs/1.json
  def destroy
    @adhoc.destroy
    respond_to do |format|
      format.html { redirect_to adhocs_url, notice: 'Adhoc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adhoc
      @adhoc = Adhoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adhoc_params
      params.fetch(:adhoc, {})
    end
end
