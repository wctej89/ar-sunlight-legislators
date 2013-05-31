require 'csv'
require_relative '../app/models/politician'

class SunlightLegislatorsImporter
  def self.import(filename)
    atrribute_array = Politician.columns.map(&:name)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      attribute_hash = Hash.new
      row.each do |field, value|
         attribute_hash[field.to_sym]= value  if atrribute_array.include?(field)
      end
      Politician.create!(attribute_hash)
    end
  end
end

# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
