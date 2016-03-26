require_relative '../spec_helper'

describe 'open index', type: :feature do

  xit 'can see content', js: true do
    visit '/public/index.html'

    expect(page).to have_content("Starfighter Heavy")
  end
end
