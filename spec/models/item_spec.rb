require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
      @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    
    it '商品名が必須であること' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    
    it '商品の説明が必須であること' do
      @item.concept = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Concept can't be blank")
    end
    
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    
    it '商品の状態についての情報が必須であること' do
      @item.item_condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")  
    end
    
    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    
    it '発送元の地域についての情報が必須であること' do
      @item.ship_form_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship form can't be blank")
    end
    
    it '発送までの日数についての情報が必須であること' do
      @item.until_ship_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Until ship day can't be blank")
    end
    
    it '販売価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    
    it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    
    it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = "１２３"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price には半角数字を使用してください")
    end
  end
end