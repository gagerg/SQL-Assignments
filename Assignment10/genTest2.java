import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;


public class genTest2{
    public static void main(String[] args){
        

            
            int startID = 1;
            int titleRotation = 1;

            String insert = "INSERT INTO Employee VALUES \n";

            //insert entries based on entry value
            for(int i = 0; i < 9999; i++){
                Random r = new Random();
                int number = r.nextInt(150000 - 12000) + 12000;
                if(titleRotation ==1){
                    insert += "(" + startID + ", " + number + ", " + "\"engineer\"), \n"; 
                    startID++;
                    titleRotation++;

                }else if(titleRotation == 2){
                    insert += "(" + startID + ", " + number + ", " + "\"manager\"), \n"; 
                    startID++;
                    titleRotation++;
                }else if(titleRotation == 3){
                    insert += "(" + startID + ", " + number + ", " + "\"salesperson\"), \n"; 
                    startID++;
                    titleRotation++;
                }else{
                    insert += "(" + startID + ", " + number + ", " + "\"administrator\"), \n"; 
                    startID++;
                    titleRotation = 1;
                }
            }

            //Set the last entry, and reset the values
            Random r = new Random();
            int number2 = r.nextInt(150000 - 12000) + 12000;
            insert += "(" + startID + ", " + number2 + ", " + "\"administrator\"); \n"; 
            


            //write to file based on entries value
            try (FileWriter writer = new FileWriter("hw10-data-10000.sql");
            BufferedWriter bw = new BufferedWriter(writer)) {

                bw.write(insert);

            } catch (IOException e) {
                System.err.format("IOException: %s%n", e);
            }

            startID = 1;
            titleRotation = 1;
            insert = "INSERT INTO Employee VALUES \n";

            //insert entries based on entry value
            for(int i = 0; i < 99999; i++){
                Random r2 = new Random();
                int number3 = r2.nextInt(150000 - 12000) + 12000;
                if(titleRotation ==1){
                    insert += "(" + startID + ", " + number3 + ", " + "\"engineer\"), \n"; 
                    startID++;
                    titleRotation++;

                }else if(titleRotation == 2){
                    insert += "(" + startID + ", " + number3 + ", " + "\"manager\"), \n"; 
                    startID++;
                    titleRotation++;
                }else if(titleRotation == 3){
                    insert += "(" + startID + ", " + number3 + ", " + "\"salesperson\"), \n"; 
                    startID++;
                    titleRotation++;
                }else{
                    insert += "(" + startID + ", " + number3 + ", " + "\"administrator\"), \n"; 
                    startID++;
                    titleRotation = 1;
                }
            }

            //Set the last entry, and reset the values
            Random r3 = new Random();
            int number4 = r3.nextInt(150000 - 12000) + 12000;
            insert += "(" + startID + ", " + number4 + ", " + "\"administrator\"); \n"; 
            

            //write to file based on entries value
            try (FileWriter writer2 = new FileWriter("hw10-data-100000.sql");
            BufferedWriter bw2 = new BufferedWriter(writer2)) {

                bw2.write(insert);

            } catch (IOException e) {
                System.err.format("IOException: %s%n", e);
            }

            startID = 1;
            titleRotation = 1;
            insert = "INSERT INTO Employee VALUES \n";

            //insert entries based on entry value
            for(int i = 0; i < 999999; i++){
                Random r4 = new Random();
                int number5 = r4.nextInt(150000 - 12000) + 12000;
                if(titleRotation ==1){
                    insert += "(" + startID + ", " + number5 + ", " + "\"engineer\"), \n"; 
                    startID++;
                    titleRotation++;

                }else if(titleRotation == 2){
                    insert += "(" + startID + ", " + number5 + ", " + "\"manager\"), \n"; 
                    startID++;
                    titleRotation++;
                }else if(titleRotation == 3){
                    insert += "(" + startID + ", " + number5 + ", " + "\"salesperson\"), \n"; 
                    startID++;
                    titleRotation++;
                }else{
                    insert += "(" + startID + ", " + number5 + ", " + "\"administrator\"), \n"; 
                    startID++;
                    titleRotation = 1;
                }
            }

            //Set the last entry, and reset the values
            Random r5 = new Random();
            int number6 = r5.nextInt(150000 - 12000) + 12000;
            insert += "(" + startID + ", " + number6 + ", " + "\"administrator\"); \n"; 
            

            //write to file based on entries value
            try (FileWriter writer3 = new FileWriter("hw10-data-1000000.sql");
            BufferedWriter bw3 = new BufferedWriter(writer3)) {

                bw3.write(insert);

            } catch (IOException e) {
                System.err.format("IOException: %s%n", e);
            }



        
    }
}