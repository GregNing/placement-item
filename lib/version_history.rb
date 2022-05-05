# frozen_string_literal: true

module VersionHistory
  def send_changes_to_version_history(persisted_object)
    version_history_class = 'history'
    new_version = {}

    persisted_object.previous_changes.each do |key, changes|
      next if %w[updated_at created_at].include?(key)

      new_version[key] = changes.last
    end

    persisted_object.send(version_history_class).create!(new_version) if new_version.present?
  end
end
