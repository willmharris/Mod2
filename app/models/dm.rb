class Dm < ApplicationRecord
    has_many :dm_monsters
    has_many :monsters, through: :dm_monsters
end
