require "sequel"
require "sqlite3"

DB = Sequel.sqlite('kakei.sqlite3')

DB.create_table!(:items) do
  primary_key :id
  String :name
  Integer :amount
  unique :name
end
DB.run("create table buys(
    id integer,
    date timestamp,
    primary key(id,date)
)")
DB.run("create table buy_item(
    item_id integer,
    buy_id integer,
    date    timestamp,
    foreign key(item_id) references items(id),
    foreign key(buy_id)  references buys(id),
    foreign key(date)    references buys(date),
    primary key(item_id,buy_id,date)
)")
