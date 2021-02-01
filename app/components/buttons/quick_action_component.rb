# frozen_string_literal: true

class Buttons::QuickActionComponent < ApplicationComponent
  def call
    tag.div class: 'd-flex justify-content-center' do
      tag.div class: 'mb-4' do
        tag.div id: 'tippy-sidebar-new',
                class: 'btn btn-outline-primary btn-large rounded-circle',
                data: { tippy_content: '' } do
          icon :plus
        end
      end
    end
  end
end
