require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
  user = FactoryBot.create(:user)
  item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
    sleep 1    
  end
  
  describe '商品購入' do
    context '購入ができる時' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@purchase_form).to be_valid
      end

      it "建物名がなくても購入ができること" do
        @purchase_form.building_name = ''
        expect(@purchase_form).to be_valid
      end
    end

    context '購入できない時' do
      it '郵便番号が必須であること' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県が必須であること' do
        @purchase_form.ship_form_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Ship form can't be blank")
      end

      it '市区町村が必須であること' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @purchase_form.house_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("House number can't be blank")
      end
      
      it '電話番号が必須であること' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '郵便番号の保存にはハイフンが必要であること（123-4567となる）' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '電話番号は11桁以内の数値のみ保存可能なこと（09012345678となる）'do
        @purchase_form.phone_number = '0901234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is only numbers within 11")
      end

      it "tokenが空では登録できないこと" do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end

    
      it "ship_form_idが1だと購入できない" do
        @purchase_form.ship_form_id = '1'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Ship form can't be blank")
      end

      it "電話番号は英数混合では登録できないこと" do
        @purchase_form.phone_number = '090abcdefgh'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is only numbers within 11")
      end

      it "userが紐付いていなければ登録できない" do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end

      it "商品が紐付いていなければ登録できない" do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end  
end