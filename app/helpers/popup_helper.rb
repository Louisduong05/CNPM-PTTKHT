module PopupHelper
  def open_message(flash, title: 'Thông báo')
    messages = []
    modal_type = ''
    template = 'template'
    flash.each do |type, message|
      messages << message
      result = type.match(/^info_(\w+)/)
      if result.present?
        modal_type = result[1]
        template = 'info_template'
      end
    end

    render partial: 'popups/message', locals: { title: title, message: messages.join("<br />").html_safe, modal_type: modal_type, template: template}, formats: :js if messages.any?
  end

  def open_popup(title: 'Message', partial: '', locals: {}, klazz: '')
    render partial: 'popups/popup', locals: { title: title,
                                              klazz: klazz,
                                              render_path: partial,
                                              locals: locals }
  end
end
