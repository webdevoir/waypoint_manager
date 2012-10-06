# encoding: utf-8

require 'spec_helper'

describe WaypointNeighbourArea, :type => :model do
  it "create waypoint between two areas" do
    area_original = FactoryGirl.create(:area)
    area_neighbour = FactoryGirl.create(:area)
    area_original.should be_valid
    area_neighbour.should be_valid

    # create w.
    w = FactoryGirl.create(:waypoint, area: area_original)
    w.should be_valid

    # check and add other area as neighbour
    w.neighbour_areas.should be_kind_of(Array)
    w.neighbour_areas.should be_empty

    w.neighbour_areas << area_neighbour
    w.should be_valid
    w.save!
    
    # create another w. and add to neighbour area
    w_in_neighbour = FactoryGirl.create(:waypoint, area: area_neighbour)
    w_in_neighbour.should be_valid

    puts w.neighbour_areas.inspect
    puts w.neighbour_areas.first.waypoints.inspect
    puts w.neighbour_waypoints.inspect

  end
end