class Tab < ActiveRecord::Base
  has_many :pages
  belongs_to :section, :foreign_key => 'section_id'
end