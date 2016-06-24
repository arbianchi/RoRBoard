class Vote < ApplicationRecord
  belongs_to :user, through: :comment
end
