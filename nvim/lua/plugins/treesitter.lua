return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { 
              "c", 
              "cpp", 
              "css", 
              "lua", 
              "vim", 
              "vimdoc", 
              "query", 
              "javascript", 
              "html", 
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
