class RenewalNoticeController < ApplicationController
    before_action :set_transmittal_list, only: [:show, :edit, :update, :destroy]

    # GET /transmittal_lists
    # GET /transmittal_lists.json
    def single
      linecode = params[:linecode]
      sublinecode = params[:sublinecode]
      issuecode = params[:issuecode]
      issueyear = params[:issueyear]
      polseqno = params[:polseqno]
      renewno = params[:renewno]
      @transmittal = Expiry.policy_search(linecode&.upcase, sublinecode&.upcase, issuecode&.upcase, issueyear, polseqno, renewno).where(renewflag: '2')
    end

    def perbranch
      start_date = params[:start_date]
      end_date = params[:end_date]
      branchcode = params[:branchcode]
      linecode = params[:linecode]
      @transmittal_lists_branch = Expiry.search_date(start_date,end_date).where(renewflag: '2').search_by_line(linecode).where.not(sublinecode: ['GSPA', 'GPA']).search_by_branch(branchcode&.upcase).page(params[:page])

      @policy = Policy.not_spoiled
    end

    def perintm
      start_date = params[:start_date]
      end_date = params[:end_date]
      intermediaryno = params[:intermediaryno]
      linecode = params[:linecode]
      @transmittal_lists_intermediary = Expiry.search_date(start_date,end_date).where(renewflag: '2').search_by_line(linecode).where.not(sublinecode: ['GSPA', 'GPA']).search_by_intermediary(intermediaryno).page(params[:page])

      @policy = Policy.not_spoiled
    end

    # GET /transmittal_lists/1
    # GET /transmittal_lists/1.json
    def show
       @details = Policy.find(params[:id])

       @taxes = OldTax.where(policy_id: @details.id).or(NewTax.where(policy_id: @details.id))
    end

    # GET /transmittal_lists/new
    def new
      @transmittal_list = TransmittalList.new
    end

    # GET /transmittal_lists/1/edit
    def edit
    end

    # POST /transmittal_lists
    # POST /transmittal_lists.json
    def create
      @transmittal_list = TransmittalList.new(transmittal_list_params)

      respond_to do |format|
        if @transmittal_list.save
          format.html { redirect_to @transmittal_list, notice: 'Transmittal list was successfully created.' }
          format.json { render :show, status: :created, location: @transmittal_list }
        else
          format.html { render :new }
          format.json { render json: @transmittal_list.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /transmittal_lists/1
    # PATCH/PUT /transmittal_lists/1.json
    def update
      respond_to do |format|
        if @transmittal_list.update(transmittal_list_params)
          format.html { redirect_to @transmittal_list, notice: 'Transmittal list was successfully updated.' }
          format.json { render :show, status: :ok, location: @transmittal_list }
        else
          format.html { render :edit }
          format.json { render json: @transmittal_list.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /transmittal_lists/1
    # DELETE /transmittal_lists/1.json
    def destroy
      @transmittal_list.destroy
      respond_to do |format|
        format.html { redirect_to transmittal_lists_url, notice: 'Transmittal list was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_transmittal_list
        # @transmittal_list = TransmittalList.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def transmittal_list_params
        params.fetch(:transmittal_list, {})
      end
end
