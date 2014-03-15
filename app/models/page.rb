class Page < ActiveRecord::Base
  has_many :pages, :dependent => :destroy
  has_many :banners
  belongs_to  :user, :class_name => 'User', :foreign_key => :last_updated_by
  before_validation   :add_default_page_url
  validates :page_title, :presence => true, :on => :save
  validates_length_of :page_url, :within => 3..255, :allow_blank => true
  validates_uniqueness_of :page_title, :page_url



  def add_default_page_url
    url = ''
    if !page_id.blank?
      parent = Page.find(page_id)
      url += "#{parent.page_url}/"
    end
    url += transliterate_link(page_title)
    self.page_url = url
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

  def self.get_page(param)
    Page.where()
  end

end
