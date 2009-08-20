class Admin::BaseController < Spree::BaseController
  helper :search
  layout 'admin'

  before_filter :initialize_product_admin_tabs
  before_filter :initialize_order_admin_tabs
  before_filter :initialize_extension_tabs
  before_filter :add_shipments_tab
  before_filter :parse_date_params

private
  def parse_date_params
    dates = []
    if (self.respond_to?('object_name') && params[object_name])
      params[object_name].each do |k, v|
        if k =~ /\(\di\)$/
          param_name = k[/^\w+/]
          dates << param_name
        end
      end
      if (dates.size > 0)
        dates.uniq.each do |date|
          params[object_name][date] = [params[object_name].delete("#{date}(2i)"), params[object_name].delete("#{date}(3i)"), params[object_name].delete("#{date}(1i)")].join('/')
        end
      end
    end
  end

  def add_extension_admin_tab(tab_args)
    @extension_tabs << tab_args
  end

  def initialize_extension_tabs
    @extension_tabs = []
  end

  def add_shipments_tab
    @order_admin_tabs << {:name => 'Shipments', :url => "admin_order_shipments_url"}
  end

  #used to add tabs / partials to product admin interface
  def initialize_product_admin_tabs
    @product_admin_tabs = []
  end

  #used to add tabs / partials to order admin interface
  def initialize_order_admin_tabs
    @order_admin_tabs = []
  end
end

