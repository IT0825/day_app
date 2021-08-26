require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    @report = FactoryBot.build(:report)
  end

  describe '日報作成' do
    context '日報作成できるとき' do
      it '必要情報を適切に入力すると保存される' do
        expect(@report).to be_valid
      end
    end

    context '日報作成できないとき' do
      it '題名の記入がないと作成できない' do
        @report.title = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("題名を入力してください")
      end

      it '題名の文字数は３０文字以上だと作成できない' do
        @report.title = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @report.valid?
        expect(@report.errors.full_messages).to include("題名は30文字以内で入力してください")
      end

      it '本文の記入がないと作成できない' do
        @report.text = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("本文を入力してください")
      end

      it 'userが紐付いていないと保存できないこと' do
        @report.user = nil
        @report.valid?
        expect(@report.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
