package com.br.simfini.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.config.annotation.authentication.configurers.userdetails.UserDetailsServiceConfigurer;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.br.simfini.models.Usuario;

@Repository
public class UsuarioDAO implements UserDetailsService {
	
	@PersistenceContext
	private EntityManager manager;
	
	public Usuario loadUserByUsername(String login) {
		List<Usuario> usuarios = manager.createQuery("select u from Usuario u where u.login = :login",Usuario.class)
				.setParameter("login",login)
				.getResultList();
		
		if (usuarios.isEmpty()) {
			throw new UsernameNotFoundException("Usuário" + login + " não foi encontrado");
		}
		
		return usuarios.get(0);
	}

	public void gravar(Usuario usuario) {
		manager.persist(usuario);
		
	}

	
}
