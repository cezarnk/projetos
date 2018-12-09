console.log("Fui carregado - base.js")

$(function () {
    $('[data-toggle="popover"]').popover()
})

$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})


function mensagemAlerta(mensagem, classificacao) {

    $('html, body').animate({ scrollTop: 0 }, 'fast');
    $("#aviso_classificacao").removeClass('alert-danger');
    $("#aviso_classificacao").removeClass('alert-warning');
    $("#aviso_classificacao").removeClass('alert-info');
    $("#aviso_classificacao").removeClass('alert-success');
    $("#aviso_classificacao").addClass(classificacao);
    $("#aviso_texto").text(mensagem);
    $("#aviso").slideDown(500).delay(3000).fadeOut(500);

}