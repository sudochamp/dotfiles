return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function ()
			require("colorizer").setup({
				'css';
				'RRGGBBAA';
				html = { mode = 'background' };
			}, { mode = 'foreground' })
		end,
	}
}
