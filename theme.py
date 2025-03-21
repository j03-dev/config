import os
import re
import argparse


def replace_line_in_file(file_path, regex_pattern, new_line):
    """
    Replace a specific line in a file using a regular expression pattern.

    :param file_path: Path to the configuration file.
    :param regex_pattern: Regular expression pattern to locate the line to replace.
    :param new_line: The new line to insert in place of the matched line.
    """
    pattern = re.compile(regex_pattern)

    with open(file_path, "r") as file:
        lines = file.readlines()

    with open(file_path, "w") as file:
        for line in lines:
            if pattern.match(line):
                file.write(new_line + "\n")
            else:
                file.write(line)


def apply_themes(config, theme_type):
    """
    Apply themes based on the provided configuration dictionary and theme type.

    :param config: Dictionary containing configuration paths, themes, and regex patterns.
    :param theme_type: The type of theme to apply ('light' or 'dark').
    """
    for app, settings in config.items():
        config_path = os.path.expanduser(settings["config_path"])
        regex_pattern = settings["regex_pattern"]
        new_theme_line = settings.get(f"{theme_type}_theme")

        if new_theme_line:
            replace_line_in_file(config_path, regex_pattern, new_theme_line)
            print(f"Theme updated to {theme_type} for {app}")
        else:
            print(f"No {theme_type} theme specified for {app}")


def main():
    parser = argparse.ArgumentParser(
        description="Apply light or dark themes to configurations."
    )
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("-l", "--light", action="store_true", help="Apply light theme")
    group.add_argument("-d", "--dark", action="store_true", help="Apply dark theme")

    args = parser.parse_args()

    theme_type = "light" if args.light else "dark"

    config = {
        "zellij": {
            "config_path": "~/.config/zellij/config.kdl",
            "regex_pattern": r'^\s*theme\s*"(\w+)"',
            "dark_theme": 'theme "catppuccin_mocha"',
            "light_theme": 'theme "gruvbox_light"',
        },
        "alacrity": {
            "config_path": "~/.config/alacritty/alacritty.toml",
            "regex_pattern": r'^\s*general\.import\s*=\s*\["(.+)"\]',
            "dark_theme": 'general.import = ["~/.config/alacritty/themes/themes/catppuccin_mocha.toml"]',
            "light_theme": 'general.import = ["~/.config/alacritty/themes/themes/gruvbox_material_hard_light.toml"]',
        },
        "helix": {
            "config_path": "~/.config/helix/config.toml",
            "regex_pattern": r'^\s*theme\s*=\s*"(.+)"',
            "dark_theme": 'theme = "catppuccin_mocha"',
            "light_theme": 'theme = "gruvbox_light"',
        },
    }

    apply_themes(config, theme_type)


if __name__ == "__main__":
    main()
