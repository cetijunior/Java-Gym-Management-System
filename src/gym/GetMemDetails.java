/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gym;

import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;


public class GetMemDetails   {
Connection conn = new DBConnection().connect();
String [] results = new String[14];
    
private static String name, memId ,contact,address,registeredBy,registeredOn;
private static String NIC, Email, Gender , Height , Weight , BMI , Remarks , LastUpdated;


    public String[] search(String SearchID) {
        if(SearchID == ""){
            JOptionPane.showMessageDialog(null,"Shkruaj ID-ne e nje anetari" );
        }
        else{
            try {
            String sql1 = "Select * from memberdetails Where id = ?";
            
                PreparedStatement ps;
                
                ps = conn.prepareStatement(sql1);
                
                ps.setString(1, SearchID);
                ResultSet rs = ps.executeQuery();
                
                
                if(rs.next()){
                    name = rs.getString("name");
                    memId = rs.getString("id");
                    contact = rs.getString("contact_number");
                    address = rs.getString("address");
                    registeredOn = rs.getString("registered_on");
                    registeredBy = rs.getString("registered_by");
                }
                
                else{
                 JOptionPane.showMessageDialog(null,"Nuk ka anetar me id: " + SearchID + " ne database" );
                 
             }
                
                
             System.out.println("Nuk ka anetar me kete ID :(   "+memId);   
            
            
            String sql2 = "Select * from morememberdetails Where id = ?";
            
            
            
                PreparedStatement ps2;
                
                ps2 = conn.prepareStatement(sql2);
                
                ps2.setString(1, memId);
                ResultSet rs2 = ps2.executeQuery();
            
            
            
            
            
             if(rs2.next()){
                 NIC = rs2.getString("nic");
                 Email = rs2.getString("email");
                 Gender = rs2.getString("gender");
                 Height = rs2.getString("height");
                 Weight = rs2.getString("weight");
                 BMI = rs2.getString("bmi");
                 Remarks = rs2.getString("remarks");
                 LastUpdated = rs2.getString("lastUpdated");
             
             }
             
            
            
            
        
         String [] r  = {name, memId, contact, address, registeredBy, registeredOn, NIC, Email, Gender, Height, Weight, BMI, Remarks, LastUpdated};
            System.arraycopy(r, 0, results, 0, 14);
         
        
        
        
    
    return results;
    }catch(SQLException | HeadlessException c ){
             JOptionPane.showMessageDialog(null,"error search "+c );
        }
    return results;
    }
        return results;
        }
        

    void searchByID(String SearchID) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }
    
       public int getBMI(double h, double w){
        int b = (int) (w/(h*h));
       return b; 
    }
}
