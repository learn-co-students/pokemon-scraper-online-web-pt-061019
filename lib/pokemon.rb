class Pokemon
    attr_accessor :name, :type, :db, :hp
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        result.first
        Pokemon.new(id: result.first[0], name: result.first[1], type: result.first[2], db: db)
    end
end
