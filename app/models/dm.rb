class Dm < ApplicationRecord
    has_secure_password
    has_many :dm_monsters
    has_many :monsters, through: :dm_monsters
    validates :name, presence: true, uniqueness: {case_sensitive: false}
end
