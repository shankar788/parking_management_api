class Floor < ApplicationRecord
    has_many :slots, dependent: :destroy
    has_many :names, dependent: :destroy
end
