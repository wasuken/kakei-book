# coding: utf-8
module ServeHelper
  # refinementでうまくやれそうな気がする。
  def getUpdateParams(params)
    [
      params[:date]   || "",
      params[:name]   || "",
      params[:amount] || "",
      params[:buy_id] || ""
    ]
  end
end
