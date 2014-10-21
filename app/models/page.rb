class Page < ActiveRecord::Base
  #has_and_belongs_to_many :pages, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  has_many :page_banners, :dependent => :destroy
  has_many :banners, :through => :page_banners
  belongs_to  :user, :class_name => 'User', :foreign_key => :last_updated_by
  before_validation   :add_default_page_url
  validates :page_title, :presence => true, :on => :save
  validates_length_of :page_url, :within => 3..255, :allow_blank => true
  validates_uniqueness_of :page_title, :page_url

  scope :root, -> {where(is_root: true).first}
  scope :contact, -> {where(is_contact: true).first}
  scope :sections, -> {where(:show_in_menu => true, :page_id => nil, :activate => true).limit(8).order('display_order')}
  #scope :sub_pages, -> {where('show_in_menu IS true AND (page_id IS NOT NULL ? OR page_id <> "") AND activate IS true').includes(:pages)}
  scope :active, -> {where(activate: true)}
  scope :in_menu, -> {where(show_in_menu: true)}



  def add_default_page_url
    url = ''
    if is_root?
      self.page_url = 'home'
    elsif is_contact?
      self.page_url = 'contact-us'
    else
      unless self.page_id.blank?
        parent = Page.find(self.page_id)
        url += "#{parent.page_url}/"
      end
      url += transliterate_link(self.page_title)
      self.page_url = url
    end
    
  end

  def has_child?
    self.pages.any?
  end

  def has_parent?
    if !self.page_id.nil? && !self.page_id.blank?
      return true
    end
    false
  end

  def parent
    if self.has_parent?
      parent= get_parent(self.page_id)
    end
    parent
  end

  def ancestors
    @ancestors = []
    if self.has_parent?
      get_ancestors(self.page_id)
    end
    @ancestors.reverse
  end

  def collected_ancestors
    @ancestors
  end

  def get_ancestors(page_id)
    parent = Page.find(page_id)
    unless parent.nil?
      collected_ancestors << parent
      if parent.has_parent?
        get_ancestors(parent.page_id)
      end
    end
    @ancestors
  end

  def get_parent(page_id)
    parent = Page.find(page_id)
    parent
  end

  def transliterate_link(str)
    s = Iconv.iconv('ascii//ignore//translit', 'utf-8', str).to_s
    s.downcase!
    s.gsub!(/'/, '')
    s.gsub!(/[^A-Za-z0-9]+/, ' ')
    s.strip!
    s.gsub!(/\ +/, '-')
    return s
  end


end
