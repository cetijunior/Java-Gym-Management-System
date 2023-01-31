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
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.JOptionPane;


public class AddMemberFunc {
    
    
    private static int lastid;
    
Connection conn = new DBConnection().connect();
    void addToMemberDetails(String memName,  String contactNo, String memAddress) {
    try {
        PreparedStatement ps;
        ps = conn.prepareStatement("insert into "
                + "memberdetails"+"(name,contact_number,address,registered_on,registered_by) "
                + "values(?,?,?,?,?)");
        
        ps.setString(1, memName);
        ps.setString(2, contactNo);
        ps.setString(3, memAddress);
        
        
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        ps.setTimestamp(4, date);
        
        
        ps.setString(5, new LoginFrameFunc().getLogName());
        JOptionPane.showMessageDialog(null, "Informacioni i pjesa pareS "+ memName + " u shtua ne sistem me sukses");
        ps.executeUpdate();
    
    
    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "error: "+ex);
    }
        
    }
    
    
    
    
    
    
    
    void addTOMoreMemDetails(String NIC, String emailAddress, String Gender, Double H, Double W, String Remarks) {
    
        try {
        PreparedStatement ps;
        ps = conn.prepareStatement("insert into "
                + "morememberdetails"+"(id,nic,email,gender,height,weight,remarks,bmi,lastUpdated) "
                + "values(?,?,?,?,?,?,?,?,?)");
        ps.setInt(1, getId());
        ps.setString(2, NIC);
        ps.setString(3, emailAddress);
        ps.setString(4, Gender);
        ps.setDouble(5, H);
        ps.setDouble(6, W);
        ps.setString(7, Remarks);
        ps.setInt(8,getBMI(H,W));
        
        
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        ps.setTimestamp(9, date);
        
        ps.executeUpdate();        
        JOptionPane.showMessageDialog(null, "Informacioni u shtua ne sistem me sukses");
        
    } catch (SQLException ex) {
        Logger.getLogger(AddMemberFunc.class.getName()).log(Level.SEVERE, null, ex);
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
