$('document').ready(function(){

$('.button').hide()

$("[name='step[complete]']").click(function(){
  $(this).closest('form').submit()
});

});