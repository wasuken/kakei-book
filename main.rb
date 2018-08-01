# coding: iso-2022-jp
require "sinatra"
require "sequel"
require "sqlite3"

DB = Sequel.sqlite('kakei.sqlite3')

# todo: $BEPO?$5$l$F$$$kF|IU$N0lMw$r(Bview$B$KEO$9(B
get '/' do
  erb :index
end
# todo: URL$B$H9gCW$9$kF|IU$N%"%$%F%`$r(Bview$BEO$9(B
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
# refinement$B$G$&$^$/$d$l$=$&$J5$$,$9$k!#(B
def getUpdateParams(params)
  [params[:date] || "",params[:number] || "",params[:name] || "",params[:amount] || ""]
end
