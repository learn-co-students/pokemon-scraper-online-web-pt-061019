class Pokemon

attr_accessor :name, :type, :db
attr_reader :id

def initialize(id: nil, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
end

def self.save(name_in,type_in,db_in)
 sql = <<-SQL
 INSERT INTO pokemon (name,type)
 VALUES (?,?)
 SQL
 db_in.execute(sql, name_in, type_in)
end

def self.find(id_in,db_in)
  sql =  <<-SQL
  SELECT * FROM pokemon
  WHERE id = ?
  SQL
  array = db_in.execute(sql,id_in)
  Pokemon.new(id: array[0][0],name: array[0][1],type: array[0][2],db: db_in)
end

end
