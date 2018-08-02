# coding: utf-8
require "sinatra"
require "sequel"
require "sqlite3"
require "./lib/ServeHelper"

DB = Sequel.sqlite('kakei.sqlite3')
include ServeHelper
# todo: 登録されている日付の一覧をviewに渡す
get '/' do
  erb :index
end
# todo: URLと合致する日付のアイテムをview渡す
get '/date/:date' do
  erb :day
end
get '/json' do
  date,name,amount = getUpdateParams(params)
end

post '/json' do
  date,name,amount = getUpdateParams(params)
  id = get_id_if_nil_set_item(name,amount)
  DB[:buys].insert(items_id: id,date: date)
end
# なんだこの関数名
def get_id_if_nil_set_item(name,amount)
  if DB[:items].where(name: name).nil?
    DB[:items].insert(name: name,amount: amount)
  end
  DB[:items].where(name: name).select(:id).first[:id]
end

put '/json' do
  date,name,amount = getUpdateParams(params)
  id = get_id_if_nil_set_item(name,amount)
  DB[:buys].where(items_id: id,date: date)
end

delete '/json' do
  date,name,amount = getUpdateParams(params)
end
