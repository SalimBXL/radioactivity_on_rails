# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clients = Client.create([
        { name: '- - -' }, 
        { name: 'Bordet'}
    ])

tracers = Tracer.create([
        { name: 'FDG', molecule: 'F18', halflife: '109.77', color: 'green'},
        { name: 'MET', molecule: 'C11', halflife: '20.38', color: 'yellow'}
    ])

