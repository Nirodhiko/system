# default editor
set -gx EDITOR "zed"
set -gx VISUAL "zed"
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
if set -q PNPM_HOME; and not string match -q -- $PNPM_HOME $PATH
    fish_add_path $PNPM_HOME
end
# pnpm end

# enable vi mode
fish_vi_key_bindings