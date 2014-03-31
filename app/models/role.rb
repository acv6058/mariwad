class Role < ActiveRecord::Base
  has_many  :users
  def is_admin?
    self.role.name == 'Admin'
  end

  def is_editor?
    self.role.name == 'Editor'
  end
end
