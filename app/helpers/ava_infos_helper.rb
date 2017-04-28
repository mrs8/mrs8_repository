module AvaInfosHelper
  def medicine_for_select()
    Medicine.all.collect {|p| [p.medicine_name, p.id]}
  end
  def pharmacy_for_select()
    Pharmacy.all.collect {|p| [p.number, p.id]}
  end
end
