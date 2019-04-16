class Paragraph < ActiveRecord::Base
  belongs_to :page, :foreign_key => 'page_id'
end