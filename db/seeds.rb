# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1=User.create(name: 'Suraj', email: 'suraj@example.com',password: '2022@example',password_confirmation: '2022@example')
project1=Project.create(name: 'Result')
feature1=Feature.create(Title:'Calculating Results' , Description:'Marks Count' , Category:'current' , project_id: 4)
task1=Task.ctreate(content:'Marks' , status:'Started' , feature_id: 4)