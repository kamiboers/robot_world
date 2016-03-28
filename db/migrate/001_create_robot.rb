require 'sequel'

  database = Sequel.sqlite('db/robot_world_test.sqlite3')
  database.create_table :robots do
    primary_key :id
    String      :name
    String      :city
    String      :state
    String      :birthdate
    String      :date_hired
    String      :department
    String      :avatar
  end

  database = Sequel.sqlite('db/robot_world_development.sqlite3')
  database.create_table :robots do
    primary_key :id
    String      :name
    String      :city
    String      :state
    String      :birthdate
    String      :date_hired
    String      :department
    String      :avatar
  end
