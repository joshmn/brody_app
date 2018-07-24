module ApplicationHelper

  def parent_layout(layout)
    @view_flow.set(:layout, output_buffer)
    output = render(:file => "layouts/#{layout}")
    self.output_buffer = ActionView::OutputBuffer.new(output)
  end

  def class_if(klass, *matches)
    matches.each do |match|
      if match.ends_with?("*")
        if "#{params[:controller]}#*" == match
          return klass
        end
      else
        return klass if match == "#{params[:controller]}##{params[:action]}"
      end
    end
    ""
  end

  def page_title
    if @title.present?
      "#{@title} - "
    else
      ''
    end.concat('AppName')
  end

  def format_flash_message(message)
    raw message.gsub('href=', 'class="alert-link" href=')
  end

  def flash_class
    { notice: 'info', error: 'danger', success: 'success', alert: 'danger' }.with_indifferent_access
  end

end
