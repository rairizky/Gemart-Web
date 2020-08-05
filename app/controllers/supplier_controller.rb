class SupplierController < ApplicationController

    before_action :authorized
    before_action :check_supplier
    
    def profile
        find_profile = User.find(@user.id)
        profile = find_profile.profile
        render json: { status: 0, user_id: @user.id, profile: profile }
    end

    def create_profile
        find = User.find(@user.id)
        check = find.profile
        if check == nil
            profile = Profile.create(params_profile)
            if profile.valid?
                render json: { status: 0, message: "Berhasil melengkapi profile" }
            else
                render json: { status: 1, error: profile.errors.full_messages }
            end
        else
            render json: { status: 1, error: 'Profile sudah ada' }
        end
    end

    def propose_supplier
        find = User.find(@user.id)
        supplier = find.suppliers.find_by(name: params[:name])
        if supplier.blank?
            @update = Supplier.create(params_propose)
            if @update.valid?
                render json: { status: 0, 
                    message: "Berhasil mengajukan sebagai supplier, tunggu info lebih lanjut dari pihak kami." }
            else
                render json: { status: 1, error: @update.errors.full_messages }
            end
        else
            render json: {  status: 1, error: "Anda telah membuat Supplier dengan nama #{params[:name]}, pilih nama yang lain" }
        end
    end

    def list_supplier
        find = User.find(@user.id)
        supplier = find.suppliers
        total = supplier.count
        render json: { status: 0, user_id: find.id, total: total, supplier: supplier}
    end

    def detail_supplier
        get_supplier = Supplier.find(params[:id])
        render json: { status: 0, gerai: get_supplier }
    end

    private
    def params_propose
        params.permit(:name, :image, :owner, :address, :user_id, :category_id, :lat, :long)
    end

    def params_profile
        params.permit(:user_id, :image, :dob, :gender, :phone, :address)
    end
end
