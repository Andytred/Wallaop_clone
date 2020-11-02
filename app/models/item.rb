class Item < ApplicationRecord
    belongs_to :user
    scope :available, -> { where(available: true) }

    has_many :transactions, dependent :destroy

    CATEGORIES = ['Books','Clothes', 'Decoration', 'Hobbies', 'Home', 'Kids', 'Music', 'Services', 'Sports', 'Vehicles', 'Other'].freeze

end
