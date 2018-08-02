# coding: utf-8
module ServeHelper
  # refinementでうまくやれそうな気がする。
  def getUpdateParams(params)
    [params[:date] || "",params[:number] || "",params[:name] || "",params[:amount] || ""]
  end
end
