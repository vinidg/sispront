package br.gov.sp.saobernardo.sispront.papel;

public class PedidoDePapel {

	private boolean ativa;

	private Papel papel;

	public PedidoDePapel() {
	}

	public PedidoDePapel(boolean ativa, Papel papel) {
		this.ativa = ativa;
		this.papel = papel;
	}

	public boolean isAtiva() {
		return ativa;
	}

	public void setAtiva(Boolean ativa) {
		this.ativa = ativa;
	}

	public Papel getPapel() {
		return papel;
	}

	public void setPapel(Papel papel) {
		this.papel = papel;
	}

}
