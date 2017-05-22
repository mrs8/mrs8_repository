module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => @current_user.blank? ? 'Войти' : @current_user.email,
      :icon => 'user',
      :controller => :welcome, 
      :action => :new
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'}
    ]} 
    result << {
      :name => 'Навигация',
      :icon => 'search-plus',
      :children => [
      {:name => "Аптеки",
       :controller => :pharmacies, :action => :index,
       :icon => 'calendar',
       :class => 'long'},
      {:name => "Информация о наличии",
       :controller => :ava_infos, :action => :index,
       :icon => 'asterisk',
       :class => 'long'
      },
      {:name => "Поиск лекарств",
       :controller => :medicines, :action => :search,
       :icon => 'search',
       :class => 'long'
      }
    ]} 
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles', 'categories', 'pharmacies', 'medicines', 'ava_infos'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
