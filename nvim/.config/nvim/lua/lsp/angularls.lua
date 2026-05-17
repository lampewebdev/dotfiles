local function angularls()
	local constants = require("lsp.constants")
	local mason_pkg = constants.MASON_PKG .. "angular-language-server/"
	local mason_modules = mason_pkg .. "node_modules"
	local mason_nested_modules = mason_modules .. "/@angular/language-server/node_modules"

	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "html", "htmlangular", "typescript" },
		callback = function(ev)
			local root = vim.fs.root(ev.buf, "angular.json")
			if not root then
				return
			end

			local probe = root .. "/node_modules," .. mason_modules .. "," .. mason_nested_modules

			vim.lsp.start({
				name = "angularls",
				cmd = {
					"node",
					mason_modules .. "/@angular/language-server/index.js",
					"--stdio",
					"--tsProbeLocations",
					probe,
					"--ngProbeLocations",
					probe,
				},
				root_dir = root,
			})
		end,
	})
end
return angularls
