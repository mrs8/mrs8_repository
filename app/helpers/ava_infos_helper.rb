module AvaInfosHelper
  def medicine_for_select()
    Medicine.all.collect {|p| [p.medicine_name, p.id]}
  end
  def pharmacy_for_select()
    Pharmacy.all.collect {|p| [p.number, p.id]}
  end
  
  def link_to_add_medicine(form, pharmacy)
    new_object = AvaInfo.new()
    fields = form.fields_for(:ava_infos, new_object, 
      :child_index => 'new_role') do |fr|
      render('pharmacies/one_pharmacy_form', fr: fr, i: 'Новая')
    end
    link_to(?#, class: 'btn btn-info', 
        id: 'add_medicine_link', data: {content: "#{fields}"}) do 
      fa_icon("plus") + " Новый препарат" 
    end
  end
  
  def link_to_remove_medicine(form)  
    # При удалении nested-конструкции. Она реально не удаляется
    # Соответствующий html-блок скрывается
    # При этом выставляется значение специального поля _destroy
    # По этому поля rails понимает, что связь надо удалить
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
        link_to(?#, class: 'remove_fields remove_medicine') do 
      fa_icon('times', title: 'Удалить лекарство') + ' Удалить'      
    end
  end
  
end
