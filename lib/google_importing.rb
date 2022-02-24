require_relative './world'

module GoogleImporting
  DATASET_NAMES = %w[a b c d e f].freeze

  def self.build_world(dataset_name)
    lines = File.read("data/in/#{dataset_name}.txt").split(/\n/)

    contributor_count, project_count = lines[0].split
    i = 1

    contributors = []
    contributor_count.to_i.times do |c|
      contributor_name, contributor_skill_count = lines[i].split
      contributor = Contributor.new(name: contributor_name)
      i += 1

      contributor_skill_count.to_i.times do |sc|
        skill_name, skill_level = lines[i].split
        contributor.skills << Skill.new(name: skill_name, level: skill_level.to_i)
        i += 1
      end

      contributors << contributor
    end

    projects = []
    project_count.to_i.times do |p|
      project_name, duration_days, score, best_before, role_count = lines[i].split
      project = Project.new(name: project_name, duration_days: duration_days.to_i, score: score.to_i)
      i += 1

      role_count.to_i.times do |rc|
        skill_name, skill_level = lines[i].split
        project.skills << Skill.new(name: skill_name, level: skill_level.to_i)
        i += 1
      end

      projects << project
    end

    world = World.new(contributors: contributors, projects: projects)
    puts "read #{world.contributors.length} contributors and #{world.projects.length} projects"

    world
  end
end
