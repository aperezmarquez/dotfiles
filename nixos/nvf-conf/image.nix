{ config, pkgs, ... }:

{
    vim.extraPlugins = [
        pkgs.vimPlugins.image-nvim
    ];

    vim.luaConfigRC.image = ''
        require("image").setup({
            processor = "magick_cli",
            integrations = {
                markdown = {
                    only_render_image_at_cursor = true,
                    only_render_image_at_cursor_mode = "inline",
                },
            },
        })
    '';
}
