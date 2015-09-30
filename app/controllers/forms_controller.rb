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
    hs_params = {
      hutk: '',
      ipAddress: '',
      pageUrl: 'http://foodspoileralert.com/home-news-carousel-test',
      pageName: 'Test Page'
    }

    hs_context = JSON.generate(hs_params)

    if params['email'] && !params['email'].empty?
      msg[:hsStatus] = 200
      totalParams += "email=#{params['email']}"
      binding.pry
      http = Curl.post("#{url}/#{baseParams + totalParams}", hs_context)
    else
      msg[:hsStatus] = 400
      msg[:errors] = 'E-mail Cannot be Blank'
    end

    binding.pry
    render :json => JSON.generate(msg), :callback => params[:callback]
  end

  private
end
