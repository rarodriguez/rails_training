def show
  ejemplo ||= params[:element]
  ejemplo = ejemplo.nil? ? params[:element] : ejemplo
  ejemplo = defined?(ejemplo) ? ejemplo : params[:element]
  if !ejemplo
    ejemplo = params[:element]
  end
  if ejemplo.nil?
    ejemplo = params[:element]
  end
  
  @tweet= Tweet.find(1)
  view = 'status2'
  if @tweet.nil?
	view = 'status'
	render :action=>view && return
  else
	puts "hello world!"
	@tweet = Tweet.all
	render :action=>view
	return
  end
  
  render :action=>view
end

around_filter :get_tweet

before_filter :validations

def validations
  validation1 &&  validation2 && validation3
end

def get_tweet
 Logger.error "This is an error"
 yield
 Logger.info "This is not an error"
end


