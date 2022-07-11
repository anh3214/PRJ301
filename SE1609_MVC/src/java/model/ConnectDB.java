/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ptuan
 */
public class ConnectDB {

    public Connection conn = null;

    public ConnectDB(String URL, String userName, String password) {
        try {
            //call drive
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //com.microsoft.
            // connection
            conn = DriverManager.getConnection(URL,userName, password);
            System.out.println("connected");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }        
    }
    public ConnectDB(){
        // string connection
        this("jdbc:sqlserver://DESKTOP-3FI6UE7:1433;databaseName=SE1609n","sa","sa");
    }
    public ResultSet getData(String sql){
        ResultSet rs = null;
        try {
            
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rs;
    }
    
    public static void main(String[] args) {
        new ConnectDB();
    }  
}
