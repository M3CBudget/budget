require 'rails_helper'

RSpec.describe Item, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:category) { Category.new name: 'Lebensmittel', active: true}
  let(:item) { Item.new name: 'milch', price: '0.99', category_id: nil}

  context 'needs a Category' do
    it 'is not valid without a category' do
      expect(item).to_not be_valid
    end

    it 'is valid with category' do
      item.category_id << category
      expect(item).to be_valid
    end
  end
end
