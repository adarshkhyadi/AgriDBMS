/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectiomz;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ADMIN
 */
public class connection1 {
    
    public static Connection getConnection(){
            Connection con = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/agridb","root","");
                
                
                
            }catch(Exception e){
                System.out.println(e.getMessage());
                
            }
            return con;
    }
}
