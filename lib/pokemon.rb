class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, database)
    sql = <<-SQL
    INSERT INTO pokemon
    (name, type)
    VALUES (?, ?)
    SQL
    database.execute(sql, name, type)

    sql_2 = "SELECT last_insert_rowid() FROM pokemon"
    id = database.execute(sql_2)[0][0]
    Pokemon.new(id: id, name: name, type: type, db: database)
  end

  def self.find(id, database)
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    SQL
    row = database.execute(sql, id)[0]

    Pokemon.new(id: row[0], name: row[1], type: row[2], db: database)
  end






end
