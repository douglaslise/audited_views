require 'spec_helper'

RSpec.feature "controls" do

  let(:user) { User.create(email: "user@domain.com") }
  let!(:product) do
    Audited.audit_class.as_user(user) do
      Product.create(sku: "001", title: "Smartphone", price: "450", active: true, description: "Smartphone ABC")
    end
  end

  before do
  end

  scenario "show audit controls on footer" do
    visit product_path(product)
    expect(page).to have_content "Created at #{I18n.localize(Time.zone.now, format: :short)} by #{user.email}"
    expect(page).to have_content "Show Change Log"
  end

  scenario "show change lng when requested" do
    visit product_path(product)
    click_link "Show Change Log"
    save_page
    expect(page).to have_content("x")
  end

end
