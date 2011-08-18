class SnacksController < ApplicationController
  # GET /snacks
  # GET /snacks.xml
  def index
    @snacks = Snack.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @snacks }
    end
  end

  # GET /snacks/1
  # GET /snacks/1.xml
  def show
    @snack = Snack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @snack }
    end
  end

  # GET /snacks/new
  # GET /snacks/new.xml
  def new
    @snack = Snack.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @snack }
    end
  end

  # GET /snacks/1/edit
  def edit
    @snack = Snack.find(params[:id])
  end

  # POST /snacks
  # POST /snacks.xml
  def create
    Rails.logger.error "---- #{params.inspect}"
    @snack = Snack.new(params[:snack])
    puts "---- #{@snack.inspect}"
	
	respond_to do |format|
	  if @snack.save
		puts "---- #{@snack.inspect}"
		format.html { redirect_to(@snack, :notice => 'Snack was successfully created.') }
		format.xml  { render :xml => @snack, :status => :created, :location => @snack }
	  else
		format.html { render :action => "new" }
		format.xml  { render :xml => @snack.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # PUT /snacks/1
  # PUT /snacks/1.xml
  def update
    @snack = Snack.find(params[:id])

    respond_to do |format|
      if @snack.update_attributes(params[:snack])
        format.html { redirect_to(@snack, :notice => 'Snack was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @snack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /snacks/1
  # DELETE /snacks/1.xml
  def destroy
    @snack = Snack.find(params[:id])
    @snack.destroy

    respond_to do |format|
      format.html { redirect_to(snacks_url) }
      format.xml  { head :ok }
    end
  end
end
