class ApplicationController < ActionController::API
  before_action :authorized

    def encode_token(payload)
      JWT.encode(payload, "gigs4me")
    end

    def auth_header
      request.headers["Authorization"]
    end

    def decoded_token
      if auth_header
          token = auth_header.split(" ")[1] #header: {'Authorization': 'Bearer JWTTOKEN'}
          begin
            JWT.decode(token, "gigs4me", true, { algorithm: "HS256" })
          rescue JWT::DecodeError
            [{}]
          end
      end
    end

    def current_user
      if decoded_token
        user_id = decoded_token[0]["user_id"]
        @user = User.find(user_id)
      end
    end

    def logged_in?
      !!current_user
    end

    def authorized
      render json: {message: "Please log in"}, status: 401 unless logged_in?
    end

    def trim_options(options, target)
      if target == "user"
      options.split('options=')[1].split('?')[1..-1].map{|option| option.rpartition('=')}.select{|array| array[2] == "true"}.map{|option| option[0]}
      elsif target == "ensemble"
      new_options = options.split('options=')[1].split('?')[1..-1].map{|option| option.rpartition('=')}.select{|array| array[2] == "true"}.map{|option| option[0]}
      new_options << options.split('options=')[1].split('?')[1..-1].map{|option| option.rpartition('=')}.select{|array| array[0] == "members"}.flatten[2]
      new_options.compact
      end
    end

    def search_for_user

    end

    def apply_options(options,search_term = nil, target)
      if target == "user"
        case search_term
          when nil
            if options.include?("lfg")
            @users = User.joins(:instruments).where({instruments: {name: options}, users: {LFG: true}})
            else
            @users = User.joins(:instruments).where({instruments: {name: options}})
            end
            else
              if options.include?("lfg")
              @users = User.joins(:instruments).where({instruments: {name: options}, users: {LFG: true}}).select { |user| user.username.include?(@search_term) }
              else
              @users = User.joins(:instruments).where({instruments: {name: options}}).select { |user| user.username.include?(@search_term) }
              end
        end
      elsif target == "ensemble"
        case search_term
          when nil
            temp_options = options.join("")
              if temp_options.include?("any")
                return Ensemble.joins(user_ensembles: {user: :instruments}).where({instruments: {name: options}}).uniq
              elsif temp_options.include?("1-3")
                return Ensemble.joins(user_ensembles: {user: :instruments}).where({instruments: {name: options}}).select{|ensemble| ensemble.users.length <= 3}.uniq
              elsif temp_options.include?("4-6")
                return Ensemble.joins(user_ensembles: {user: :instruments}).where({instruments: {name: options}}).select{|ensemble| ensemble.users.length >= 4 && ensemble.users.length <= 6}.uniq
              elsif temp_options.include?("7+")
                return Ensemble.joins(user_ensembles: {user: :instruments}).where({instruments: {name: options}}).select{|ensemble| ensemble.users.length >= 7}.uniq
              end
          else
            temp_options = options.join("")
                if temp_options.include?("any")
                  return Ensemble.joins(user_ensembles: {user: :instruments}).where({instruments: {name: options}}).select { |ensemble| ensemble.name.include?(@search_term) }.uniq
                elsif temp_options.include?("1-3")
                  return Ensemble.joins(user_ensembles: {user: :instruments}).where({instruments: {name: options}}).select{|ensemble| ensemble.users.length <= 3}.select { |ensemble| ensemble.name.include?(@search_term) }.uniq
                elsif temp_options.include?("4-6")
                  return Ensemble.joins(user_ensembles: {user: :instruments}).where({instruments: {name: options}}).select{|ensemble| ensemble.users.length >= 4 && ensemble.users.length <= 6}.select { |ensemble| ensemble.name.include?(@search_term) }.uniq
                elsif temp_options.include?("7+")
                  return Ensemble.joins(user_ensembles: {user: :instruments}).where({instruments: {name: options}}).select{|ensemble| ensemble.users.length >= 7}.select { |ensemble| ensemble.name.include?(@search_term) }.uniq
                end
        end
      end

    end
end
