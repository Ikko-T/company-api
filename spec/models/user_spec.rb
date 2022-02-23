# require 'rails_helper'

# RSpec.describe User, type: :model do
#   describe 'validates' do
#     subject { user.valid? }

#     context 'first name' do
#       let(:user) { build(:user, first_name: "") }
#       it 'is empty' do
#         expect(subject).to eq false
#       end
#     end

#     context 'first name' do
#       let(:user) { build(:user, first_name: "q" * 51) }
#       it 'is too long' do
#         expect(subject).to eq false
#       end
#     end

#     context 'last name' do
#       let(:user) { build(:user, last_name: "") }
#       it 'is empty' do
#         expect(subject).to eq false
#       end
#     end

#     context 'last name' do
#       let(:user) { build(:user, last_name: "q" * 51) }
#       it 'is too long' do
#         expect(subject).to eq false
#       end
#     end

#     context 'email' do
#       let(:user) { build(:user, email: "") }
#       it 'is empty' do
#         expect(subject).to eq false
#       end
#     end

#     context 'email' do
#       let(:user) { build(:user, email: "q" * 256) }
#       it 'is too long' do
#         expect(subject).to eq false
#       end
#     end

#     context 'email' do
#       before { create(:user, email: "test@example.com") }
#       let(:user) { build(:user, email: "test@example.com") }
#       it 'is duplicate' do
#         expect(subject).to eq false
#       end
#     end

#       let(:user) { build(:user, email: Faker::Lorem.characters(number: 20)) }
#       it 'is only letters' do
#         expect(subject).to eq false
#       end
#     end
#   end
# end
