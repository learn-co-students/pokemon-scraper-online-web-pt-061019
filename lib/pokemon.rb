class Pokemon
  attr_accessor :id, :name, :type, :db
  
  @@all = []
  
  def initialize(pokemon) #keyword arguments
    @id = pokemon[id]
    @name = pokemon[name]
    @type = pokemon[type]
    @db = pokemon[db]
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)  #parameterized query
    db.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ?)", name, type)
  end
end