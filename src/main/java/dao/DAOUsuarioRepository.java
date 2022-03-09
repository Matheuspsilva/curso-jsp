package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;

	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public ModelLogin gravarUsuario(ModelLogin objeto) throws Exception {

			String sql = "INSERT INTO model_login( login, senha, nome, email) VALUES (?, ?, ?, ?);";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, objeto.getLogin());
			preparedStatement.setString(2, objeto.getSenha());
			preparedStatement.setString(3, objeto.getNome());
			preparedStatement.setString(4, objeto.getEmail());
			
			preparedStatement.execute();
			connection.commit();
			
			return this.consultarUsuario(objeto.getLogin());

	}
	
	public ModelLogin consultarUsuario(String login) throws Exception {
		
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = "SELECT * FROM model_login WHERE login = ? ;";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, login);
		
		ResultSet resultado = preparedStatement.executeQuery();
		
		while (resultado.next()) { // Retorna apenas um usuário

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));

		}
		
		return modelLogin;
	}

}
