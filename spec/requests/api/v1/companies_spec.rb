require 'rails_helper'

RSpec.describe 'Companies', type: :request do
  let!(:company) { create(:company, status: set_status) }
  let(:headers) do
    {
      'Accept': 'application/vnd.dipaz.v1',
      'Content-Type': Mime[:json].to_s
    }
  end

  describe 'GET /companies' do
    before do
      company
      get '/companies', params: {}, headers: headers
    end

    context 'returns successfully' do
      let(:set_status) { 'active' }
      it { expect(response).to have_http_status :success }
      it { expect(json_body[:cnpj]).to eq(company.cnpj) }
    end

    context 'access not allowed' do
      let(:set_status) { 'blocked' }
      before do
        get '/companies', params: {}, headers: headers
      end

      it { expect(response).to have_http_status :unauthorized }
      it { expect(json_body[:warning]).to eq('Company blocked. Contact support!') }
    end
  end

  describe 'PUT /companies/:id' do
    before do
      company
      put "/companies/#{company.id}", params: params_company.to_json, headers: headers
    end

    context 'updated successful' do
      let(:set_status) { 'active' }
      let(:params_company) { attributes_for(:company, name: 'W3n Designer') }

      it { expect(response).to have_http_status :success }
      it { expect(json_body[:name]).to eq(params_company[:name]) }
    end

    context 'updated failure' do
      let(:set_status) { 'active' }
      let(:params_company) { attributes_for(:company, name: '') }

      it { expect(response).to have_http_status :unprocessable_entity }
      it { expect(json_body[:errors]).to include("Name can't be blank") }
    end

    context 'updated company blocked' do
      let(:set_status) { 'blocked' }
      let(:params_company) { attributes_for(:company, name: 'W3n Designer') }
      it { expect(response).to have_http_status :unauthorized }
      it { expect(json_body[:warning]).to eq('Company blocked. Contact support!') }
    end
  end
end
