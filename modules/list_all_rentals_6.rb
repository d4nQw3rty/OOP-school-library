module ListAllRentals
  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    file = File.read('rentals.json')
    data = JSON.parse(file)

    data['rentals']

    data['rentals'].select do |rental|
      if rental['person']['id'] == id
        puts "Date: #{rental['date']}, Book '#{rental['book']['title']}' by #{rental['book']['author']}"
      end
    end
  end
end
