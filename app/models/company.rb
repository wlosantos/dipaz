class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :registers, dependent: :destroy

  enum status: { active: 0, blocked: 1 }

  validates :name, presence: true, length: { minimum: 5 }
  validates :cnpj, presence: true,
                   uniqueness: { message: 'already registered for a company!' },
                   length: { minimum: 18 }

  before_validation :allow_create?, on: :create
  before_validation :allow_update?, on: :update

  private

  def cnpj_valid?
    return true if CNPJ.valid?(cnpj)

    errors.add(:cnpj, 'is not valid!')
    false
  end

  def cnpj_not_exists?
    return true if Company.where(cnpj: cnpj).first.nil?

    errors.add(:cnpj, 'already registered!')
    false
  end

  def cnpj_approved?
    cnpj_valid? && !cnpj_not_exists?
  end

  def allow_create?
    cnpj_approved?
  end

  def allow_update?
    return false if cnpj_changed? && !cnpj_approved?

    true
  end
end
