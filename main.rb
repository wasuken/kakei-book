# coding: utf-8
require "sinatra"
require "sequel"
require "sqlite3"
require "./lib/ServeHelper"

DB = Sequel.sqlite('kakei.sqlite3')
include ServeHelper
# todo: 登録されている日付の一覧をviewに渡す
get '/' do
  @title = "kakei-book"
  @css = "index.css"
  @js = ["app.js"]
  @recs = DB[:buys]

  erb :index
end
get '/buy' do
  p params
  @buy_id = params[:buy_id]
  @date   = params[:date]
  erb :buy
end
post '/buy' do
  date = params[:date].split(' ')[0,2].join(' ')
  DB[:buys].insert(date: date)
  redirect '/'
end
post '/item' do
  date,name,amount,buy_id = getUpdateParams(params)
  return if DB[:items].where(name: name).all.count > 0

  DB[:items].insert(name: name, amount: amount)
  item_id = DB[:items].where(name: name).all.first[:id]
  DB[:buy_item].insert(item_id: item_id, buy_id: buy_id)
end
get '/items' do
  @buy_id = params[:buy_id]
  redirect '/' if !@buy_id
  items = DB[:buy_item].where(:buy_id => @buy_id).select(:item_id).all
  @recs = DB[:items].where(:id => items.map{|i| i[:item_id]}).all
  erb :day
end
# todo: URLと合致する日付のアイテムをview渡す
get '/day/:date' do
  @css = "day.css"
  @items = DB[:items].all
  erb :day
end
get '/json' do

end
# なんだこの関数名
def get_id_if_nil_set_item(name,amount)
  if DB[:items].where(name: name).nil?
    DB[:items].insert(name: name,amount: amount)
  end
  DB[:items].where(name: name).select(:id).first[:id]
end
