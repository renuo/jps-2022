module GoogleExporting
  def self.write_result(result, output_path)
    File.open(output_path, 'w') do |file|
      file.puts result.sum
      # file.puts valid_intersections.length
      # valid_intersections.each do |intersection|
      #   file.puts intersection.id
      #   file.puts intersection.schedule_entries.length
      #   intersection.schedule_entries.each do |entry|
      #     file.puts "#{entry.street_name} #{entry.duration}"
      #   end
      # end
    end
  end
end
