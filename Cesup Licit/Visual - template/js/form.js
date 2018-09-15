console.log("Foi carregado - arquivo form.js");

titulo.addEventListener("click",function(){
	console.log("Fui clicado na função anonima");
});

var botao = document.querySelector("#adicionar-paciente");
botao.addEventListener("click",function(event){
	event.preventDefault();
	
	var form = document.querySelector("#form-adiciona");
	var paciente = obtemPacienteDoFormulario(form);
	
	var erros = validaPaciente(paciente);
	console.log(erros);

	if(erros.length > 0){
		exibeMensagensDeErro(erros);

		return;
	}

	// adicionando o paciente na tabela
	adicionarPacienteNaTabela(paciente);

	form.reset();
	var mensangensErro = document.querySelector("#mensagens-erro");
	mensangensErro.innerHTML = "";
	console.log(pacienteTr);
});

function adicionarPacienteNaTabela(paciente){
	var pacienteTr = montaTr(paciente);
	var tabela = document.querySelector("#tabela-pacientes");
	tabela.appendChild(pacienteTr);			
}

function exibeMensagensDeErro(erros){
	var ul = document.querySelector("#mensagens-erro");
	ul.innerHTML = "";
	erros.forEach(function(erro){
		var li = document.createElement("li");
		li.textContent = erro;
		ul.appendChild(li);
	});
}

	
function obtemPacienteDoFormulario(form){
	//Criando objeto paciente
	var paciente = {
		nome: form.nome.value,
		peso: form.peso.value,
		altura: form.altura.value,
		gordura: form.gordura.value,
		imc: calculaImc(form.peso.value,form.altura.value),
	}
	return paciente;
}

function montaTr(paciente){
	var pacienteTr = document.createElement("tr");
	pacienteTr.classList.add("paciente");

	pacienteTr.appendChild(montaTd(paciente.nome,"info-nome"));
	pacienteTr.appendChild(montaTd(paciente.peso,"info-peso"));
	pacienteTr.appendChild(montaTd(paciente.altura,"info-altura"));
	pacienteTr.appendChild(montaTd(paciente.gordura,"info-gordura"));
	pacienteTr.appendChild(montaTd(paciente.imc,"info-imc"));

	return pacienteTr;	
}

function montaTd(dado,classe){
	var td = document.createElement("td");	
	td.classList.add(classe);
	td.textContent = dado;

	return td;
}

function validaPaciente(paciente){

	var erros = [];

	if(!validaPeso(paciente.peso)) erros.push("Peso é inválido!");
	if(!validaAltura(paciente.altura)) erros.push("Altura é invalido!");	
	if(paciente.nome.length == 0){
		erros.push("Nome não pode ser em branco");
	}

	if(paciente.gordura.length == 0 ){
		erros.push("A gordura não pode ser em branco");
	}

	if(paciente.peso.length == 0 ){
		erros.push("O peso não pode ser em branco");
	}

	if(paciente.altura.length == 0 ){
		erros.push("A altura não pode ser em branco");
	}

	return erros;
}