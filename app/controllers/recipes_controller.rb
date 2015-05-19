class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 4)
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end  
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(2)
    
      if @recipe.save
        flash[:success] = "Your recipe was created successfully!"
        redirect_to recipes_path
      else
        render :new
      end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      #do something
      flash[:success] = "Your recipe was created succesfully!"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  def like
    @recipe = Recipe.find(params[:id])
    like = Like.create(like: params[:like], chef: Chef.first, recipe: @recipe)
    if like.valid?
      flash[:success] = "Your selection was succesful"
      redirect_to :back
    else
      flash[:danger] = "You can only like/dislike a recipe once"
      redirect_to :back
    end
  end
  
  
  
  private
  # STRONG PARAMS: hay que indicar qué campos va a acceptar para crear el nuevo objeto.
  # Lo utilizamos en los POST requests: create y update.
    def recipe_params
      params.require(:recipe).permit(:name, :sumary, :description, :picture)
    end
  
  
end