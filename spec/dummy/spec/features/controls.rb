# require 'spec_helper'

RSpec.feature "Solicitando novo cadastro de cliente" do


  scenario "show audit controls on footer" do
    visit products_path
    expect(page).to have_content "Exibir Logs de Alteração"
  end

end
