class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL

    pokemon = db.execute(sql, id_num)
    new_pokemon = Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], db: db)
  end

end
