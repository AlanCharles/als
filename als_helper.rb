# ------------------------------
# Als Helper v2015-09-09
# ------------------------------

module AlsHelper


	# ------------------------------
	# Lipsum Related Helpers
	# ------------------------------

	def placeholder(width_height)
		# creates a placeholder image powered by placehold.it
		path = "http://www.placehold.it/" + width_height.to_s
		image_tag path, :class => 'img-responsive'
	end


	# -----------------------------
	# Date & Time Related Helpers
	# -----------------------------
	def pretty_date(datetime)
		date_in_words = datetime.to_formatted_s(:long_ordinal)
		time_since = days_ago(datetime)
		return date_in_words + " (" + time_since + " ago)"
	end

	def date_in_words(datetime)
		datetime.strftime('%d %B %Y')
	end

	def days_ago(datetime)
		today = DateTime.now
		distance_of_time_in_words(today, datetime)
	end

	def time_gap(date)
		distance_of_time_in_words(DateTime.now, date)
	end


	# ------------------------
	# Rails related Helpers
	# ------------------------

	def display_messages
		if flash
			flash.inspect
		end
		if flash[:notice]
			render 'als_views/message_notice.html.haml'
		end
		if flash[:alert]
			render 'als_views/message_alert.html.haml'
		end
	end


	# -------------------------------
	# Trim String to Character Count
	# -------------------------------
	# the separator option attempts to make the break
	# in between whole words. Sometings this won't work
	# if you pass in a string with odd spaces.
	def trim_string_to_character_count(string, word_count)
		truncate(string, :length => word_count,  :separator => ' ')
	end

	def active_list_item(param, item)
		if param == item
			return "class = active"
		end
	end



end
