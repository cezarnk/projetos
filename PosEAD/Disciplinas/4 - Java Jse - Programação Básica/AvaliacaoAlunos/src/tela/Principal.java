package tela;

import javax.swing.JOptionPane;

import modelo.Aluno;
import modelo.Disciplina;

public class Principal {

	public static void main(String[] args) {

		boolean validarNota1;
		boolean validarNota2;
		String opcaoPrincipal = "";

		Aluno aluno = new Aluno();
		aluno.setNome(JOptionPane.showInputDialog(null, "Digite o nome do aluno:"));
		aluno.setRa(JOptionPane.showInputDialog(null, "Digite o RA do aluno:"));

		do {
			opcaoPrincipal = JOptionPane.showInputDialog(null,
					"Cadastro das disciplinas e notas do aluno:\n" + "Nome: " + aluno.getNome() + " - RA: "
							+ aluno.getRa() + "\n" + "\nOPÇÕES:\n" 
							+ "1 - Cadastrar disciplina(s) e nota(s) do aluno\n"
							+ "2 - Listar as disciplinas, notas e faltas já cadastradas\n"
							+ "3 - Finalizar cadastro e mostrar todas disciplinas e média das notas\n"
							+ "4 - Sair do sistema");

			if (opcaoPrincipal.equals("1")) {
				Disciplina disciplina = new Disciplina();
				disciplina.setNomeDisciplina(JOptionPane.showInputDialog(null, "Digite o nome da disciplina: "));

				try {
					do {
						validarNota1 = disciplina.setNota1(
								Double.parseDouble(JOptionPane.showInputDialog(null, "Digite a primeira nota: ")));
						if (!validarNota1)
							JOptionPane.showMessageDialog(null, "Nota inválida! Digite uma nota entre 0 a 10...");
					} while (!validarNota1);

					do {
						validarNota2 = disciplina.setNota2(
								Double.parseDouble(JOptionPane.showInputDialog(null, "Digite a segunda nota: ")));
						if (!validarNota2)
							JOptionPane.showMessageDialog(null, "Nota inválida! Digite uma nota entre 0 a 10...");
					} while (!validarNota2);

					disciplina.setFalta(
							Integer.parseInt(JOptionPane.showInputDialog(null, "Digite a quantidade de faltas: ")));
					aluno.incluirDisciplina(disciplina);
				} catch (NumberFormatException ex) {
					JOptionPane.showMessageDialog(null, "Dados inválido!");
				}

			} else if (opcaoPrincipal.equals("2")) {

				if (aluno.getListaDisciplina().size() == 0) {
					JOptionPane.showMessageDialog(null, "Não há disciplinas e notas cadastradas!");
				} else {
					JOptionPane.showMessageDialog(null,
							"O aluno " + aluno.getNome() + " - RA: " + aluno.getRa() + " possui "
									+ aluno.getListaDisciplina().size()
									+ " disciplina(s).\n\nVeja quais são nas próximas telas");

					for (Disciplina umaDisciplina : aluno.getListaDisciplina()) {
						JOptionPane.showMessageDialog(null, umaDisciplina.listarDisciplinas());
					}
				}
			} else if (opcaoPrincipal.equals("3")) {
				double somaMedias = 0;
				double mediaGeral = 0;
				String resultadoFinal = "Resultado final:\n" + "Aluno: " + aluno.getNome() + " - RA: " + aluno.getRa()
						+ "\n\n";

				for (Disciplina disciplina : aluno.getListaDisciplina()) {
					resultadoFinal += disciplina.exibeDisciplina();
					somaMedias += disciplina.calculaMedia();
				}
				mediaGeral = somaMedias / aluno.getListaDisciplina().size();
				resultadoFinal += "\nA média geral foi de: " + mediaGeral;
				JOptionPane.showMessageDialog(null, resultadoFinal);
			}

		} while ((opcaoPrincipal.equals("1")) || (opcaoPrincipal.equals("2")) || (opcaoPrincipal.equals("3")));

	}
}
