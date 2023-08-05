# frozen_string_literal: true

class Homework::API::Authors < Grape::API
  version 'v1', using: :path
  resource :authors do
    helpers Homework::Helpers::ParamsHelper

    params do
      use :author
    end
    post do
      if declared(params)[:article_id].present?
        article = Article.find(declared(params)[:article_id])
        author = Author.create(declared(params)[:author])
        author.articles << article
        present author
      else
        present Author.create(declared(params)[:author])
      end
    end

    get do
      if declared(params)[:article_id].present?
        article = Article.find(declared(params)[:article_id])
        present article.authors
      else
        present Author.all
      end
    end

    params do
      requires :author_id, type: Integer, desc: 'Author ID.'
    end
    route_param :author_id do

      get :delete do
        present current_author.destroy
      end

      params do
        use :author
      end
      put do
        present current_author.update(declared(params)['author'])
      end
    end
  end
end