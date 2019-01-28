module ApplicationHelper
  def page_title
    title = "Morning Glory"
    title = @page_title + " - " + title if @page_title
    title
  end

  def menu_link_to(text,path,options = {})
    content_tag :li do  #liタグを生成
      # methodが設定されているか、現在と同じリンクではない場合、リンクを有効にする。
      condition = options[:method] || !current_page?(path)
      link_to_if(condition, text, path, options) do
        content_tag(:span,text) #spanタグを生成
      end
    end
  end

end
