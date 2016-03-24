package br.gov.sp.saobernardo.sispront.usuario;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.google.common.base.Objects;

import br.gov.sp.saobernardo.sispront.papel.Papel;

@Entity
public class Usuario implements UserDetails {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sq_usuario")
	@SequenceGenerator(name = "sq_usuario", sequenceName = "sq_usuario", allocationSize = 1, initialValue = 1)
	private Long id;

	@Column(unique = true)
	private String registro;

	private String nome;

	private String funcao;
	
	private String unidade;

	private String telefone;

	private String celular;

	@Column(unique = true)
	private String email;

	private String senha;

	@ManyToMany
	private Set<Papel> papeis = new HashSet<Papel>();

	@Column
	private boolean ativado = true;

	public String getRegistro() {
		return registro;
	}

	public void setRegistro(String registro) {
		this.registro = registro;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long idUsuario) {
		this.id = idUsuario;
	}

	public Set<Papel> getPapeis() {
		return papeis;
	}

	public void setPapeis(Set<Papel> papeis) {
		this.papeis = papeis;
	}

	public void setAtivado(boolean ativado) {
		this.ativado = ativado;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = new BCryptPasswordEncoder().encode(senha);
	}

	public String getFuncao() {
		return funcao;
	}

	public void setFuncao(String funcao) {
		this.funcao = funcao;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(this.id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj instanceof Usuario) {
			Usuario other = (Usuario) obj;
			return Objects.equal(this.id, other.id);
		}
		return false;
	}

	public Collection<? extends GrantedAuthority> getAuthorities() {
		return papeis;
	}

	public String getPassword() {
		return senha;
	}

	public String getUsername() {
		return registro;
	}

	public boolean isAccountNonExpired() {
		return true;
	}

	public boolean isAccountNonLocked() {
		return true;
	}

	public boolean isCredentialsNonExpired() {
		return true;
	}

	public boolean isEnabled() {
		return this.ativado;
	}

	public String getUnidade() {
		return unidade;
	}

	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}

}