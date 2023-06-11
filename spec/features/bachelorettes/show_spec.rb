require "rails_helper"

RSpec.describe "/bachelorettes/:id, bachelorette show page", type: :feature do
  let!(:hannah) { Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!")}
  let!(:kara) { Bachelorette.create!(name: "Kara Troll", season_number: 16, description: "The lamest season yet!")}

  describe "as a visitor on the bachelorette show page" do
    #user story 1
    it "see that bachelorette's name, season number, and description" do
      visit bachelorette_path(hannah)
      expect(page).to have_content(hannah.name)
      expect(page).to have_content("Season #{hannah.season_number} - #{hannah.description}")
      expect(page).to_not have_content(kara.name)
      expect(page).to_not have_content("Season #{kara.season_number} - #{kara.description}")
    end

    it "shows a link to see that bachelorette's contestants" do
      visit bachelorette_path(hannah)

      expect(page).to have_link("#{hannah.name}'s Contestants")

      click_link "#{hannah.name}'s Contestants"

      expect(current_path).to eq(bachelorette_contestants_path(hannah))
    end
  end
end