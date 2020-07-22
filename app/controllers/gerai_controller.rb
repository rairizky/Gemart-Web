class GeraiController < ApplicationController

    before_action :authorized

    def profile
        render json: { status: 0, message: "Hello #{@user.username}" }
    end

    def propose_gerai
        if @user.role_id != 3
            render json: { status: 1, error: "You are not allowed to access this page!" }
        else
            @update = Gerai.create(params_profile)
            if @update.valid?
                render json: { status: 0, 
                    message: "Berhasil mengajukan sebagai gerai, tunggu info lebih lanjut dari pihak kami." }
            else
                render json: { status: 1, error: @update.errors.full_messages }
            end
        end
    end

    def list_gerai
        find = User.find(@user.id)
        gerai = find.gerais
        total = gerai.count
        render json: { status: 0, user_id: find.id, total: total, gerai: gerai}
    end

    private
    def params_profile
        params.permit(:name, :image, :owner, :address, :user_id, :category_id, :lat, :long)
    end
end
