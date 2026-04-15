{ config, pkgs, ... }:

{
    vim = {
        statusline.lualine = {
            enable = true;
        };

        fzf-lua = {
            enable = true;
        };

        autocomplete.nvim-cmp = {
            enable = true;
        };

        notes.neorg = {
            enable = true;
        };
    };
}
