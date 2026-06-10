# default editor
set -gx EDITOR "zeditor"
set -gx VISUAL "zedditor"
# default editor end

# load env
function load_env -d "Load variables in a .env file"
    for i in (cat ~/.env)
        set arr (echo $i |tr = \n)
        set -gx $arr[1] $arr[2]
    end
end
# load env end

# pnpm
set -gx PNPM_HOME ~/.local/share/pnpm
if set -q PNPM_HOME; and not string match -q -- $PNPM_HOME/bin $PATH
    fish_add_path $PNPM_HOME/bin
end
# pnpm end

# Enable vi key bindings
fish_vi_key_bindings

# key bingds
bind \cl forward-bigword
bind \ch backward-bigword
bind \cy fish_clipboard_copy
bind \cv fish_clipboard_paste
