require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'database' do
    context 'indexes' do
      it { is_expected.to have_db_index(:cnpj).unique(true) }
    end

    context 'must be present' do
      it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:cnpj).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:domain).of_type(:string) }
      it { is_expected.to have_db_column(:status).of_type(:integer) }
    end

    context 'attributes' do
      let(:company) do
        build(:company, name: 'w3n design', cnpj: '11.006.382/0001-87', domain: 'w3ndesign.com', status: 'active')
      end
      it { expect(company).to have_attributes(name: 'w3n design') }
      it { expect(company).to have_attributes(cnpj: '11.006.382/0001-87') }
      it { expect(company).to have_attributes(domain: 'w3ndesign.com') }
      it { expect(company).to have_attributes(status: 'active') }
    end

    context 'validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_presence_of :cnpj }
      it { is_expected.to validate_length_of(:name).is_at_least(5) }
      it { is_expected.to validate_length_of(:cnpj).is_at_least(18) }
      it { is_expected.to define_enum_for(:status).with_values(%i[active blocked]) }
    end
  end

  describe 'persisting data' do
    let(:company) { create(:company, name: set_name) }
    let(:last_company) { Company.last }

    context 'successfully' do
      let(:set_name) { 'W3n Design' }
      before do
        company
        last_company
      end

      it 'add atributes valid' do
        expect(company).to be_valid
      end
      it 'comparing with the last data' do
        expect(last_company).to eq(company)
      end
    end

    context 'failures' do
      let(:set_name) { '' }
      it 'raise error - Redord::Invalid' do
        expect { company }.to raise_error(ActiveRecord::RecordInvalid)
      end

      context 'add repeated or invalid cnpj' do
        let(:company) { create(:company, cnpj: '11.006.382/0001-87') }
        let(:company2) { create(:company, cnpj: '11.006.382/0001-87') }
        let(:company3) { create(:company, :cnpj_invalid) }
        before { company }

        it '' do
          expect do
            company2
          end.to raise_error('Validation failed: Cnpj already registered!, Cnpj already registered for a company!')
        end

        it {
          expect do
            company3
          end.to raise_error('Validation failed: Cnpj is not valid!, Cnpj is too short (minimum is 18 characters)')
        }
      end
    end
  end
end
