# frozen_string_literal: true

RSpec::Matchers.define :have_alias_attribute do |new_field, old_field|
  match do |object_instance|
    object_instance.attribute_aliases[new_field.to_s] == old_field.to_s
  end

  failure_message do |object_instance|
    "expected alias_attribute for #{new_field} to #{old_field} on #{object_instance}"
  end

  failure_message_when_negated do |object_instance|
    "expected alias_attribute not to be for #{new_field} to #{old_field} on #{object_instance}"
  end

  description do
    'checks to see if there is an alias_attribute on the supplied object'
  end
end
