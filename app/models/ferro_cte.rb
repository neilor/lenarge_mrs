class FerroCte < ActiveRecord::Base

  validates :number, presence: true, numericality: true, uniqueness: {scope: :series}
  validates :series, presence: true
  validates :weight, presence: true

  def self.import(file)
    spreadsheet = Roo::Excel.new(file.path, nil, :ignore)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      # cleaning data
      ferro_cte_params = {}
      ferro_cte_params[:number] = row['CTE']
      ferro_cte_params[:series] = row['SERIE'].to_i.to_s
      ferro_cte_params[:weight] = row['PESO']

      FerroCte.create(ferro_cte_params)
    end

    true
  end

end
