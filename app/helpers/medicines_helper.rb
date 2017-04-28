module MedicinesHelper
  def category_for_select
    Category.all.collect {|p| [p.category_name, p.id]}
  end
end
