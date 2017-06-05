class Url < ApplicationRecord
  has_many :reads

  validates :address, presence: true
  validates :address, uniqueness: true


  def hot?
    top_ten = Url.top_ten.keys
    if top_ten[0] == id
      'top'
    elsif top_ten.include?(id)
      'hot'
    else
      ''
    end
  end

  def self.top_ten
    yesterday = (Time.new.utc - (60 * 60 * 24)).strftime('%Y-%m-%d %H:%M:%S')
    query = "SELECT urls.id, count(reads.id) FROM urls
      INNER JOIN reads ON urls.id = reads.url_id
      WHERE reads.created_at >= '#{yesterday}'
      GROUP BY urls.id
      ORDER BY count(reads.id) DESC
      LIMIT 10
      ;"

    results = ActiveRecord::Base.connection.execute(query)
    results.reduce({}) { |h, r| h.merge!({r['id'] => r['count']}) }
  end
end
