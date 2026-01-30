return {
    "nvim-treesitter/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter.git",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.config")

      configs.setup({
          ensure_installed = { 
              "c", 
              "cpp", 
              "css", 
              "lua", 
              "bash",
              "vim", 
              "vimdoc", 
              "query", 
              "javascript", 
              "html", 
              "css",
              "typescript",
              "git_config", 
              "git_rebase", 
              "gitcommit", 
              "gitignore",
              "python",
              "r",
              "scala",
              "sql",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }
