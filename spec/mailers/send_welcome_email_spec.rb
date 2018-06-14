require "rails_helper"

describe 'send welcome email', :type => :mailer do
  context "succesfull" do
    let(:user) { create(:user) }

    before do
      UserMailer.send_welcome_email(user).deliver_now
      @mail = ActionMailer::Base.deliveries.last
    end

    it "sends an email" do
      expect{ UserMailer.send_welcome_email(user).deliver_now}.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "renders the headers" do
      expect(@mail.subject).to eq("Welcome")
      expect(@mail.to).to include(user.email)
      expect(@mail.from).to include("customer_service@email.jonasarguelles.com")
    end

    it "renders the body" do
      expect(@mail.body.encoded).to include("Welcome to Renty")
    end

  end
end
