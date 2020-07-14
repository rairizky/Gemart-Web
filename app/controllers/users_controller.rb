class UsersController < ApplicationController

    before_action :authorized, only: [:auto_login]

    def register_gerai
        @user = User.create(user_params_gerai)
        if @user.valid?
            token = encode_token({ user_id: @user.id })
            render json: { status: 0, token: token, user: @user }
        else
            render json: { status: 1, error: @user.errors.full_messages }
        end
    end

    def login_gerai
        @user = User.find_by(email: params[:email])
        if @user 
            if @user.authenticate(params[:password])
                token = encode_token({ user_id: @user.id })
                render json: { status: 0, token: token, user: @user }
            else 
                render json: { status: 1, error: 'Email and Password not match' }
            end
        else
            render json: { status: 1, error: 'Email not found' }
        end
    end

    def register_supplier
        @user = User.create(user_params_supplier)
        if @user.valid?
            token = encode_token({ user_id: @user.id })
            render json: { status: 0, token: token, user: @user }
        else
            render json: { status: 1, error: @user.errors.full_messages }
        end
    end

    def login_supplier
        @user = User.find_by(email: params[:email])
        if @user 
            if @user.authenticate(params[:password])
                token = encode_token({ user_id: @user.id })
                render json: { status: 0, token: token, user: @user }
            else 
                render json: { status: 1, error: 'Email and Password not match' }
            end
        else
            render json: { status: 1, error: 'Email not found' }
        end
    end

    def auto_login
        render json: @user
    end

    private
    def user_params_gerai
        role = { role_id: 3 }
        params.permit(:username, :email, :password).merge(role)
    end

    def user_params_supplier
        role = { role_id: 2 }
        params.permit(:username, :email, :password).merge(role)
    end
end
