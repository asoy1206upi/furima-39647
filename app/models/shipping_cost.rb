class ShippingCost < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: '送料込み(出品者負担)' }, { id: 3, name: '着払い(購入者負担)' },
    # 他のデータも同様に記述
  ]
end