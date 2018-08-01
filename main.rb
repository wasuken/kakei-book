# coding: iso-2022-jp
require "sinatra"
require "sequel"
require "sqlite3"

DB = Sequel.sqlite('kakei.sqlite3')

# todo: 登録されている日付の一覧をviewに渡す
get '/' do
  erb :index
end
# todo: URLと合致する日付のアイテムをview渡す
get '/:date' do
  erb :day
end
get '/json' do
  date,number,name,amount = getUpdateParams(params)
end

get '/json' do
  date,number,name,amount = getUpdateParams(params)
  DB[:].insert()
end

put '/json' do
  date,number,name,amount = getUpdateParams(params)
end

delete '/json' do
  date,number,name,amount = getUpdateParams(params)
end
# refinementでうまくやれそうな気がする。
def getUpdateParams(params)
  [params[:date] || "",params[:number] || "",params[:name] || "",params[:amount] || ""]
end
