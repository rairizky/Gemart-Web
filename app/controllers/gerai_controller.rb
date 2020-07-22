class GeraiController < ApplicationController

    before_action :authorized
    before_action :check_gerai

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

    def propose_gerai
        @update = Gerai.create(params_propose)
        if @update.valid?
            render json: { status: 0, 
                message: "Berhasil mengajukan sebagai gerai, tunggu info lebih lanjut dari pihak kami." }
        else
            render json: { status: 1, error: @update.errors.full_messages }
        end
    end

    def list_gerai
        find = User.find(@user.id)
        gerai = find.gerais
        total = gerai.count
        render json: { status: 0, user_id: find.id, total: total, gerai: gerai}
    end

    private
    def params_propose
        params.permit(:name, :image, :owner, :address, :user_id, :category_id, :lat, :long)
    end

    def params_profile
        params.permit(:user_id, :image, :dob, :gender, :phone, :address)
    end
end
