class Investor < User
  has_one :response, dependent: :destroy
end
