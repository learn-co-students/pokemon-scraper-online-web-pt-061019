class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:) #keyword arguments
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)  #parameterized query
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
  end
end