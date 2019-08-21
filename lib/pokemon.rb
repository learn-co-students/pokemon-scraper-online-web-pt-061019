class Pokemon
  # db.execute( "INSERT INTO Products ( stockID, Name ) VALUES ( ?, ? )", [id, name])
  attr_accessor :id, :name, :type, :db
  
  def initialize(pokemon) #keyword arguments
    @id = pokemon[id]
    @name = pokemon[name]
    @type = pokemon[type]
    @db = pokemon[db]
  end
end