class PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:stats]
  def home
  end

  def stats
  	@users = User.all
  	@revisions = Revision.all
  	@casts = Cast.all
  end
end
