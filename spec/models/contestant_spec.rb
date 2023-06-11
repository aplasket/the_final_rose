require "rails_helper"

RSpec.describe Contestant, type: :model do
  describe "relationships" do
    it { should belong_to :bachelorette }
    it { should have_many :contestant_outings }
    it { should have_many(:outings).through(:contestant_outings) }
  end

  # describe "instance methods" do
  #   let!(:hannah) { Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!")}
  #   let!(:peter) { hannah.contestants.create!(name: "Pilote Pete", age: 34, hometown: "Irving, TX")}
  #   let!(:taylor) { hannah.contestants.create!(name: "Taylor Swift", age: 31, hometown: "Nashville, TN")}

  #   let!(:kara) { Bachelorette.create!(name: "Kara Troll", season_number: 16, description: "The lamest season yet!")}
  #   let!(:joe) { kara.contestants.create!(name: "Joe Dirt", age: 37, hometown: "Smalls, TX")}

  #   let!(:kickball) { Outing.create!(name: "Kickball", location: "Denver", date: "09/01/19")}
  #   let!(:helicopter_ride) { Outing.create!(name: "Helicopter Ride", location: "Bali", date: "09/12/19")}
  #   let!(:hotsprings) { Outing.create!(name: "Hot Springs", location: "Iceland", date: "09/19/19")}

  #   let!(:co_1) { ContestantOuting.create!(contestant_id: peter.id, outing_id: kickball.id)}
  #   let!(:co_2) { ContestantOuting.create!(contestant_id: peter.id, outing_id: hotsprings.id)}
  #   let!(:co_3) { ContestantOuting.create!(contestant_id: taylor.id, outing_id: hotsprings.id)}
  #   let!(:co_4) { ContestantOuting.create!(contestant_id: joe.id, outing_id: hotsprings.id)}
  # end
end
