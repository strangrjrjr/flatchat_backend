class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'WKzDujU48MGn79lsC4zH37hGqyIZhykL+LZWzhBjAxL3/n+sJ8K0mQfEd/5OT0h5BxrzvkYljtxuqdhT/9nckS4NfTbKsseDW95ITpkcikxp1wRnIryGocGBjBNM3XRSAGBXW/P3YqHSSe8oZQgw/YjSU7WlH1dL8JnicjA0p9/eUkcYpcXGAmHmiydXoCDxUL+Pp1vDzb2GQ2jbTDNhUCXplfJlsSeqLCql42D6q2XwQ/rx8le0BgO1hsTwI1Jqx44t++VtCK/UlHMbwHKXguLoOxidxqp96mpmUAl1YizEqVLoQn1IUlfZmMTyY24jzjN3Jrl9S8N4fVlCtcrYOLrhTJKPnsbr+SoktmFCjjsR6v04vYM1JKialZJVWyzZeG+9yDACfsQTyxSU49pTaLOiDAd4eWyFY66k--Ne/RHslPALS3a7x5--WNmVvsjenVYOc7a9/qYBlA==')
    end

    def auth_header
        # { 'Authorization': 'Bearer <token>' }
        request.headers['Authorization']
    end
     
      def decoded_token
            if auth_header
                token = auth_header.split(' ')[1]
                # headers: { 'Authorization': 'Bearer <token>' }
                begin
                    JWT.decode(token, 'WKzDujU48MGn79lsC4zH37hGqyIZhykL+LZWzhBjAxL3/n+sJ8K0mQfEd/5OT0h5BxrzvkYljtxuqdhT/9nckS4NfTbKsseDW95ITpkcikxp1wRnIryGocGBjBNM3XRSAGBXW/P3YqHSSe8oZQgw/YjSU7WlH1dL8JnicjA0p9/eUkcYpcXGAmHmiydXoCDxUL+Pp1vDzb2GQ2jbTDNhUCXplfJlsSeqLCql42D6q2XwQ/rx8le0BgO1hsTwI1Jqx44t++VtCK/UlHMbwHKXguLoOxidxqp96mpmUAl1YizEqVLoQn1IUlfZmMTyY24jzjN3Jrl9S8N4fVlCtcrYOLrhTJKPnsbr+SoktmFCjjsR6v04vYM1JKialZJVWyzZeG+9yDACfsQTyxSU49pTaLOiDAd4eWyFY66k--Ne/RHslPALS3a7x5--WNmVvsjenVYOc7a9/qYBlA==', true, algorithm: 'HS256')
                    # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
                rescue JWT::DecodeError
                    nil
                end
            end
        end

    def current_user
        if decoded_token
          # decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
          # or nil if we can't decode the token
          user_id = decoded_token[0]['user_id']
          @user = User.find_by(id: user_id)
        end
    end
     
    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end
