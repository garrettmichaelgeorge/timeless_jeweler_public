module Bootstrap::CloseButtonHelper
  def close_button(dismiss: 'alert')
    tag.button type: 'button',
               class: 'btn-close',
               data: { bs_dismiss: dismiss },
               aria: { label: 'Close' }
  end
end
