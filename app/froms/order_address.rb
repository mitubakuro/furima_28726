# class OrderAddress
#   include ActiveModel::Model
#   attr_accessor :name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price

#   def save
#     # ユーザーの情報を保存し、「user」という変数に入れている
#     order = Order.create(item_id: params[:item_id], user_id: current_user.id)
#     # 住所の情報を保存
#     Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, build_number: build_number,order_id: order.id)
#   end

# end
# いったんクレカ決済だけで動作させて、問題なければFormオブジェクトを実装する