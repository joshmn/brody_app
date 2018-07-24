# frozen_string_literal: true

RSpec::Matchers.define :have_attribute do |attribute_name|
  chain :with_default do |expected_default|
    @expected_default = expected_default
  end

  chain :with_type do |expected_type|
    @expected_type = expected_type
  end

  match do |object_instance|
    result = object_instance.attribute_names.include?(attribute_name.to_s)
    result = object_instance.class._default_attributes[attribute_name.to_s].value == @expected_default unless @expected_default.nil?
    result = object_instance.class._default_attributes[attribute_name.to_s].type.type == @expected_type.to_sym unless @expected_type.nil?
    result
  end

  failure_message do |object_instance|
    message = "expected attribute #{attribute_name} on #{object_instance}"
    message += " with type #{@expected_type}" unless @expected_type.nil?
    message += " with default #{@expected_default}" unless @expected_default.nil?
    message
  end

  failure_message_when_negated do |object_instance|
    "expected attribute #{attribute_name} not to be on #{object_instance}"
  end

  description do
    'checks to see if there is an ActiveModel::Attribute attribute on the supplied object'
  end
end
