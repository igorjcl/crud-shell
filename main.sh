#!/bin/sh 

DATABASE=database.csv

createDatabase () {
  if [ ! -f "${DATABASE}" ]; then
    touch database.csv
  fi
}

openMenu () {
  echo "Menu"
  echo "1 - Cadastrar Aluno"
  echo "2 - Listar Alunos"
  echo "3 - Procurar Aluno por Matricula"
  echo "4 - Atualizar Aluno"
  echo "5 - Deletar Aluno"
  echo "0 - Sair"
}

createStudent () {
  echo ""
  echo "Criar Estudante"
  echo ""
  
  read -p "Nome: " name
  read -p "Idade: " age
  read -p "Matricula: " registration

  echo "$name, $age, $registration" >> $DATABASE
}

findStudentByRegistration () {
  echo ""
  echo "Procurar por Matricula"
  echo ""
  
  read -p "Informe a matricula: " reg

  while IFS=", " read -r name age registration
  do
    if [ "$reg" -eq "$registration" ]; then
      echo "Nome: $name"
      echo "Idade: $age"
      echo "Matricula: $registration"
      echo ""
    fi
  done < $DATABASE
}

listStudents () {
  echo ""
  echo "Listar Estudantes"
  echo ""

  while IFS=", " read -r name age registration
  do
    echo "Nome: $name"
    echo "Idade: $age"
    echo "Matricula: $registration"
    echo ""
  done < $DATABASE
}

updateStudent () {
  echo ""
  echo "Atualizar Estudante"
  echo ""

  read -p "Informe a matricula: " reg

  while IFS=", " read -r name age registration
  do
    echo "Nome: $name"
    echo "Idade: $age"
    echo "Matricula: $registration"
    echo ""
  done < $DATABASE
}

deleteStudent () {
  echo ""
  echo "Remover Estudante"
  echo ""
}

main () {
  createDatabase

  while :; do
    openMenu
    read -p "Informe uma opção: " opcao

    if [ $opcao = "0" ]; then
      exit 0
    fi

    case "$opcao" in
      1)
        createStudent
      ;;

      2)
        listStudents
      ;;

      3)
        findStudentByRegistration
      ;;

      4)
        updateStudent
      ;;

      5)
        deleteStudent
      ;;
      
      *)
        continue
      ;;
    esac
  done
}

main
