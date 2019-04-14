class Section < ActiveRecord::Base
  has_many :tabs
  belongs_to :notebook, :foreign_key => 'notebook_id'
  has_many :articles, as: :articleInterface
end