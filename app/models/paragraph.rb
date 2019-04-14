class Paragraph < ActiveRecord::Base
  belongs_to :page, :foreign_key => 'page_id'
  has_many :articles, as: :articleInterface
end