require_relative './world'

module GoogleImporting
  DATASET_NAMES = %w[a b c d e f].freeze

  def self.build_world(dataset_name)
    lines = File.read("data/in/#{dataset_name}.txt").split(/\n/)
    # first_line = lines[0].split
    # simulation_time = first_line[0].to_i
    # intersections_count = first_line[1].to_i
    # streets_count = first_line[2].to_i
    # cars_count = first_line[3].to_i
    # bonus_points = first_line[4].to_i
    # intersections = {}
    # streets_hash = {}
    # streets_count.times.map do |i|
    #   street_line = lines[i + 1].split
    #   start_intersection_id = street_line[0]
    #   end_intersection_id = street_line[1]
    #   street_name = street_line[2]
    #   street_length = street_line[3]
    #   street = Street.new(start: start_intersection_id, end: end_intersection_id, name: street_name, length: street_length, cars: [])
    #   streets_hash[street_name] = street
    #   intersections[start_intersection_id] ||= Intersection.new(id: start_intersection_id, out_streets: [], in_streets: [], schedule_entries: [])
    #   intersections[start_intersection_id].out_streets << street
    #   intersections[end_intersection_id] ||= Intersection.new(id: end_intersection_id, out_streets: [], in_streets: [], schedule_entries: [])
    #   intersections[end_intersection_id].in_streets << street
    # end
    # cars = cars_count.times.map do |i|
    #   car_line = lines[i + 1 + streets_count].split
    #   street_names = car_line[1..-1]
    #   car = Car.new(streets: street_names.map { |street_name| streets_hash[street_name]})
    #   street_names.each do |street_name|
    #     streets_hash[street_name].cars << car
    #   end
    #   car
    # end

    numbers = lines[0].split(' ').map(&:to_i)
    World.new(numbers: numbers)
  end
end
