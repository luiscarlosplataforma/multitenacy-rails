class CivicoFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper

  def label(attribute, text = nil, options = {}, &block)
    return unless is_enabled_field?(attribute)
    super(attribute, text, options, &block)
  end

  def text_field(attribute, options = {})
    return unless is_enabled_field?(attribute)
    super(attribute, options = {})
  end

  private
    def field(attribute, options = {}, &block)
      return unless is_enabled_field?(attribute)
      super(attribute, options, &block)
    end

    def is_enabled_field?(attribute)
      @fields_checker ||= CheckEnabled.new(object, "Field")
      @fields_checker.check(attribute)
    end
end

module ActionView
  module Helpers
    module FormHelper
      def form_for_with_civico(record, options = {}, &block)
        options[:builder] ||= CivicoFormBuilder
        form_for_without_civico(record, options, &block)
      end

      def fields_for_with_civico(record_name, record_object = nil, options = {}, &block)
        options[:builder] ||= CivicoFormBuilder
        fields_for_without_civico(record_name, record_object, options, &block)
      end

      alias_method_chain :form_for, :civico
      alias_method_chain :fields_for, :civico
    end
  end
end
