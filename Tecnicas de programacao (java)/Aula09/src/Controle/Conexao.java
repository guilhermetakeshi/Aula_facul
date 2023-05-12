/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



/**
 *
 * @author autologon
 */
public class Conexao {
    public Connection getConnection(Connection Conexao) throws SQLException{
        
  /*      
    Connection conexao = null;
    
        try {
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/clinica","root",null);
            JOptionPane.showMessageDialog(null, "Conectado!!!");
 
        } catch (SQLException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
   */  

    Connection conexao = null;
    conexao = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/clinica","root",null);
  
    return conexao;
    
    }
    
}
