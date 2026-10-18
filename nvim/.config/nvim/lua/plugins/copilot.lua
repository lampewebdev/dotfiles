-- copilot.lua
-- GitHub Copilot inline suggestions.
--
-- A GitHub Enterprise host comes from $COPILOT_GHE_HOST (e.g.
-- "example.ghe.com"), set outside the repo in zsh/.zshrc.local. Without it,
-- copilot.vim uses github.com.

return {
	{
		"github/copilot.vim",
		init = function()
			local ghe = vim.env.COPILOT_GHE_HOST
			if ghe and ghe ~= "" then
				vim.g.copilot_enterprise_uri = "https://" .. ghe
			end
		end,
	},
}
