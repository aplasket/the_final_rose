require "rails_helper"

RSpec.describe "/bachelorettes/:id, bachelorette show page", type: :feature do
  let!(:hannah) { Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!")}
  let!(:peter) { hannah.contestants.create!(name: "Pilote Pete", age: 34, hometown: "Irving, TX")}
  let!(:taylor) { hannah.contestants.create!(name: "Taylor Swift", age: 31, hometown: "Nashville, TN")}

  let!(:kara) { Bachelorette.create!(name: "Kara Troll", season_number: 16, description: "The lamest season yet!")}
  let!(:joe) { kara.contestants.create!(name: "Joe Dirt", age: 37, hometown: "Smalls, TX")}

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
      expect(page).to_not have_content(kara.name)
      expect(page).to_not have_content(joe.name)
    end
  end
end