class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
        # sql = <<-SQL
        # INSERT INTO pokemon (name, type)
        # VALUES (?, ?)
        # SQL
    end

    def self.find(id_number, db)
        pokemon_object = db.execute("SELECT * FROM pokemon WHERE id = ?", id_number).flatten
        # flatten - every element that is an array, extract its elements into the new array.
        Pokemon.new(id: pokemon_object[0], name: pokemon_object[1], type: pokemon_object[2], db: db)
    end
end
