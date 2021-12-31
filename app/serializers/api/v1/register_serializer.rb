class Api::V1::RegisterSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthday, :cpf, :rg, :accession_at, :status

  def birthday
    object.birthday.strftime('%Y-%m-%d')
  end

  def accession_at
    object.accession_at.strftime('%Y-%m-%d')
  end
end
