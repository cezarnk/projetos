new Vue({
    el: '#desafio',
    data: {
        valor: ''
    },
    methods: {
      exibirAlerta() {
        alert("Desafio alerta!")
      },
      alterarValor(event) {
        this.valor = event.target.value
      }
    }
})