#  This file should contain all the record creation needed to seed the database with its default values.
#  The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

#  Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# 10.times do

# 	tipo_instituicao = %w[Creche Escola Universidade].sample

# 	Instituicao.create({
# 							nome: "#{tipo_instituicao} #{Faker::University.name}",
# 							cnpj: Faker::Number.number(digits: 14),
# 							tipo: tipo_instituicao
# 								})
# end


# 5.times do

#   genero = %w[M F].sample
#   forma_pagamento = %w[Boleto Cartão].sample
#   Aluno.create({
#                  nome: Faker::Name.name_with_middle,
#                  cpf: Faker::Number.number(digits: 11),
#                  data_nascimento: Faker::Date.birthday(),
#                  telefone: Faker::Number.number(digits: 11),
#                  genero: genero,
#                  meio_pagamento: forma_pagamento
#                })
# end