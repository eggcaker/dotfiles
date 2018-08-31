# config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'w': 'session-save', 'wq': 'quit --save', 'mpv': 'spawn -d mpv --force-window=immediate {url}', 'nicehash': 'spawn --userscript nicehash', 'pass': 'spawn -d pass -c'}

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ['always']

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
c.content.headers.accept_language = 'en-US,en;q=0.8,fi;q=0.6'

# User agent to send. Unset to send the default. Note that the value
# read from JavaScript is always the global value.
# Type: String
c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'

# List of domains that should always be loaded, despite being ad-
# blocked. Domains may contain * and ? wildcards and are otherwise
# required to exactly match the requested domain. Local domains are
# always exempt from hostblocking.
# Type: List of String
c.content.host_blocking.whitelist = ['piwik.org', '*.flurry.com', "flurry.com"]

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Proxy to use. In addition to the listed values, you can use a
# `socks://...` or `http://...` URL.
# Type: Proxy
# Valid values:
#   - system: Use the system wide proxy.
#   - none: Don't use any proxy
c.content.proxy = 'none'

# Validate SSL handshakes.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.ssl_strict = True

# List of user stylesheet filenames to use.
# Type: List of File, or File
c.content.user_stylesheets = 'user.css'

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = '25%'

# Move on to the next part when there's only one possible completion
# left.
# Type: Bool
c.completion.quick = False

# When to show the autocompletion window.
# Type: String
# Valid values:
#   - always: Whenever a completion is available.
#   - auto: Whenever a completion is requested.
#   - never: Never.
c.completion.show = 'auto'

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '~/Downloads'

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = False

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined: * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['urxvt', '-e', "vim '{}'"]

# Characters used for hint strings.
# Type: UniqueCharString
c.hints.chars = 'hutenosadi'

# Automatically enter insert mode if an editable element is focused
# after loading the page.
# Type: Bool
c.input.insert_mode.auto_load = True

# Leave insert mode if a non-editable element is clicked.
# Type: Bool
c.input.insert_mode.auto_leave = True

# Show a scrollbar.
# Type: Bool
c.scrolling.bar = False

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = False

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# How to behave when the last tab is closed.
# Type: String
# Valid values:
#   - ignore: Don't do anything.
#   - blank: Load a blank page.
#   - startpage: Load the start page.
#   - default-page: Load the default page.
#   - close: Close the window.
c.tabs.last_close = 'close'

# Padding (in pixels) around text for tabs.
# Type: Padding
c.tabs.padding = {'left': 5, 'right': 5, 'top': 2, 'bottom': 2}

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# Which tab to select when the focused tab is removed.
# Type: SelectOnRemove
# Valid values:
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
#   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = 'prev'

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'about:blank'

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?q={}', 'gh': 'https://github.com/search?q={}', 'bd': 'https://www.baidu.com/s?wd={}'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://github.com/'

# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
c.window.hide_decoration = False

# Format to use for the window title. The same placeholders like for
# `tabs.title.format` are defined.
# Type: FormatString
c.window.title_format = '{private}{perc}{title}{title_sep}qutebrowser'

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = '#f3f3f3'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = 'gray'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#282828'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#282828'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#1d2021'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#a89984'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.item.selected.border.top = '#282828'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = '#282828'

# Foreground color of the matched text in the completion.
# Type: QssColor
c.colors.completion.match.fg = '#689d6a'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = '#f3f3f3'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = '#3c3836'

# Color gradient start for download text.
# Type: QtColor
c.colors.downloads.start.fg = '#ebdbb2'

# Color gradient start for download backgrounds.
# Type: QtColor
c.colors.downloads.start.bg = '#d65d0e'

# Color gradient end for download text.
# Type: QtColor
c.colors.downloads.stop.fg = '#ebdbb2'

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = '#689d6a'

# Color gradient interpolation system for download text.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.fg = 'rgb'

# Color gradient interpolation system for download backgrounds.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.bg = 'rgb'

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = '#b1a191'

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = '#d79921'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#fbf1c7'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = '#665c54'

# Font color for the matched part of hints.
# Type: QssColor
c.colors.hints.match.fg = '#fe8019'

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = '#d33682'

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = '#2aa198'

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = '#fdf6e3'

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = '#dc322f'

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = '#fdf6e3'

# Foreground color of a warning message.
# Type: QssColor
c.colors.messages.warning.fg = '#859900'

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = '#fdf6e3'

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = '#d47300'

# Foreground color of an info message.
# Type: QssColor
c.colors.messages.info.fg = '#a89984'

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = '#1d2021'

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = '#202020'

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = '#a89984'

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = '#282828'

# Background color for the selected item in filename prompts.
# Type: QssColor
c.colors.prompts.selected.bg = '#282828'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = '#a89984'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#252525'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = '#a89984'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#252525'

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = '#a89984'

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = '#666666'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = '#a89984'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#252525'

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = '#a89984'

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = '#666666'

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = '#a89984'

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = '#a89984'

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = '#a89984'

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = '#458588'

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = '#83a598'

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = '#a89984'

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = '#fb4934'

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = '#458588'

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = '#a89984'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = '#689d6a'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = '#b16286'

# Background color of the tab bar.
# Type: QtColor
c.colors.tabs.bar.bg = '#1d2021'

# Color gradient start for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.start = '#ebdbb2'

# Color gradient end for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.stop = '#b16286'

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = '#d65d0e'

# Color gradient interpolation system for the tab indicator.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.tabs.indicator.system = 'rgb'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#a89984'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#1d2021'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#a89984'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#1d2021'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = '#8ec07c'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#282828'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#8ec07c'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#282828'

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
c.colors.webpage.bg = '#f1f1f1'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = "14pt 'Fira code'"

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = "bold 14pt 'Fira code'"

# Font used for the debugging console.
# Type: QtFont
c.fonts.debug_console = "14pt 'Fira code'"

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = "14pt 'Fira code'"

# Font used for the hints.
# Type: Font
c.fonts.hints = "bold 14px 'DejaVu Sans Mono'"

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = "14pt 'Fira code'"

# Font used for error messages.
# Type: Font
c.fonts.messages.error = "14pt 'Fira code'"

# Font used for info messages.
# Type: Font
c.fonts.messages.info = "14pt 'Fira code'"

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = "14pt 'Fira code'"

# Font used for prompts.
# Type: Font
c.fonts.prompts = "14pt 'Fira code'"

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = "14pt 'Fira code'"

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = "14pt 'Fira code'"

# Bindings for normal mode
config.bind('+', None)
config.bind('-', None)
config.bind('<Ctrl+Shift+Tab>', 'tab-prev')
config.bind('<Ctrl+Tab>', 'tab-next')
config.bind('<Ctrl+q>', 'wq')
config.bind('<F12>', 'inspector')
config.bind('=', None)
config.bind('O', 'set-cmd-text :open {url:pretty}')
config.bind('T', 'set-cmd-text :open -t {url:pretty}')
config.bind('ZQ', None)
config.bind('ZZ', None)
config.bind('gi', 'hint inputs')
config.bind('sm', 'spawn --userscript dict')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('th', None)
config.bind('tl', None)
config.bind('z+', 'zoom-in')
config.bind('z-', 'zoom-out')
config.bind('zz', 'zoom')
# :bind -m command <Up> completion-item-focus prev
# :bind -m command <Down> completion-item-focus next