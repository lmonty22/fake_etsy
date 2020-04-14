class ReviewsController < ApplicationController

    before_action :set_review, only: [:edit, :show, :update, :destroy]
    before_action :authorized


    def new
        @review = Review.new()
        @item = Item.find(params[:item])
    end

    def create
        @review = Review.new(review_params)
        @review.user = current_user
        if @review.valid?
            @review.save
            redirect_to item_path(@review.item)
        else
            @item = Item.find(params[:review][:item_id])
            render :new
        end
    end

    def show

    end

    def edit
        @item = @review.item
    end

    def update
        @review.assign_attributes(review_params)
        @review.user = current_user
        if @review.valid?
            @review.save
            redirect_to item_path(@review.item)
        else
            @item = Item.find(params[:review][:item_id])
            render :edit
        end
    end

    def destroy
        @review.destroy
        redirect_to user_path(review.user)
    end

    private

    def review_params
        params.require(:review).permit(:title, :content, :rating, :item_id)
        
    end

    def set_review
        @review = Review.find(params[:id])
    end

end
