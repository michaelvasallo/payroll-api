class TimeReport < ApplicationRecord
  has_many :time_entries, dependent: :destroy
end
