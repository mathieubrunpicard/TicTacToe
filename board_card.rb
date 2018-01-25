class Board_card

  attr_accessor :status

  @@instance = 0
  @@children = []
  def initialize(status ="")
    @status = status
    @@instance +=1
    @@children << self
  end
end


#Ici une boucle qui parcoure chacun des élements
#Pour vérifier si il y a 3 élements à la suite

