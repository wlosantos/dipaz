require 'rails_helper'

RSpec.describe 'Api::V1::Registers', :focus, type: :request do
  let(:company) { create(:company, :active) }
  let(:auth_data) { user.create_new_auth_token }
  let(:user) { create(:user, company: company) }
  let(:headers) do
    {
      'Accept': 'application/vnd.dipaz.v1',
      'Content-Type': Mime[:json].to_s,
      'access-token': auth_data['access-token'],
      'uid': auth_data['uid'],
      'client': auth_data['client']
    }
  end

  describe 'GET /companies/:id/registers' do
    let(:register) { create_list(:register, 30, company: company) }

    context 'returns succesfully' do
      before do
        register
        get "/companies/#{company.id}/registers", params: {}, headers: headers
      end

      it { expect(response).to have_http_status :success }
      it 'return list with json data' do
        expect(json_body.count).to eq(30)
      end
    end

    context 'access not allowed' do
      before do
        get "/companies/#{company.id}/registers", params: {}, headers: { 'Content-Type' => 'application/json' }
      end

      it { expect(response).to have_http_status :unauthorized }
    end
  end

  describe 'GET /companies/:id/registers/:id' do
    let(:register) { create(:register, company: company) }

    context 'returns successfully' do
      before do
        register
        get "/companies/#{company.id}/registers/#{register.id}", params: {}, headers: headers
      end

      it { expect(response).to have_http_status :success }
      it 'return json data of register' do
        expect(json_body[:cpf]).to eq(register.cpf)
      end
    end

    context 'failures' do
      before do
        get "/companies/#{company.id}/registers/1000", params: {}, headers: headers
      end

      it { expect(response).to have_http_status :unprocessable_entity }
    end
  end
end
