module Interswitch
  class Form
    include Interswitch::Helpers

    attr_reader :product_id, :pay_item_id, :amount_kobo, :site_redirect_url, :currency, :cust_id, :cust_name, :txn_ref, :testurl, :liveurl, :mackey, :url, :hash, :site_name, :transaction_date, :package_name, :interswitch_redirect_path, :interswitch_logo

    # Initialize the token!
    #
    # Example:
    # values = {
      # :product_id => 'value',
      # :pay_item_id => 'value',
      # :amount_kobo => 'value',
      # :site_redirect_url => 'value',
      # :currency => 'value',
      # :cust_id => 'value',
      # :cust_name => 'value',
      # :txn_ref => 'value',
      # :testurl => 'value',
      # :liveurl => 'value',
      # :mackey => 'value',
      # :url => 'value',
      # :hash => 'value',
      # :site_name => 'value',
      # :transaction_date => 'value',
      # :package_name => 'value'
    # }
    #   >> Interswitch::Form.new(values)
    #   => Interswitch Object
    #
    # Arguments:
    #   options: (Hash)
    def initialize(args)
      # # ensure args is hash and required values are supplied
      @testurl = 'https://sandbox.interswitchng.com/webpay/pay'
      @liveurl = 'https://webpay.interswitchng.com/paydirect/pay'
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
      
      @url = args[:test_mode] ? @testurl : @liveurl
      @hash = generate_hash(txn_ref: self.txn_ref, product_id: self.product_id, pay_item_id: self.pay_item_id, amount_kobo: self.amount_kobo, site_redirect_url: self.site_redirect_url, mackey: self.mackey)
    end

    def generate_webpay_form
      return "<form id='webpay-payment-form' class='form-horizontal' role='form' action='#{self.url}' accept-charset='UTF-8' method='post'>
      <table style='width:100%;' cellpadding='0' class='payment_table' border='0'>

        <tr height='30px'>
            <td align='left' width='50%'>Transaction Date: </td>
            <td align='left' width='50%' style='font-weight:bold'>#{format_date(self.transaction_date)} </td>
        </tr> 
        <tr height='30px'>
            <td align='left' width='100%' class='text_black'>Transaction ID: </td>
            <td align='left' width='50%' style='font-weight:bold'>#{self.txn_ref} </td>
        </tr>    
        <tr height='30px'>
            <td align='left' width='50%'>Payment Partner:</td>
            <td align='left' width='50%' style='font-weight:bold'>
            <img src='#{self.interswitch_logo}' width='200' height='50' alt='payment partner' />
            </td>
        </tr>        
        <tr height='30px'>
          <td align='left' width='50%'>Customer Subscription:</td>
          <td><span style='font-weight:bold'>  #{self.package_name}</span></td>
        </tr> 
        
        <tr height='30px'>
          <td align='left' width='50%'>Total amount:&nbsp;
          <td align='left' width='50%' style='font-weight:bold'> &#8358;#{self.amount_kobo/100}</td>
        </tr>


        <input name='utf8' type='hidden' value='&#x2713;' />
        <input type='hidden' name='product_id' id='product_id' value='#{self.product_id}' />
        <input type='hidden' name='pay_item_id' id='pay_item_id' value='#{self.pay_item_id}' />
        <input type='hidden' name='amount' id='amount' value='#{self.amount_kobo}' />
        <input type='hidden' name='site_redirect_url' id='site_redirect_url' value='#{self.site_redirect_url}' />
        <input type='hidden' name='currency' id='currency' value='#{self.currency}' />
        <input type='hidden' name='cust_id' id='cust_id' value='#{self.cust_id}' />
        <input type='hidden' name='cust_name' id='cust_name' value='#{self.cust_name}' />
        <input type='hidden' name='txn_ref' id='txn_ref' value='#{self.txn_ref}' />
        <input type='hidden' name='hash' id='hash' value='#{self.hash}' />
        <input type='hidden' name='site_name' id='site_name' value='#{self.site_name}' />
        <br />

          <tr height='30px'>
              <td align='right' width='100%' colspan='2'>
              <a href='#{self.interswitch_redirect_path}' class='btn btn-ipnx btn-sm'>&nbsp;Cancel&nbsp;</a>
                  &nbsp;&nbsp;&nbsp;
              <button type='submit' name='commit' class='btn btn-ipnx btn-sm'>Submit</button>
              </td>
           </tr>
       </table>
      </form>
      "

      # <script type='text/javascript'>
      #   document.getElementById('webpay-payment-form').submit()
      # </script>
    end
  end
end
