class AdminController < ApplicationController

    before_action :authorized
    before_action :check_admin

    def profile
        profile = User.find(@user.id)
        render json: { status: 0, profile: profile }
    end

    def dashboard_data
        supplier = Supplier.all.count
        gerai = Gerai.all.count
        user = User.where(role_id: [2,3]).count
        render json: { status: 0, data: { supplier: supplier, gerai: gerai, user: user } }
    end

    def all_supplier
        supplier = Supplier.all
        total = supplier.count
        render json: { status: 0, total: total, data: supplier }
    end

    def all_gerai
        gerai = Gerai.all
        total = gerai.count
        render json: { status: 0, total: total, data: gerai }
    end

    def all_user
        user = User.where(role_id: [2,3])
        total = user.count
        render json: { status: 0, total: total, data: user }
    end

    def propose_data_supplier
        propose = Supplier.all.where(status: false)
        total = propose.count
        render json: { status: 0, total: total, data: propose }
    end

    def propose_data_gerai
        propose = Gerai.all.where(status: false)
        total = propose.count
        render json: { status: 0, total: total, data: propose }
    end
end
