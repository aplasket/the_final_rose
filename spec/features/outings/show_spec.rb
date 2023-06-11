require "rails_helper"

RSpec.describe "/outings/:id, outings show page", type: :feature do
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
  let!(:co_5) { ContestantOuting.create!(contestant_id: joe.id, outing_id: helicopter_ride.id)}

  describe "as a visitor on the outings show page" do
    #userstory 4
    it "shows the outing's name, location, and date" do
      visit outing_path(hotsprings)

      expect(page).to have_content("#{hotsprings.name}")
      expect(page).to have_content("#{hotsprings.location}")
      expect(page).to have_content("#{hotsprings.date}")
      expect(page).to_not have_content("#{kickball.name}")
    end

    it "shows a total count of contestants on this outing" do
      visit outing_path(hotsprings)

      expect(page).to have_content("Count of Contestants: #{hotsprings.count_contestants}")
    end

    it "shows a list of names of contestants on this outing" do
      visit outing_path(hotsprings)
      expect(page).to have_content("Contestants:")

      expect(page).to have_content("#{peter.name}")
      expect(page).to have_content("#{taylor.name}")
      expect(page).to have_content("#{joe.name}")

      visit outing_path(kickball)
      expect(page).to have_content("Contestants:")

      expect(page).to have_content("#{peter.name}")
      expect(page).to_not have_content("#{taylor.name}")
      expect(page).to_not have_content("#{joe.name}")
    end
  end
end