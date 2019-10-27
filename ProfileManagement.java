package profile;

import main.MainPage;
import student.Student;
import user.User;

import java.util.ArrayList;
import java.util.Scanner;

public class ProfileManagement {
    public static Scanner entry = new Scanner(System.in);
    
    public static void accountOptions(int counter, int choice, Student s, ArrayList<User> users){
    	s = new Student(); //Inicia uma nova instacia de estudante.
    	
        if (choice == 1){
            System.out.print("CPF: ");
            s.setCpf(entry.next());
            System.out.print("Username: ");
            s.setUsername(entry.next());
            System.out.print("Password: ");
            s.setPassword(entry.next());

            users.add(s);
            //counter++;

            System.out.println("You succesfully created an account.");

        }
        if (choice == 3){
            System.out.print("CPF: ");
            String cpf = entry.next();
            System.out.print("Password: ");
            String password = entry.next();

            searchUsers(cpf,password,s,users);
        }

    }

    public static void searchUsers(String cpf, String password, Student s, ArrayList<User> users){

        for (int i = 0; i < 4; i++) {
        	
            System.out.println(users.get(i).getCpf());
            System.out.println(users.get(i).getPassword());
            
            if(users.get(i) instanceof User) { //Verifico se o usuario de indice atual não é NULL, para evitar erro de ponteiro.
            	
            	 //Caso agt n verifique, ele pode entrar aqui e tentar pegar um "cpf" que ainda não existe na memoria
            	  if (users.get(i).getCpf().equalsIgnoreCase(cpf) && users.get(i).getPassword().equalsIgnoreCase(password))
                      System.out.println("\nLogin was done.\n");
            	  
            	  System.out.println(users.size()); //Criei pra verificar o tamanho atual, pra ver se tava adicionando bonitinho.
            	  printar(users);//Printa cpf dos usuarios presentes
            	  
              return;
            }
          
        }
           System.out.println("\nLogin was not done.\n");
           printar(users);
    }
    
    public static void printar(ArrayList<User> user) {
    	System.out.println(user.size());
    	for(User  c : user) {//Esse tipo de for, vai até o final do array, sem precisar do indice.
    		  System.out.println(c.getCpf());
    		}
    }

}
