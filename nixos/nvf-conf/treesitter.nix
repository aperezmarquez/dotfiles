{ config, pkgs, ... }:

{
    vim.treesitter.enable = true;
    vim.treesitter.highlight.enable = true;
    vim.treesitter.indent.enable = true;
    vim.treesitter.grammars = [ "markdown" "markdown_inline" ];
}
