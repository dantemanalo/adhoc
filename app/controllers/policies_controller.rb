class PoliciesController < ApplicationController

  def prod_acct_entry
    start_date = params[:start_date]
    end_date = params[:end_date]
    number = params[:number]
  	@prod_accounting_entries = Policy.accounting_entry_search_date(start_date,end_date).search_by_assured(number).page(params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data Policy.to_csv(start_date,end_date) }
    end
  end

  def show
   @prod_accounting_entry = Policy.find(params[:id])
  end

  def undistributed
    @q = Policy.search(params[:q])

    @undistributed_policies = @q.result.where(accounting_entry_date: nil).where.not(pol_flag: '5').where.not(reg_pol_switch: 'N').where.not(prem_amount: '0').order(inceptdate: :desc).page(params[:page])

    #@distributed = PolicyDistribution.where.not(flag: ['3','4'])
  end

  def non_marine_treaty
    @distributions = PolicyDistribution.select(:policy_id).where("dist_flag <> ?", 4).where(acct_ent_date: nil).or(PolicyDistribution.select(:policy_id).where(flag: '4').where.not(acct_ent_date: nil))

    @q = Policy.where(policy_id: @distributions).search(params[:q])

    @non_marine_distributions = @q.result.where("pol_flag <> ?", 5).where(reg_pol_switch: 'Y').page(params[:page])
  end

  def posted_docs_count
    if params[:q]
      @q = ParHistory.search(params[:q])
      @posted_count = @q.result.where(status_code: '10')
    else
      @q = ParHistory.search(params[:q])
      @posted_count = @q.result.where(status_code: '0')
      #.page(params[:page])
    end
  end

  def negated
    @negated_policies = Policy.where.not(accounting_entry_date: nil).where(distributionflag: ['1','2']).where.not(prem_amount: '0').order(accounting_entry_date: :desc).page(params[:page])
  end

  def surety_register
    if params[:q]
      @q = Policy.search(params[:q])
      @policies = @q.result.where(line: 'SU').page(params[:page])
    else
      @q = Policy.search(params[:q]) # returns a blank ransack search
      @policies = @q.result.where(iss_date: Time.now.beginning_of_month..Time.now).where(line: 'SU').page(params[:page])
    end
  end

  def policy_count
    # @q = Policy.search(params[:q])
    # @results = @q.result
    # @results = @results.where(iss_date: nil) unless params[:q]

    if params[:q]
      @q = Policy.search(params[:q])
      @policies = @q.result
    else
      @q = Policy.search(params[:q]) # returns a blank ransack search
      @policies = @q.result.where(iss_date: Time.now.beginning_of_month..Time.now)
    end
    #@policies_by_month = @policies.group_by { |p| p.iss_date.beginning_of_month }
  end

  def create
  end

  def update
  end

  def destroy
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
