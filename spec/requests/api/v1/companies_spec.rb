require 'rails_helper'

RSpec.describe 'Companies', :focus, type: :request do
  let!(:company) { create(:company, status: set_status) }
  describe 'GET /companies' do
    before do
      company
      get '/companies', params: {}, headers: { 'Content-Type' => 'application/json' }
    end

    context 'returns successfully' do
      let(:set_status) { 'active' }
      it { expect(response).to have_http_status :success }
      it { expect(json_body[:cnpj]).to eq(company.cnpj) }
    end

    context 'access not allowed' do
      let(:set_status) { 'blocked' }
      before do
        get '/companies', params: {}, headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response).to have_http_status :unauthorized }
      it { expect(json_body[:warning]).to eq('Company blocked. Contact support!') }
    end
  end
end
