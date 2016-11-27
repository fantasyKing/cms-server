# Phoncol::DbTable
module Phoncol
  client_name = "phoncol"
  client = Mongoid.client(client_name)
  dbs = client.database_names
  
  dbs.each do |db_name|
    print "#{db_name}\n"
    cols = client.use(db_name).database.collection_names
    cols.each do |col_name|
      next if ".".in?(col_name)
      print "#{db_name.camelize}|#{col_name.camelize}\n"

      const_set("#{db_name.camelize}#{col_name.camelize}", Class.new {
        include Mongoid::Document
        include Mongoid::Attributes::Dynamic
        @store = {client: client_name,database: db_name,collection: col_name}
        store_in @store
        def self.store
          return @store
        end
      })
    end
  end
end
