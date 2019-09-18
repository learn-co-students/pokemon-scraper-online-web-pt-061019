class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
          
         sql = "INSERT INTO pokemon(name, type) VALUES(?, ?)" 

         db.execute(sql, name, type) 
            
    end
    
    def self.find(id_n, db_n)
        sql = 
            "SELECT * FROM pokemon 
            WHERE id = ?"

        new_pokemon = db_n.execute(sql, id_n) 
        self.new(id: new_pokemon[0][0], name: new_pokemon[0][1], type: new_pokemon[0][2], db: db_n)
    end 
    
end
