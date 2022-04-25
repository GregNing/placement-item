namespace :import_data do
  desc 'import Campaign Data'
  task campaign_line_items: :environment do
    logger = Logger.new("#{Rails.root}/log/import_data.log")
    placements_teaser_data = JSON.parse(File.read(File.join(Rails.root, 'doc', 'placements_teaser_data.json')))
    campaign_names = []
    placements_teaser_data.each do |data|
      campaign_names << {name: data['campaign_name']}
    end
    campaign_name_uniq = campaign_names.uniq{|h| h[:name]}
    logger.info "Import Campaign Data #{campaign_name_uniq}"
    logger.info "Import Campaign Data Size: #{campaign_name_uniq.length}"
    puts campaign_name_uniq.length

    Campaign.insert_all(campaign_name_uniq)

    items = []
    placements_teaser_data.each do |data|
      items << {
        name: data['line_item_name'],
        booked_amount: data['booked_amount'],
        actual_amount: data['actual_amount'],
        adjustments: data['adjustments'],
        campaign_id: data['campaign_id']
      }
    end
    logger.info "Import Items Data #{items}"
    logger.info "Import Items Data Size: #{items.length}"
    LineItem.insert_all(items)
  end
end
