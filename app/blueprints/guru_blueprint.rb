# frozen_string_literal: true

class GuruBlueprint < Blueprinter::Base
  identifier :id

  # field :href do |guru|
  #   "api/v1/gurus/#{guru.id}"
  # end

  view :normal do
    fields :blog, :undertone, :skin, :group, :foundations
    association :foundations, blueprint: FoundationBlueprint
  end
end
