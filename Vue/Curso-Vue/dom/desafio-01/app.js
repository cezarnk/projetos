new Vue({
  el: '#desafio',
  data: {
    nome: 'Ana Silva',
    idade: '28',
    imagem: 'https://www.clientresourcesinc.com/wp-content/uploads/2018/06/vuejs_logo.png'
  },
  methods: {
    idadeVezes3() {
      return this.idade * 3
    },
    random() {
      return Math.random()
    }
  }
})