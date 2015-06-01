if defined?(ActiveAdmin)
  ActiveAdmin.register News::Article, as: 'News' do
    config.batch_actions = false

    index do
      selectable_column
      column :id
      column :title
      column :annonce
      actions
    end

    show do
      attributes_table do
        row :id
        row :title
        row (:text) { |article| raw(article.text) }
        row :text
      end
    end

    form do |f|
      inputs do
        input :title
        input :annonce
        input :text, input_htm: { class: 'ckeditor' }
      end
      actions
    end

    controller do
      def create
        @article = News::Article.new(article_params)
        @article.save
        redirect_to admin_news_index_path
      end
      
      def update
        @article = News::Article.find(params[:id])
        @article.update(article_params)
        redirect_to edit_admin_news_path
      end

      private

      def article_params
        params.require(:article).permit(:title, :annonce, :text)
      end
    end

    permit_params :title, :annonce, :text
  end
end
