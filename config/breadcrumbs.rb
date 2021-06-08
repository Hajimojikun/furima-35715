crumb :root do
  link "Home", root_path
end

crumb :user_new do
  link "新規登録ページ", new_user_registration_path
  parent :root
end

crumb :user_sign_in do
  link "ログインページ", new_user_session_path
  parent :root
end

crumb :put_item do
  link "商品出品ページ", new_item_path
  parent :root
end


crumb :show_item do |item|
  link "#{item.name}の詳細ページ", item_path(item)
  parent :root
end

crumb :edit_item do |item|
  link "#{item.name}の商品編集ページ", edit_item_path(item)
  parent :show_item, item
end

crumb :buy_item do |item|
  link "#{item.name}の購入ページ", item_buy_items_path
  parent :show_item, item
end