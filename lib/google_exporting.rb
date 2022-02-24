module GoogleExporting
  def self.write_result(result, output_path)
    File.open(output_path, 'w') do |file|
      file.puts result.project_assignments.length
      result.project_assignments.each do |assignment|
        file.puts assignment.name
        file.puts assignment.people.map(&:name).join(" ")
      end
    end
  end
end
