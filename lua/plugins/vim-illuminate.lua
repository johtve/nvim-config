-- Highlights repeating words when the cursor is over them
return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			min_count_to_highlight = 2,
		})
	end
}
