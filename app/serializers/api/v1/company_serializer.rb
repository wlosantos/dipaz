module Api
  module V1
    class CompanySerializer < ActiveModel::Serializer
      attributes :id, :name, :cnpj, :domain, :status
      has_many :users
    end
  end
end
