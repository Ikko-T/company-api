require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "#index" do
    before { create_list(:user, 3) }
    subject { get(api_v1_users_path) }

    it "returns users" do
      subject
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json.size).to eq 3
      expect(json[0].keys).to include("id", "first_name", "last_name", "age", "company", "email", "phone_number", "twitter", "message", "gender")
      expect(json[0]["id"]).to match(User.first.id)
      expect(json[0]["first_name"]).to match(User.first.first_name)
      expect(json[0]["last_name"]).to match(User.first.last_name)
      expect(json[0]["age"]).to match(User.first.age)
      expect(json[0]["company"]).to match(User.first.company)
      expect(json[0]["email"]).to match(User.first.email)
      expect(json[0]["phone_number"]).to match(User.first.phone_number)
      expect(json[0]["twitter"]).to match(User.first.twitter)
      expect(json[0]["message"]).to match(User.first.message)
      expect(json[0]["gender"]).to match(User.first.gender)
    end
  end

  describe "#show" do
    subject { get(api_v1_user_path(user_id)) }

    context "when a user exists" do
      let(:user) { create(:user) }
      let(:user_id) { user.id }

      it "returns a user" do
        subject
        json = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(json["first_name"]).to eq user.first_name
        expect(json["last_name"]).to eq user.last_name
        expect(json["age"]).to eq user.age
        expect(json["company"]).to eq user.company
        expect(json["email"]).to eq user.email
        expect(json["phone_number"]).to eq user.phone_number
        expect(json["twitter"]).to eq user.twitter
        expect(json["message"]).to eq user.message
        expect(json["gender"]).to eq user.gender
      end
    end

    context "when a user does not exist" do
      let(:user_id) { 0 }

      it "occurs an error" do
        expect{ subject }.to raise_error(ActiveRecord::RecordNotFound)
        # binding.pry
      end
    end
  end

  describe "#create" do
    subject { post(api_v1_users_path, params: user_params) }
    let(:user_params) { { user: attributes_for(:user) } }

    it "can save" do
      expect{ subject }.to change { User.count }.by(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "#update" do
    subject { patch(api_v1_user_path(user_id), params: user_params) }
    let(:user) { create(:user) }
    let(:user_id) { user.id }
    let(:user_params) { { user: attributes_for(:user) } }
    it "can update" do
      new_user = user_params[:user]
      expect{ subject }
        .to change { user.reload.first_name }
        .from(user.first_name).to(new_user[:first_name])
        .and change { user.reload.last_name }
        .from(user.last_name).to(new_user[:last_name])
        .and change { user.reload.age }
        .from(user.age).to(new_user[:age])
        .and change { user.reload.company }
        .from(user.company).to(new_user[:company])
        .and change { user.reload.email }
        .from(user.email).to(new_user[:email])
        .and change { user.reload.phone_number }
        .from(user.phone_number).to(new_user[:phone_number])
        .and change { user.reload.twitter }
        .from(user.twitter).to(new_user[:twitter])
        .and change { user.reload.message }
        .from(user.message).to(new_user[:message])
        .and change { user.reload.gender }
        .from(user.gender).to(new_user[:gender])
      expect(response).to have_http_status(200)
    end
  end

  describe "#destroy" do
    subject { delete(api_v1_user_path(user.id)) }
    let!(:user) { create(:user) }

    it "can delete" do
      expect{ subject }.to change { User.count }.by(-1)
      expect(response).to have_http_status(204)
    end

  end

end
