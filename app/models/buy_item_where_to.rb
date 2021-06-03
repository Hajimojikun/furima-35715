class BuyItemWhereTo

    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code, :city, :street, :name_of_the_building, :prefecture_id, :phone_number

    with_options presence: true do
      validates :user_id
      validates :item_id
      validates :post_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :city
      validates :street
      validates :phone_number,  format: {with: /\A\d{11}\z/}
    end
      validates :prefecture_id, numericality:{other_than: 1, message: "can't be blank"}
    
    def save
      buy_item = BuyItem.create(user_id: user_id, item_id: item_id)
      WhereTo.create(post_code: post_code, city: city, state: street, name_of_the_building: name_of_the_building, prefecture_id: prefecture_id,
         phone_number: phone_number, buy_item_id: buy_item.id)
    end
end