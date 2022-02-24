module GoogleExporting
  def self.write_result(result, output_path)
    puts "Write #{result.project_assignments.length} project assignments"

    assignments = result.project_assignments.select { |a| a.contributors.any? }

    File.open(output_path, 'w') do |file|
      file.puts assignments.length
      assignments.each do |assignment|
        file.puts assignment.project.name
        file.puts assignment.contributors.map(&:name).join(" ")
      end
    end
  end
end
