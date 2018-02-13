module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.all
        response.headers['Access-Control-Allow-Origin'] = '*'
        render json: {status: 'SUCCESS', messege:'All articles are loaded', data: articles}, status: :ok
      end

      def show
        article = Article.find(params[:id])
        response.headers['Access-Control-Allow-Origin'] = '*'
        render json: {status: 'SUCCESS', messege:'Article are loaded', data: article}, status: :ok
      end

      def update
        article = Article.find(params[:id])

        if article.update_attributes(article_params)
          response.headers['Access-Control-Allow-Origin'] = '*'
          render json: {status: 'SUCCESS', messege:'Article are updated', data: article}, status: :ok
        else
          response.headers['Access-Control-Allow-Origin'] = '*'
          render json: { status: 'ERROR', message:'Article are NOT updated',
            data: article.errors}, status: :unprocessable_entity
        end
      end

      def create
        article = Article.new(article_params)

        if article.save
          response.headers['Access-Control-Allow-Origin'] = '*'
          render json:{ status: 'SUCCESS', messege:'Article are created', data: article }, status: :ok
        else
          response.headers['Access-Control-Allow-Origin'] = '*'
          render json: { status: 'ERROR', message:'Article are NOT created',
            data: article.errors}, status: :unprocessable_entity
        end
      end


      def destroy
        article = Article.find(params[:id])
        article.destroy
        response.headers['Access-Control-Allow-Origin'] = '*'
        render json: {status: 'SUCCESS', messege:'Article are deleted', data: article}, status: :ok
      end

      private

      def article_params
        params.permit(:title, :description, :author, :tags)
      end
    end
  end
end
