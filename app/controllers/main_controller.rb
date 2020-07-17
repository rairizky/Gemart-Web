class MainController < ApplicationController

    skip_before_action :authorized

    def list_supplier
        supplier = Supplier.all
        total_supplier = Supplier.all.count
        render json: { status: 0, total: total_supplier, supplier: supplier }
    end

    def get

    end
end
