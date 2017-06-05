class Url < ApplicationRecord
  has_many :reads

  validates :address, presence: true
  validates :address, uniqueness: true


  def hot?
    return '' unless Url.top_links.include?(self)
    Url.top_links[0] == self ? 'top' : 'hot'
  end

  def self.top_links
    yesterday = (Time.new.utc - (60 * 60 * 24)).strftime('%Y-%m-%d %H:%M:%S')
    query = "SELECT urls.id FROM urls
      INNER JOIN reads ON urls.id = reads.url_id
      WHERE reads.created_at >= '#{yesterday}'
      GROUP BY urls.id
      ORDER BY count(reads.id) DESC
      LIMIT 10
      ;"

    results = ActiveRecord::Base.connection.execute(query)
    ids = results.pluck('id')
    ids.map { |id| Url.find(id) }
  end
end
