class Investor < User
  has_one :response, dependent: :destroy
  has_one :contact, dependent: :destroy
end
