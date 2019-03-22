class Section < ActiveRecord::Base
  has_many :tabs
  belongs_to :notebook, :foreign_key => 'notebook_id'
end