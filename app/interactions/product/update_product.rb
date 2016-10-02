class UpdateProduct < ActiveInteraction::Base
  integer :id
  string :title
  string :description
  string :selected_specifics
  
  def to_model
    Product.new
  end
  
  def execute
    puts "Inside UpdateProductListing.... #{inputs}"
    
    product = Product.find(id)
    unless product.blank?
      user_specifics = JSON.parse(selected_specifics) || {}
      default_ls = populate_custom_drop_down(product.item_specifics, user_specifics)
      selected_specifics = remove_empty_fields(user_specifics)
      
      product = Product.find(id).update(
        title: title,
        description: description,
        item_specifics: default_ls,
        user_specifics: selected_specifics
      )
      
      product
    end
  end
  
  
  private
  def populate_custom_drop_down(def_specifics, selected_specifics)
      def_specifics.each do |k,v|
        field = v["field"]
        if field == "dropdown"
          selected_value = selected_specifics[k]
          puts "selected_value=#{selected_value}, includes=#{def_specifics[k]['suggestions'].include? selected_value}"
          def_specifics[k]["suggestions"] << selected_value unless def_specifics[k]["suggestions"].include? selected_value
        end
      end
      def_specifics
    end

    def remove_empty_fields(selh={})
      puts "+++++++++++++ hash=#{selh}"
      # selh = JSON.parse(selh) || {}
      h = {}
      selh.each do |k,v|
        h[k] = v unless v.blank?
      end
      puts h
      h.to_json
      end
  
end