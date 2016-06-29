
module ApplicationHelper
	def markdown(text)
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true, gh_blockcode: true)
		options = {
			autolink: true,
			no_intra_emphasis: true,
			disable_indented_code_blocks: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikethrough: true,
			superscript: true,
		}
		syntax_highlighter(Redcarpet::Markdown.new(renderer, options).render(text)).html_safe
	end

	def syntax_highlighter(html)
		doc = Nokogiri::HTML(html)
		doc.search("//pre[@lang]").each do |pre|
			pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])  
		end
		doc.to_s
	end
end

# module ApplicationHelper
# 	def markdown(text)
# 		options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code :gh_blockcode]
# 		Redcarpet.new(text, options).to_html.html_safe
# 	end
# end