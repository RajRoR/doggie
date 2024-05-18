# frozen_string_literal: true

# Helper methods for Dog views
module DogsHelper
  def message_locals(dog)
    if dog['status'] == 'success'
      { msg: 'Enter a breed name and let us surprise you! 🐶 🦴 🐾', tw_class: 'text-inherit' }
    else
      { msg: "🙅 #{dog['message']}", tw_class: 'text-red-700' }
    end
  end
end
