module ItemsHelper
  
  # 円マーク値段
  def enmark_item_price(item)
    "¥#{item.price}"  
  end

  #  郵便番号にハイフン
  def user_post_code(address)
     address.postal_code.to_s.insert(3, "-")
  end

  # 都道府県から番地をまとめ、ビル名があれば表示
  def user_address_info(address)
    if address.building.blank?
      address.prefecture + address.city + address.block
    else
     str = "#{address.prefecture}#{address.city}#{address.block}\n#{address.building}"
      str.chomp
    end
  end

  #ユーザーのフルネーム
  def user_full_name(address)
    address.send_first_name+address.send_name
  end
  
end
