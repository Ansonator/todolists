# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

lines = [
  ['Carly Fiorina', 1954, 'female'],
  ['Donald Trump', 1946, 'male'],
  ['Ben Carson', 1951, 'male'],
  ['Hillary Clinton', 1947, 'female']
]

dueDate = Date.today + 1.year
lines.each do |line|

  names = line[0].split
  password = line[0].downcase.sub('\s', '')
  user = User.create!(username: names[1], password_digest: password)

  user.create_profile!(gender: line[2], birth_year: line[1], first_name: names[0], last_name: names[1])

  list = TodoList.create!(list_name: "list#{user.id}", list_due_date: dueDate)
  (1..5).each do |i|
    str = "#{user.id}:#{i}"
    list.todo_items << TodoItem.create!(title: "title:#{str}", description: "desc #{str}", due_date: dueDate, completed: false)
  end
  user.todo_lists = [list]

end
