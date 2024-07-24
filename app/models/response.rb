class Response < ApplicationRecord
  belongs_to :idea
  belongs_to :investor, class_name: 'User'
  belongs_to :contact
end
