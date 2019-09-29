class FoundationBlueprint < Blueprinter::Base

  identifier :id
  fields :brand, :shade, :group
  view :normal do
    fields :id, :brand, :shade, :group
  end
end
