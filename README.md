# CAMAAR
Sistema para avaliação de atividades acadêmicas remotas do CIC

    João Pedro Felicio Pereira - 202065897
    Erick Hideki Taira - 222011525
    Davi de Araujo Garcez Bueno - 211060586
    Guilherme de Melo Carozo - 211020885
    
Caso seja a primeira vez utilizando é necessário criar um Admin e dar um bundle install.
Abra o terminal do projeto.
Insira "bundle install".
Insira "rails db:migrate"
Abra o console do rails com "rails console" no terminal do projeto.
Insira "User.create(matricula: 12345678, email:"admin@gmail.com", nome:"admin", role:"admin", password: "password123", password_confirmation: "password123")" para criar um User.
Insira "Departamento.create(nome: "Dept de Ciências da Computação")" para criar um Departamento.
Insira "Coordenador.create(user_id: User.find_by(matricula: 12345678).id, departamento_id:  Departamento.find_by(nome: "Dept de Ciências da Computação").id)" para associar o User com o Departamento criado.
Inicie com "rails s"
A página estará no seu navegador no "http://localhost:3000/"
