require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'contentとimageが存在していれば保存可能' do
      expect(@message).to be_valid
    end

    it 'contentが空でも保存できるコト' do
      @message.content = ''
      expect(@message).to be_valid
    end

    it 'imageが空でも保存できるコト' do
      @message.image = nil
      expect(@message).to be_valid
    end

    it 'contentとimageどちらも空だと保存できない' do
      @message.content = ''
      @message.image = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end

    it 'roomが紐づいてないと保存できない' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('Room must exist')
    end

    it 'userが紐づいていないと保存できない' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('User must exist')
    end
    
  end
end
