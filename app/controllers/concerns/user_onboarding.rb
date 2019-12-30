module UserOnboarding
  def onboarding_percent
    steps = [:has_team?, :has_message?, :has_avatar?]
    complete = steps.select { |step| send(step) }
    complete.length / steps.length.to_f * 100
  end

  def has_team?
    teams.any?
  end

  def has_message?
    messages.any?
  end

  def has_avatar?
    avatar.present?
  end
end
