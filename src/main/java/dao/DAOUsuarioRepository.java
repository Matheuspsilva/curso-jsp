package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;

	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public ModelLogin gravarUsuario(ModelLogin objeto, Long userLogado) throws Exception {

		if (objeto.isNovo()) {// Grava um novo

			String sql = "INSERT INTO model_login( login, senha, nome, email, usuario_id) VALUES (?, ?, ?, ?, ?);";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, objeto.getLogin());
			preparedStatement.setString(2, objeto.getSenha());
			preparedStatement.setString(3, objeto.getNome());
			preparedStatement.setString(4, objeto.getEmail());
			preparedStatement.setLong(5, userLogado);

			preparedStatement.execute();
			connection.commit();
		} else { // Atualizar
			String sql = "UPDATE public.model_login SET login=?, senha=?, nome=?, email=? WHERE id =" + objeto.getId()
					+ ";";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, objeto.getLogin());
			preparedStatement.setString(2, objeto.getSenha());
			preparedStatement.setString(3, objeto.getNome());
			preparedStatement.setString(4, objeto.getEmail());

			preparedStatement.executeUpdate();
			connection.commit();
		}

		return this.consultarUsuario(objeto.getLogin(), userLogado);

	}

	public List<ModelLogin> consultaUsuarioList(Long userLogado) throws Exception {
		List<ModelLogin> retorno = new ArrayList<ModelLogin>();

		String sql = "SELECT * FROM model_login where useradmin is false and usuario_id = " + userLogado;

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) {

			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			// modelLogin.setSenha(resultado.getString("senha"));

			retorno.add(modelLogin);
		}
		
		return retorno;

	}

	public List<ModelLogin> consultaUsuarioList(String nome, Long userLogado) throws Exception {
		List<ModelLogin> retorno = new ArrayList<ModelLogin>();

		String sql = "SELECT * FROM model_login WHERE upper(nome) LIKE upper(?) and useradmin is false and usuario_id = " + userLogado;

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, "%" + nome + "%");

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) { // Retorna apenas um usuário

			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			// modelLogin.setSenha(resultado.getString("senha"));

			retorno.add(modelLogin);

		}

		return retorno;
	}
	
	public ModelLogin consultarUsuarioLogado(String login) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE login = ?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, login);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) { // Retorna apenas um usuário

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setUseradmin(resultado.getBoolean("useradmin"));

		}

		return modelLogin;
	}
	

	public ModelLogin consultarUsuario(String login) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE login = ? and useradmin is false";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, login);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) { // Retorna apenas um usuário

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setUseradmin(resultado.getBoolean("useradmin"));

		}

		return modelLogin;
	}
	
	public ModelLogin consultarUsuario(String login, Long userLogado) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE login = ? and useradmin is false and usuario_id = " + userLogado;

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

	
	
	public ModelLogin consultarUsuarioId(String id, Long userLogado) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE id = ? and useradmin is false and usuario_id = " + userLogado;

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, Long.parseLong(id));

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

	public boolean validarLogin(String login) throws Exception {
		String sql = "select count(1) > 0 as existe from model_login where login = ?;";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, login);

		ResultSet resultado = preparedStatement.executeQuery();

		resultado.next();
		return resultado.getBoolean("existe");

	}

	public void deletarUsuario(String idUser) throws Exception {
		String sql = "DELETE FROM public.model_login WHERE id = ? and useradmin is false;";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, Long.parseLong(idUser));

		preparedStatement.executeUpdate();
		connection.commit();
	}

}
