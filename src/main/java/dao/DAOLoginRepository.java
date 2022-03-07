package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOLoginRepository {

	private Connection connection;
	
	public DAOLoginRepository() {
		connection = SingleConnectionBanco.getConnection();
		System.out.println(connection);
	}
	
	public boolean validarAutenticacao(ModelLogin modelLogin ) throws SQLException {
		
		System.out.println(connection);
		
		String sql = "select * from model_login where login = ? and senha = ? ";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		
		System.out.println(statement);
		
		statement.setString(1, modelLogin.getLogin());
		statement.setString(2, modelLogin.getSenha());
		 
		ResultSet resultSet = statement.executeQuery();
		
		if(resultSet.next()) {
			return true;//Autenticado
		}
		
		return false;//Não autenticado
		
	}
	
}
