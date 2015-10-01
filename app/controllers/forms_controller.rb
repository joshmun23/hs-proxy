class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  # GET /forms
  # GET /forms.json
  def index
    baseUrl       = 'https://forms.hubspot.com/uploads/form/v2'
    url           = "#{baseUrl}/#{ENV['PORTAL_ID']}/#{ENV['FORM_GUID']}"
    baseParams    = '?'
    totalParams   = ''
    msg = {}
    hs_params = {}

    if params["hs_context"]['hutk'] && !params["hs_context"]['hutk'].empty?
      hs_params['pageUrl'] = params['hs_context']['pageUrl']
      hs_params['pageName'] = params['hs_context']['pageName']
      hs_params['hutk'] = params['hs_context']['hutk']
    end

    hs_context = JSON.generate(hs_params)

    if params['email'] && !params['email'].empty?
      msg[:hsStatus] = 200
      totalParams += "email=#{params['email']}&newsletter_subscriber=true"

      http = Curl.post("#{url}/#{baseParams + totalParams}", hs_context)
      binding.pry
    else
      msg[:hsStatus] = 400
      msg[:errors] = 'E-mail Cannot be Blank'
    end

    render :json => JSON.generate(msg), :callback => params[:callback]
  end

  private
end
