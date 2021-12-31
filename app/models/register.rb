class Register < ApplicationRecord
  belongs_to :company, inverse_of: :registers

  enum plan: { titular: 0, dependent: 1 }
  enum status: { active: 0, inactive: 1 }

  validates :name, presence: true
  validates :birthday, presence: true
  validates :accession_at, presence: true
  validates :plan, :status, presence: true
  validates :cpf, presence: true,
                  uniqueness: { message: 'already registered!' },
                  length: { minimum: 14 }

  before_validation :allow_create?, on: :create
  before_validation :allow_update?, on: :update

  private

  def cpf_valid?
    return true if CPF.valid?(cpf)

    errors.add(:cpf, 'is not valid!')
    false
  end

  def cpf_not_exists?
    Register.where(cpf: cpf).first.nil?
  end

  def cpf_approved?
    cpf_valid? && !cpf_not_exists?
  end

  def allow_create?
    cpf_approved?
  end

  def allow_update?
    return false if cpf_changed? && !cpf_approved?

    true
  end
end
