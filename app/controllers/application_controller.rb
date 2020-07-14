class ApplicationController < ActionController::API

    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 's3cr3t')
    end

    def auth_header 
        # Authorization : bearer xxxx
        request.headers['Authorization']
    end

    def decode_token
        if auth_header
            token = auth_header.split(' ')[1]
            # header token : bearer xxxx
            begin
                JWT.decode(token, 's3cr3t', algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def logged_in_user
        if decode_token
            user_id = decode_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!logged_in_user
    end

    def authorized
        render json: { message: 'Silahkan login terlebih dahulu' }, status: :unauthorized unless logged_in?
    end
    
end
