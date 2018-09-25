class OpenPoliciesController < ApplicationController
  def index
  end

  def show
    linecode = params[:linecode]
    sublinecode = params[:sublinecode]
    issuecode = params[:issuecode]
    issueyear = params[:issueyear]
    polseqno = params[:polseqno]
    renewno = params[:renewno]
    from_date = params[:from_date]
    to_date = params[:to_date]

    @marine_open_policies = OpenPolicy.mop_search(linecode, sublinecode, issuecode, issueyear, polseqno,  renewno)

    @risk_notes = Policy.where(policy_id: @marine_open_policies, effectivitydate: from_date..to_date).where.not(policyflag: ['4', '5'], reg_pol_switch: ['N']).page(params[:page])

  end
end
