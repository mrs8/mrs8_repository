@f4 = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
# Включаем все кнопки удаления
@f3 = ->
  $('a.remove_medicine').on 'click', ->
    window.f4($(this))
    false
  false
# Включаем кнопку добавления роли
@f2 = ->
  $('#add_medicine_link').on 'click', ->
    # Подменяем временный id с фразой new_ru на случайной число
    new_id = new Date().getTime()
    regexp = new RegExp("new_medicine", "g")
    content = $(this).attr('data-content')
    alert(2)
    content = content.replace(regexp, new_id)
    # Вставляем на страницу
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    # Если бы были даты с datepicker-ом 
    # window.datepicker_activation_by_item(panel)
    # Включаем у новой роли кнопку удаления
    # Её раньше не было, поэтому при зарузке страницы она не включалась
    panel.find('a.remove_medicine').on 'click', ->
      window.f4($(this))
      false    
    false
f1 = ->
  window.f2()
  window.f3()
$(document).on 'page:load', f1 # Включаем при ajax обновлении страницы
$(document).ready f1 # Включаем при обычном обновлении страницы

