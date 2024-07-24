class Contact < ApplicationRecord
  belongs_to :investor, class_name: 'User'
  has_many :responses
end
