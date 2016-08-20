module Interswitch
  module Helpers
    def format_date(str)
      date = DateTime.parse(str)
      formatted_date = date.strftime('%A, %B %d, %Y')    
    end

    def generate_hash(
      txn_ref:,
      product_id:,
      pay_item_id:,
      amount_kobo:,
      site_redirect_url:,
      mackey:
      )
      Digest::SHA2.new(512).hexdigest(txn_ref.to_s + product_id.to_s + pay_item_id.to_s + amount_kobo.to_s + site_redirect_url.to_s + mackey).upcase
    end
  end
end
