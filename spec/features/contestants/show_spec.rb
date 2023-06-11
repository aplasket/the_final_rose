require "rails_helper"

RSpec.describe "bachelorettes/:id/contestants/:id, contestant show page", type: :feature do
  let!(:hannah) { Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!")}
  let!(:peter) { hannah.contestants.create!(name: "Pilote Pete", age: 34, hometown: "Irving, TX")}
  let!(:taylor) { hannah.contestants.create!(name: "Taylor Swift", age: 31, hometown: "Nashville, TN")}

  let!(:kara) { Bachelorette.create!(name: "Kara Troll", season_number: 16, description: "The lamest season yet!")}
  let!(:joe) { kara.contestants.create!(name: "Joe Dirt", age: 37, hometown: "Smalls, TX")}

  let!(:kickball) { Outing.create!(name: "Kickball", location: "Denver", date: "09/01/19")}
  let!(:helicopter_ride) { Outing.create!(name: "Helicopter Ride", location: "Bali", date: "09/12/19")}
  let!(:hotsprings) { Outing.create!(name: "Hot Springs", location: "Iceland", date: "09/19/19")}

  let!(:co_1) { ContestantOuting.create!(contestant_id: peter.id, outing_id: kickball.id)}
  let!(:co_2) { ContestantOuting.create!(contestant_id: peter.id, outing_id: hotsprings.id)}
  let!(:co_3) { ContestantOuting.create!(contestant_id: taylor.id, outing_id: hotsprings.id)}
  let!(:co_4) { ContestantOuting.create!(contestant_id: joe.id, outing_id: hotsprings.id)}

  describe "as a visitor on the contestant show page" do
    #userstory 3
    it "shows the contestant's name, season number, and season description" do
      visit bachelorette_contestant_path(hannah, peter)

      expect(page).to have_content("#{peter.name}")
      expect(page).to have_content("Season #{hannah.season_number} - #{hannah.description}")
    end

    it "displays name of outings the contestant has been on" do
      visit bachelorette_contestant_path(hannah, peter)

      expect(page).to have_content("Outings:")
      expect(page).to have_link("#{kickball.name}")
      expect(page).to have_link("#{hotsprings.name}")
    end

    it "each outing name is a link to that outings show page" do
      visit bachelorette_contestant_path(hannah, peter)
      expect(page).to have_link("#{kickball.name}")
      click_link "#{kickball.name}"
      expect(current_path).to eq(outing_path(kickball))
    end
  end
end