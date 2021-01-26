require 'test_helper'
require 'view_component/test_case'

class CardImageTopComponentTest < ViewComponent::TestCase
  let(:src)  { 'https://example.com' }
  let(:alt)  { 'alt' }
  let(:link) { nil }

  describe 'when src is provided' do
    describe 'when link is provided' do
      let(:link) { 'https://example.com/link' }

      it 'renders the image inside the link' do
        render_component_inline
        _(page).must_have_all_of_selectors('a', img_selector)
      end
    end

    describe 'when link is not provided' do
      it 'renders the image with correct CSS properties' do
        render_component_inline
        _(page).must_have_selector(img_selector)
      end
    end
  end

  describe 'when src is not provided' do
    let(:src) { nil }

    it "doesn't render" do
      render_component_inline
      _(page).wont_have_selector(img_selector)
    end
  end

  def render_component_inline
    render_inline CardImageTopComponent.new(src: src, alt: alt, link: link)
  end

  def img_selector
    "img[src='#{src}'][alt='#{alt}']"
  end
end
