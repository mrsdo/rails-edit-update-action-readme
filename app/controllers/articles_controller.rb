class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  # add edit and update methods here
  def edit
    @article = Article.find(params[:id])
  end

  # The raise method will cause the application to pause
  # and print out the params on an error page. You could
  # also see the params if you called puts params.inspect;
  # using puts would simply require you to track down the
  # data in the Rails server log.


  # basic flow for what the update action should do:
  #
  # 1. Query the database for the Article record that matches the :id passed to the route.
  #
  # 2. Store the query in an instance variable.
  #
  # 3. Update the values passed from the form (the update method here is the
  # update method supplied by Active Record, not the update method we're creating).
  # The update method takes a hash of the attributes for the model as its argument,
  # e.g. `Article.find(1).update(title: "I'm Changed", description: "And here too!")
  #
  # 4. Save the changes in the database.
  #
  # 5. Redirect the user to the show page so they can see the updated record.

  def update
    # raise params.inspect
    # 1. Query the DB
    @article = Article.find(params[:id])

    # 2. Store the query in an instance variable
    # 3. Update values passed from form
    # 4. Save
    @article.update(title: params[:article][:title], description: params[:article][:description])

    # 5. Redirect to show the updated record
    redirect_to article_path(@article)
  end
end
