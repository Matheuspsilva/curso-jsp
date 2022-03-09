package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;

	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public void gravarUsuario(ModelLogin objeto) throws Exception {

			String sql = "INSERT INTO model_login( login, senha, nome, email) VALUES (?, ?, ?, ?);";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, objeto.getLogin());
			preparedStatement.setString(2, objeto.getSenha());
			preparedStatement.setString(3, objeto.getNome());
			preparedStatement.setString(4, objeto.getEmail());
			
			preparedStatement.execute();
			connection.commit();

	}

}
