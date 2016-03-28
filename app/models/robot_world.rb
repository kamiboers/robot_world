class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
    populate_fakes
  end

  def dataset
    database.from(:robots)
  end

  def create(robot)
    dataset.insert(robot)
  end

  # def fake_robot
  #   birthdate = Faker::Date.backward(1000)
  #   robot =  {
  #     "name"       => Faker::Superhero.name,
  #     "city"       => Faker::Address.city,
  #     "state"      => Faker::Address.state,
  #     "avatar"     => Faker::Avatar.image,
  #     "birthdate"  => birthdate,
  #     "date_hired" => Faker::Time.between(birthdate, DateTime.now),
  #     "department" => Faker::Company.profession,
  #     "id"         => rand(99999)
  #   }
  #   create(robot)
  # end

  def all
    dataset.all.to_a.map { |data| Robot.new(data) }
  end

  def find(id)
    robot_params = dataset.where(:id => id).to_a.first
    Robot.new(robot_params)
  end

  def update(id, robot)
    dataset.where(:id => id).update(robot)
  end

  def destroy(id)
    dataset.where(:id => id).delete
  end

  def destroy_all
    dataset.delete
  end

  def populate_fakes
    CSV.foreach(fake_data.csv) do |row|
      dataset.insert(row)
    end
  end

end
