class SupplierController < ApplicationController

    before_action :authorized
    
    def profile
        render json: { status: 0, message: "Hello #{@user.username}" }
    end

    def propose_supplier
        if @user.role_id != 2
            render json: { status: 1, error: "You are not allowed to access this page!" }
        else
            @update = Supplier.create(params_profile)
            if @update.valid?
                render json: { status: 0, 
                    message: "Berhasil mengajukan sebagai supplier, tunggu info lebih lanjut dari pihak kami.",
                    data: @update }
            else
                render json: { status: 1, error: @update.errors.full_messages }
            end
        end
    end

    private
    def params_profile
        params.permit(:name, :image, :owner, :address, :user_id, :category_id, :lat, :long)
    end
end
