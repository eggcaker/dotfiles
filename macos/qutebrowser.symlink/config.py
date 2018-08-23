# import setproctitle
# setproctitle.setproctitle("qutebrowser")

# Bindings
config.bind("gi", "hint inputs")
config.bind("<f12>", "inspector")

config.unbind("+")
config.unbind("-")
config.unbind("=")
config.bind("z+", "zoom-in")
config.bind("z-", "zoom-out")
config.bind("zz", "zoom")

config.unbind("O")
config.unbind("T")
config.unbind("th")
config.unbind("tl")
config.bind("O", "set-cmd-text :open {url:pretty}")
config.bind("T", "set-cmd-text :open -t {url:pretty}")
config.bind("t", "set-cmd-text -s :open -t")

config.unbind("<ctrl+tab>")
config.bind("<ctrl+tab>", "tab-next")
config.bind("<ctrl+shift+tab>", "tab-prev")

config.unbind("ZQ")
config.unbind("ZZ")
config.unbind("<ctrl+q>")
config.bind("<ctrl+q>", "wq")

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
c.aliases = {
    "w": "session-save",
    "wq": "quit --save",
    "mpv": "spawn -d mpv --force-window=immediate {url}",
    "nicehash": "spawn --userscript nicehash",
    "pass": "spawn -d pass -c",
}

# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# The height of the completion, in px or as percentage of the window.
c.completion.height = "25%"

# Move on to the next part when there's only one possible completion
# left.
c.completion.quick = False

# When to show the autocompletion window.
# Valid values:
#   - always: Whenever a completion is available.
#   - auto: Whenever a completion is requested.
#   - never: Never.
c.completion.show = "auto"

# Whether quitting the application requires a confirmation.
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ["downloads"]

# Value to send in the `Accept-Language` header.
c.content.headers.accept_language = "en-US,en;q=0.8,fi;q=0.6"

# The proxy to use. In addition to the listed values, you can use a
# `socks://...` or `http://...` URL.
# Valid values:
#   - system: Use the system wide proxy.
#   - none: Don"t use any proxy
c.content.proxy = "none"

# Validate SSL handshakes.
# Valid values:
#   - true
#   - false
#   - ask
c.content.ssl_strict = True

# A list of user stylesheet filenames to use.
c.content.user_stylesheets = "user.css"

# The directory to save downloads to. If unset, a sensible os-specific
# default is used.
c.downloads.location.directory = "~/Downloads"

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
c.downloads.location.prompt = False

# The editor (and arguments) to use for the `open-editor` command. `{}`
# gets replaced by the filename of the file to be edited.
c.editor.command = ["urxvt", "-e", "vim '{}'"]

monospace = "14pt 'Fira code'"

# Font used in the completion categories.
c.fonts.completion.category = f"bold {monospace}"

# Font used in the completion widget.
c.fonts.completion.entry = monospace

# Font used for the debugging console.
c.fonts.debug_console = monospace

# Font used for the downloadbar.
c.fonts.downloads = monospace

# Font used in the keyhint widget.
c.fonts.keyhint = monospace

# Font used for error messages.
c.fonts.messages.error = monospace

# Font used for info messages.
c.fonts.messages.info = monospace

# Font used for warning messages.
c.fonts.messages.warning = monospace

# Font used for prompts.
c.fonts.prompts = monospace

# Font used in the statusbar.
c.fonts.statusbar = monospace

# Font used in the tab bar.
c.fonts.tabs = monospace

# Font used for the hints.
c.fonts.hints = "bold 14px 'DejaVu Sans Mono'"

# Chars used for hint strings.
c.hints.chars = "asdfghjklie"

# Leave insert mode if a non-editable element is clicked.
c.input.insert_mode.auto_leave = True

# Automatically enter insert mode if an editable element is focused
# after loading the page.
c.input.insert_mode.auto_load = True

# Show a scrollbar.
c.scrolling.bar = True

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
c.scrolling.smooth = False

# Open new tabs (middleclick/ctrl+click) in the background.
c.tabs.background = True

# Behavior when the last tab is closed.
# Valid values:
#   - ignore: Don't do anything.
#   - blank: Load a blank page.
#   - startpage: Load the start page.
#   - default-page: Load the default page.
#   - close: Close the window.
c.tabs.last_close = "close"

# Padding around text for tabs
c.tabs.padding = {
    "left": 5,
    "right": 5,
    "top": 2,
    "bottom": 2,
}

c.tabs.position = "top"

# Which tab to select when the focused tab is removed.
# Valid values:
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
#   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = "prev"

# Width of the progress indicator (0 to disable).
# c.tabs.width.indicator = 0

# The page to open if :open -t/-b/-w is used without URL. Use
# `about:blank` for a blank page.
c.url.default_page = "about:blank"

# Definitions of search engines which can be used via the address bar.
# Maps a searchengine name (such as `DEFAULT`, or `ddg`) to a URL with a
# `{}` placeholder. The placeholder will be replaced by the search term,
# use `{{` and `}}` for literal `{`/`}` signs. The searchengine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
c.url.searchengines = {"DEFAULT": "https://www.google.com/search?q={}"}

# The page(s) to open at the start.
c.url.start_pages = "https://github.com/"

# The format to use for the window title. The following placeholders are
# defined:
#   * `{perc}`: The percentage as a string like `[10%]`.
#   * `{perc_raw}`: The raw percentage, e.g. `10`
#   * `{title}`: The title of the current web page
#   * `{title_sep}`: The string ` - ` if a title is set, empty otherwise.
#   * `{id}`: The internal window ID of this window.
#   * `{scroll_pos}`: The page scroll position.
#   * `{host}`: The host of the current web page.
#   * `{backend}`: Either ''webkit'' or ''webengine''
#   * `{private}` : Indicates when private mode is enabled.
c.window.title_format = "{private}{perc}{title}{title_sep}qutebrowser"
c.window.hide_decoration = False #True

c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'



c.colors.completion.fg = "#f3f3f3"
#c.colors.completion.bg = "#b2b2b2"

# c.colors.completion.alternate.bg = "#282828"

c.colors.completion.category.fg = "gray"

c.colors.completion.category.border.top = "#282828"

c.colors.completion.category.border.bottom = c.colors.completion.category.border.top

c.colors.completion.item.selected.fg = "#1d2021"

c.colors.completion.item.selected.bg = "#a89984"

c.colors.completion.item.selected.border.top = "#282828"

c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.border.top

c.colors.completion.match.fg = "#689d6a"

c.colors.completion.scrollbar.fg = c.colors.completion.fg

# c.colors.completion.scrollbar.bg = c.colors.completion.bg

c.colors.statusbar.normal.fg = "#a89984"

c.colors.statusbar.normal.bg = "#252525"

c.colors.statusbar.private.fg = c.colors.statusbar.normal.fg

c.colors.statusbar.private.bg = "#666666"

c.colors.statusbar.insert.fg = c.colors.statusbar.normal.fg

c.colors.statusbar.insert.bg = "#252525"

c.colors.statusbar.command.fg = c.colors.statusbar.normal.fg

c.colors.statusbar.command.bg = c.colors.statusbar.normal.bg

c.colors.statusbar.command.private.fg = c.colors.statusbar.private.fg

c.colors.statusbar.command.private.bg = c.colors.statusbar.private.bg

c.colors.statusbar.caret.fg = c.colors.statusbar.normal.fg

c.colors.statusbar.caret.bg = "#a89984"

c.colors.statusbar.caret.selection.fg = c.colors.statusbar.normal.fg

c.colors.statusbar.caret.selection.bg = "#458588"

c.colors.statusbar.progress.bg = "#83a598"

c.colors.statusbar.url.fg = c.colors.statusbar.normal.fg

c.colors.statusbar.url.success.http.fg = "#a89984"

c.colors.statusbar.url.success.https.fg = "#689d6a"

c.colors.statusbar.url.error.fg = "#fb4934"

c.colors.statusbar.url.warn.fg = "#b16286"

c.colors.statusbar.url.hover.fg = "#458588"

c.colors.tabs.odd.fg = "#a89984"

c.colors.tabs.odd.bg = "#1d2021"

c.colors.tabs.even.fg = "#a89984"

c.colors.tabs.even.bg = "#1d2021"

c.colors.tabs.selected.odd.fg = "#8ec07c"

c.colors.tabs.selected.odd.bg = "#282828"

c.colors.tabs.selected.even.fg = c.colors.tabs.selected.odd.fg

c.colors.tabs.selected.even.bg = c.colors.tabs.selected.odd.bg

c.colors.tabs.bar.bg = "#1d2021"

c.colors.tabs.indicator.start = "#ebdbb2"

c.colors.tabs.indicator.stop = "#b16286"

c.colors.tabs.indicator.error = "#d65d0e"

c.colors.tabs.indicator.system = "rgb"

c.colors.hints.fg = "#fbf1c7"

c.colors.hints.bg = "#665c54"

c.colors.hints.match.fg = "#fe8019"

c.colors.downloads.bar.bg = "#3c3836"

c.colors.downloads.start.fg = "#ebdbb2"

c.colors.downloads.start.bg = "#d65d0e"

c.colors.downloads.stop.fg = c.colors.downloads.start.fg

c.colors.downloads.stop.bg = "#689d6a"

c.colors.downloads.system.fg = "rgb"

c.colors.downloads.system.bg = "rgb"

c.colors.downloads.error.fg = "#b1a191"

c.colors.downloads.error.bg = "#d79921"

c.colors.webpage.bg = "#fbf1c7"

c.colors.keyhint.fg = "#d33682"

c.colors.keyhint.suffix.fg = "#2aa198"

c.colors.messages.error.fg = "#fdf6e3"

c.colors.messages.error.bg = "#dc322f"

c.colors.messages.error.border = "#fdf6e3"

c.colors.messages.warning.fg = "#859900"

c.colors.messages.warning.bg = "#fdf6e3"

c.colors.messages.warning.border = "#d47300"

c.colors.messages.info.fg = "#a89984"

c.colors.messages.info.bg = "#1d2021"

c.colors.messages.info.border = "#202020"

c.colors.prompts.fg = "#a89984"

c.colors.prompts.bg = "#282828"

c.colors.prompts.selected.bg = "#282828"
