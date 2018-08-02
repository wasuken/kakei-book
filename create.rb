require "sequel"
require "sqlite3"

DB = Sequel.sqlite('kakei.sqlite3')

DB.create_table!(:items) do
  primary_key :id
  String :name
  Integer :amount
  unique :name
end
>DB.run("create table buys(date timestamp,
       items_id integer,
       foreign key (items_id) references items(id)
);")
