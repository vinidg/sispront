package br.gov.sp.saobernardo.sispront.papel;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

@Component
public class ConversorDePapeis {

	public List<PedidoDePapel> cruza(Collection<Papel> todas, Collection<Papel> doUsuario) {
		List<PedidoDePapel> pedidos = new ArrayList<PedidoDePapel>();

		for (Papel papel : todas) {
			boolean temPapel = doUsuario.contains(papel);
			PedidoDePapel pedidoDePapel = new PedidoDePapel();
			pedidoDePapel.setAtiva(temPapel);
			pedidoDePapel.setPapel(papel);

			pedidos.add(pedidoDePapel);
		}

		return pedidos;
	}

	public Set<Papel> selecionaAtivos(List<PedidoDePapel> pedidos) {
		Set<Papel> novosPepeis = new HashSet<Papel>();
		for (PedidoDePapel pedido : pedidos) {
			if (pedido.isAtiva()) {
				novosPepeis.add(pedido.getPapel());
			}
		}
		return novosPepeis;
	}

	public List<PedidoDePapel> mostraTodos(Collection<Papel> todosOsPapeis) {
		List<PedidoDePapel> pedidos = new ArrayList<PedidoDePapel>();
		for (Papel papel : todosOsPapeis) {
			PedidoDePapel pedidoDePapel = new PedidoDePapel();
			pedidoDePapel.setPapel(papel);

			pedidos.add(pedidoDePapel);
		}
		return pedidos;
	}

}
