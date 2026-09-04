return {
  "milanglacier/minuet-ai.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("minuet").setup({
      provider = "openai_fim_compatible",

      n_completions = 1,

      provider_options = {
        openai_fim_compatible = {
          api_key = "TERM",
          name = "llama.cpp",
          end_point = "http://localhost:8012/v1/completions",

          model = "qwen2.5-coder-1.5b-q8_0.gguf",

          optional = {
            max_tokens = 56,
            temperature = 0.1,
          },
        },
      },

      virtualtext = {
        auto_trigger_ft = {},

        keymap = {
          accept = "<A-A>",
          accept_line = "<A-l>",
          dismiss = "<A-e>",
          next = "<A-n>",
          prev = "<A-p>",
        },
      },
    })
  end,
}
