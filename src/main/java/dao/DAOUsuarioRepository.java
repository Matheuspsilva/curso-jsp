package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelLogin;
import model.ModelTelefone;

public class DAOUsuarioRepository {

	private Connection connection;

	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public ModelLogin gravarUsuario(ModelLogin objeto, Long userLogado) throws Exception {

		if (objeto.isNovo()) {// Grava um novo

			String sql = "INSERT INTO model_login( login, senha, nome, email, usuario_id, perfil, sexo, cep, logradouro, bairro, localidade, uf, numero, datanascimento, rendamensal) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?);";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, objeto.getLogin());
			preparedStatement.setString(2, objeto.getSenha());
			preparedStatement.setString(3, objeto.getNome());
			preparedStatement.setString(4, objeto.getEmail());
			preparedStatement.setLong(5, userLogado);
			preparedStatement.setString(6, objeto.getPerfil());
			preparedStatement.setString(7, objeto.getSexo());
			preparedStatement.setString(8, objeto.getCep());
			preparedStatement.setString(9, objeto.getLogradouro());
			preparedStatement.setString(10, objeto.getBairro());
			preparedStatement.setString(11, objeto.getLocalidade());
			preparedStatement.setString(12, objeto.getUf());
			preparedStatement.setString(13, objeto.getNumero());
			preparedStatement.setDate(14, objeto.getDataNascimento());
			preparedStatement.setDouble(15, objeto.getRendaMensal());

			preparedStatement.execute();
			connection.commit();
			
			if(objeto.getFotouser() != null && !objeto.getFotouser().isEmpty()) {
				sql = "update model_login set fotouser = ?, extensaofotouser=? where login =?";
				
				preparedStatement = connection.prepareStatement(sql); 
				
				preparedStatement.setString(1, objeto.getFotouser());
				preparedStatement.setString(2, objeto.getExtensaofotouser());
				preparedStatement.setString(3, objeto.getLogin());
				
				preparedStatement.execute();
				
				connection.commit();
			}
			
		} else { // Atualizar
			String sql = "UPDATE public.model_login SET login=?, senha=?, nome=?, email=?, perfil=?, sexo=?, cep =?, logradouro=?, bairro=?, localidade=?, uf=?, numero=?, datanascimento =?, rendamensal = ? WHERE id =" + objeto.getId()
					+ ";";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, objeto.getLogin());
			preparedStatement.setString(2, objeto.getSenha());
			preparedStatement.setString(3, objeto.getNome());
			preparedStatement.setString(4, objeto.getEmail());
			preparedStatement.setString(5, objeto.getPerfil());
			preparedStatement.setString(6, objeto.getSexo());
			preparedStatement.setString(7, objeto.getCep());
			preparedStatement.setString(8, objeto.getLogradouro());
			preparedStatement.setString(9, objeto.getBairro());
			preparedStatement.setString(10, objeto.getLocalidade());
			preparedStatement.setString(11, objeto.getUf());
			preparedStatement.setString(12, objeto.getNumero());
			preparedStatement.setDate(13, objeto.getDataNascimento());
			preparedStatement.setDouble(14, objeto.getRendaMensal());

			preparedStatement.executeUpdate();
			connection.commit();
			
			if(objeto.getFotouser() != null && !objeto.getFotouser().isEmpty()) {
				sql = "update model_login set fotouser = ?, extensaofotouser=? where id =?";
				
				preparedStatement = connection.prepareStatement(sql); 
				
				preparedStatement.setString(1, objeto.getFotouser());
				preparedStatement.setString(2, objeto.getExtensaofotouser());
				preparedStatement.setLong(3, objeto.getId());
				
				preparedStatement.execute();
				
				connection.commit();
			}
		}

		return this.consultarUsuario(objeto.getLogin(), userLogado);

	}
	
	public List<ModelLogin> consultaUsuarioListPaginada(Long userLogado, Integer offset) throws Exception {
		List<ModelLogin> retorno = new ArrayList<ModelLogin>();

		String sql = "SELECT * FROM model_login where useradmin is false and usuario_id = " + userLogado + "order by nome offset " + offset + " limit 5";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) {

			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			// modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));

			retorno.add(modelLogin);
		}
		
		return retorno;

	}
	
	

	public List<ModelLogin> consultaUsuarioList(Long userLogado) throws Exception {
		List<ModelLogin> retorno = new ArrayList<ModelLogin>();

		String sql = "SELECT * FROM model_login where useradmin is false and usuario_id = " + userLogado + "limit 5";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) {

			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			// modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));

			retorno.add(modelLogin);
		}
		
		return retorno;

	}
	
	public List<ModelLogin> consultaUsuarioListRel(Long userLogado) throws Exception {
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
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));
			modelLogin.setDataNascimento(resultado.getDate("datanascimento"));
			modelLogin.setTelefones(this.listFone(modelLogin.getId()));

			retorno.add(modelLogin);
		}
		
		return retorno;

	}
	
	public List<ModelLogin> consultaUsuarioListRel(Long userLogado, String dataInicial, String dataFinal) throws Exception {
		List<ModelLogin> retorno = new ArrayList<ModelLogin>();

		String sql = "SELECT * FROM model_login where useradmin is false and usuario_id = " + userLogado + "and datanascimento >= ? and datanascimento <= ?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		Date dataInicialConvertida = Date.valueOf(new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("dd/mm/yyyy").parse(dataInicial)));
		Date dataFinalConvertida = Date.valueOf(new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("dd/mm/yyyy").parse(dataFinal)));
		preparedStatement.setDate(1, dataInicialConvertida);
		preparedStatement.setDate(2, dataFinalConvertida);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) {

			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			// modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));
			modelLogin.setDataNascimento(resultado.getDate("datanascimento"));
			modelLogin.setTelefones(this.listFone(modelLogin.getId()));

			retorno.add(modelLogin);
		}
		
		return retorno;

	}

	public List<ModelLogin> consultaUsuarioList(String nome, Long userLogado) throws Exception {
		List<ModelLogin> retorno = new ArrayList<ModelLogin>();

		String sql = "SELECT * FROM model_login WHERE upper(nome) LIKE upper(?) and useradmin is false and usuario_id = " + userLogado + "limit 5";

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
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));

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
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));
			modelLogin.setFotouser(resultado.getString("fotouser"));
			modelLogin.setCep(resultado.getString("cep"));
			modelLogin.setLogradouro(resultado.getString("logradouro"));
			modelLogin.setBairro(resultado.getString("bairro"));
			modelLogin.setLocalidade(resultado.getString("localidade"));
			modelLogin.setUf(resultado.getString("uf"));
			modelLogin.setNumero(resultado.getString("numero"));
			modelLogin.setDataNascimento(resultado.getDate("datanascimento"));
			modelLogin.setRendaMensal(resultado.getDouble("rendamensal"));
			
			
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
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));
			modelLogin.setFotouser(resultado.getString("fotouser"));
			modelLogin.setCep(resultado.getString("cep"));
			modelLogin.setLogradouro(resultado.getString("logradouro"));
			modelLogin.setBairro(resultado.getString("bairro"));
			modelLogin.setLocalidade(resultado.getString("localidade"));
			modelLogin.setUf(resultado.getString("uf"));
			modelLogin.setNumero(resultado.getString("numero"));
			modelLogin.setDataNascimento(resultado.getDate("datanascimento"));
			modelLogin.setRendaMensal(resultado.getDouble("rendamensal"));

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
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));
			modelLogin.setFotouser(resultado.getString("fotouser"));
			modelLogin.setCep(resultado.getString("cep"));
			modelLogin.setLogradouro(resultado.getString("logradouro"));
			modelLogin.setBairro(resultado.getString("bairro"));
			modelLogin.setLocalidade(resultado.getString("localidade"));
			modelLogin.setUf(resultado.getString("uf"));
			modelLogin.setNumero(resultado.getString("numero"));
			modelLogin.setDataNascimento(resultado.getDate("datanascimento"));
			modelLogin.setRendaMensal(resultado.getDouble("rendamensal"));

		}

		return modelLogin;
	}

	public ModelLogin consultarUsuarioId(Long id) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * FROM model_login WHERE id = ? and useradmin is false";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, id);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) { // Retorna apenas um usuário

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));
			modelLogin.setFotouser(resultado.getString("fotouser"));
			modelLogin.setExtensaofotouser(resultado.getString("extensaofotouser"));
			modelLogin.setCep(resultado.getString("cep"));
			modelLogin.setLogradouro(resultado.getString("logradouro"));
			modelLogin.setBairro(resultado.getString("bairro"));
			modelLogin.setLocalidade(resultado.getString("localidade"));
			modelLogin.setUf(resultado.getString("uf"));
			modelLogin.setNumero(resultado.getString("numero"));
			modelLogin.setDataNascimento(resultado.getDate("datanascimento"));
			modelLogin.setRendaMensal(resultado.getDouble("rendamensal"));

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
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));
			modelLogin.setFotouser(resultado.getString("fotouser"));
			modelLogin.setExtensaofotouser(resultado.getString("extensaofotouser"));
			modelLogin.setCep(resultado.getString("cep"));
			modelLogin.setLogradouro(resultado.getString("logradouro"));
			modelLogin.setBairro(resultado.getString("bairro"));
			modelLogin.setLocalidade(resultado.getString("localidade"));
			modelLogin.setUf(resultado.getString("uf"));
			modelLogin.setNumero(resultado.getString("numero"));
			modelLogin.setDataNascimento(resultado.getDate("datanascimento"));
			modelLogin.setRendaMensal(resultado.getDouble("rendamensal"));

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
	
	public int totalPagina(Long userLogado) throws Exception {
		
		String sql = "select count(1) as cadastros from model_login where usuario_id = " + userLogado;
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		
		ResultSet resultado = preparedStatement.executeQuery();
		
		resultado.next();
		
		Double cadastros = resultado.getDouble("cadastros");
		
		Double porpagina = 5.0;
		
		Double pagina = cadastros/porpagina;
		
		Double resto = pagina % 2;
		
		if(resto > 0) {
			pagina++;
		}
		
		return pagina.intValue();

	}
	
	public List<ModelTelefone> listFone(Long idUserPai) throws Exception{
		List<ModelTelefone> retorno = new ArrayList<ModelTelefone>();
		
		String sql = "select * from telefone where usuario_pai_id = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, idUserPai);
		
		ResultSet resultado = preparedStatement.executeQuery();
		
		while (resultado.next()) { // Retorna apenas um usuário

			ModelTelefone modelTelefone = new ModelTelefone();
			
			System.out.println(resultado);

			modelTelefone.setId(resultado.getLong("id"));
			modelTelefone.setNumero(resultado.getString("numero"));
			modelTelefone.setUsuario_cad_id(this.consultarUsuarioId(resultado.getLong("usuario_cad_id")));
			modelTelefone.setUsuario_pai_id(this.consultarUsuarioId(resultado.getLong("usuario_pai_id")));

			retorno.add(modelTelefone);

		}

		return retorno;

	}

}
