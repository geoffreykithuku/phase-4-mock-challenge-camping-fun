class Signup < ApplicationRecord 
  
    validates :time, inclusion: {within: 0..23}
    belongs_to :activity 
    belongs_to :camper


   
end
