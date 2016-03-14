class ProductsController < ApplicationController
	def index
		@sections = ['Breakfast', 'Lunch', 'Dinner', 'Drinks']
		@sort_options = [{
	      name: "Name A-Z",
	      value: "name asc"
	    }, {
	      name: "Price low to high",
	      value: "price asc"
	    }, {
	      name: "Price high to low",
	      value: "price desc"
	    }, {
	      name: "Most viewed",
	      value: "views desc"
	    }];
	    @curr_section = params[:section] ? params[:section] : @sections[0];
	    @curr_sort = params[:sort_by];
	    @key_word = params[:key_word];

	    @products = Product.by_section(@curr_section).by_name(@key_word).order(@curr_sort);
	end

	def show
		@product = Product.find(params[:id])
		@product.increment!(:views)
	end
end
