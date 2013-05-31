require_relative '../app/models/politician'


def politicians_by_state(state)
  senators = Politician.where(state: state).where(title: "Sen")
  senators.sort_by! {|rep| rep.lastname }
  senators.order{firstname}
  puts "Senators:"
  senators.each do |senator|
    puts "\t#{senator.firstname} #{senator.lastname} (#{senator.party})"
  end

  reps = Politician.where(state: state).where(title: "Rep")
  reps.sort_by! {|rep| rep.lastname }
  puts "Representatives:"
  reps.each do |rep|
    puts "\t#{rep.firstname} #{rep.lastname} (#{rep.party})"
  end
end

def percentage_by_gender(gender)
  total_senators = Politician.where(title: "Sen").where(in_office: 1)
  gender_senators = Politician.where(gender: gender[0].upcase).where(title: "Sen").where(in_office: 1)
  percentage_senators = (gender_senators.length.to_f / total_senators.length) * 100
  puts "#{gender} Senators: #{gender_senators.length} (#{percentage_senators.to_i}%)"
  
  total_reps = Politician.where(title: "Rep").where(in_office: 1)
  gender_reps = Politician.where(gender: gender[0].upcase).where(title: "Rep").where(in_office: 1)
  percentage_reps = (gender_reps.length.to_f / total_reps.length) * 100
  puts "#{gender} Representatives: #{gender_reps.length} (#{percentage_reps.to_i}%)"
end

def count_reps
  states = Politician.uniq.pluck(:state)
  most_politicians = []
  states.each do |state|
    reps = []
    reps <<  Politician.where(state: state).where(in_office: 1).where(title: "Rep")
    most_politicians << {state: state, num_reps: reps[0].length}
  end
  most_politicians.sort_by! { |state| state[:num_reps] }.reverse!
  most_politicians.each do |state|
    puts "#{state[:state]}: 2 Senators, #{state[:num_reps]} Representatives(s)"
  end
end

def find_members
  p num_senators = Politician.where(title: "Sen").count
  p num_reps     = Politician.where(title: "Rep").count
end

def delete_not_active
  Politician.delete_all("in_office = 0")
end




# politicians_by_state("CA")

# percentage_by_gender("Male")

# count_reps
delete_not_active
find_members