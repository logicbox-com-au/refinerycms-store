module Admin
  class CartsController < Admin::BaseController

    crudify :cart,
            :title_attribute => 'name', :xhr_paging => true

  end
end