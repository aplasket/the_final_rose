require "rails_helper"

RSpec.describe "bachlorettes/:id/contestants, contestant index page", type: :feature do
  let!(:hannah) { Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!")}
  let!(:peter) { hannah.contestants.create!(name: "Pilote Pete", age: 34, hometown: "Irving, TX")}
  let!(:taylor) { hannah.contestants.create!(name: "Taylor Swift", age: 31, hometown: "Nashville, TN")}

  let!(:kara) { Bachelorette.create!(name: "Kara Troll", season_number: 16, description: "The lamest season yet!")}
  let!(:joe) { kara.contestants.create!(name: "Joe Dirt", age: 37, hometown: "Smalls, TX")}

  describe "as a visitor on the contestant index page" do
    #userstory 2
    it "shows all contestants for that bachelorette" do
      visit bachelorette_contestants_path(hannah)

      expect(page).to have_content("#{hannah.name}'s Contestants:")

      within "#contestants-#{peter.id}" do
        expect(page).to have_link("#{peter.name}")
        expect(page).to have_content("Age: #{peter.age}")
        expect(page).to have_content("Hometown: #{peter.hometown}")
      end

      within "#contestants-#{taylor.id}" do
        expect(page).to have_link("#{taylor.name}")
        expect(page).to have_content("Age: #{taylor.age}")
        expect(page).to have_content("Hometown: #{taylor.hometown}")
      end

      expect(page).to_not have_content(kara.name)
      expect(page).to_not have_content("Name: #{joe.name}, Age: #{joe.age}, Hometown: #{joe.hometown}")
    end

    it "each contestants name is a link to their show page" do
      visit bachelorette_contestants_path(hannah)

      within "#contestants-#{peter.id}" do
        expect(page).to have_link("#{peter.name}")
        click_link "#{peter.name}"
      end

      expect(current_path).to eq(bachelorette_contestant_path(hannah, peter))
    end
  end
end