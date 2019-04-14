class Page < ActiveRecord::Base
  has_many :paragraphs
  belongs_to :tab, :foreign_key => 'tab_id'
  has_many :articles, as: :articleInterface
end