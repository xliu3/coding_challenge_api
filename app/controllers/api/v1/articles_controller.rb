module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.all
        render json: {status: 'SUCCESS', messege:'All articles are loaded', data: articles}, status: :ok
      end

      def show
        article = Article.find(params[:id])
        render json: {status: 'SUCCESS', messege:'Article are loaded', data: article}, status: :ok
      end

      def update
        article = Article.find(params[:id])

        if article.update_attributes(article_params)
          render json: {status: 'SUCCESS', messege:'Article are updated', data: article}, status: :ok
        else
          render json: { status: 'ERROR', message:'Article are NOT updated',
            data: article.errors}, status: :unprocessable_entity
        end
      end

      private

      def article_params
        params.permit(:title, :description, :author, :tags)
      end
    end
  end
end