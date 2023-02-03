/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gym;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;



public class UpdateMemFunc {
     private static int lastid;
     private static String myID;
     
     
     public UpdateMemFunc(String MemID){
         myID = MemID;
     }
    
Connection conn = new DBConnection().connect();
    void addToMemberDetails(String memName, String contactNo, String memAddress) {
    try {
        PreparedStatement ps = conn.prepareStatement("Update memberdetails SET name =?,contact_number =?,address =? where id =?");
                
        
        ps.setString(1, memName);
        ps.setString(2, contactNo);
        ps.setString(3, memAddress);
        ps.setString(4,myID);
        
        
         ps.executeUpdate();
        
        JOptionPane.showMessageDialog(null, "Informacioni i: " + memName + " u perditesua me sukses" );
      
    
    
    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "error: "+ex);
    }
        
    }


    
    
    
    void addTOMoreMemDetails(String NIC, String emailAddress, String Gender, Double H, Double W, String Remarks) {
    try {
        PreparedStatement ps;
        ps = conn.prepareStatement("Update morememberdetails SET nic =?, email =?, gender =?, height=?, weight=?, bmi =?, remarks = ?, lastUpdated = ? where id = ?");
        
        ps.setString(1, NIC);
        ps.setString(2, emailAddress);
        ps.setString(3, Gender);
        ps.setDouble(4, H);
        ps.setDouble(5, W);
        ps.setInt(6,getBMI(H,W));
        ps.setString(7, Remarks);
        
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        ps.setTimestamp(8, date);
        ps.setString(9,myID );
        
        ps.executeUpdate();
        JOptionPane.showMessageDialog(null, "Informacioni u perditesua me sukses ne sistem");
        
    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null,"Informacioni nuk mund te perditesohej "+ex );
    }
    }
    
   
    
    
    
    
    public int getId(){
    try{
            
            PreparedStatement st = conn.prepareStatement("select * from  memberdetails where id");

            

            ResultSet rs = st.executeQuery();
           rs = st.executeQuery("SELECT MAX(id) AS id FROM memberdetails");
           if(rs.next())
             lastid = rs.getInt("id");
           System.out.println("id e fundit: "+lastid);

                
               return lastid; 
            }catch(Exception e){
                JOptionPane.showMessageDialog(null,"problem me SQL : setting foriegn key: "+e );
                System.out.println(e);
            }
    
    
    return lastid;
}
    
    public int getBMI(double h, double w){
        int b = (int) (w/(h*h));
       return b; 
    }

    
}
