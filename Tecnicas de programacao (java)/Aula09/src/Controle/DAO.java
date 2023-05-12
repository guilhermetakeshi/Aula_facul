/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.Veterinario;

/**
 *
 * @author autologon
 */
public class DAO {
    Veterinario vet = new Veterinario();
    Connection conexao = null;
    PreparedStatement st = null;
    
    public void cadastrar (Veterinario veterinario) throws SQLException{
        
            conexao.getConnection();
        
                String sql = "insert into veterinario (nome, crmv, formacao) values(?, ?, ?)";
                PreparedStatement st = null;
                st = conexao.prepareStatement(sql);
                st.setString(1, veterinario.getNome());
                st.setString(2,veterinario.getCrmv());
                st.setString(3, veterinario.getFormacao());
                st.execute();
            }
    
    public void pesquisar (Veterinario veterinario) throws SQLException{
        Connection conexao = null;
    
        conexao = new Conexao().getConnection(conexao);
        
        String sql = "SELECT * FROM veterinario WHERE crmv = ?";
        
        PreparedStatement st = conexao.prepareStatement(sql);
        
        st.setString(1,veterinario.getCrmv());
        ResultSet rs = st.executeQuary();
        while(rs.next()){
            
            veterinario.setNome(rs.getString(2));
            veterinario.setFormacao(rs.getString(3));
            
        }
    
    }
}

