/*Gage Gutmann
CPSC 321
HW10
This program creates and populates 3 sql files of different sizes with random data
*/

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;


public class genTest{
    public static void main(String[] args){
        
        //Go through three times, writing to three different files 
        for(int j = 1; j <=3; j++){
        
            int entries = 0;
            if(j == 1){
                entries = 10000;
            }else if(j == 2){
                entries = 100000;
            }else{
                entries = 1000000;
            }
            
            int startID = 1;
            int titleRotation = 1;

            String insert = "INSERT INTO Employee VALUES \n";

            //insert entries based on entry value
            for(int i = 0; i < entries - 1; i++){
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
            //startID = 1;
            //titleRotation = 1;


            //write to file based on entries value
            try (FileWriter writer = new FileWriter("hw10-data-" + entries + ".sql");
            BufferedWriter bw = new BufferedWriter(writer)) {

                bw.write(insert);

            } catch (IOException e) {
                System.err.format("IOException: %s%n", e);
            }
        }
    }
}