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
c.content.headers.do_not_track = True

# User agent to send. Unset to send the default. Note that the value
# read from JavaScript is always the global value.
# Type: String
c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'

# List of domains that should always be loaded, despite being ad-
# blocked. Domains may contain * and ? wildcards and are otherwise
# required to exactly match the requested domain. Local domains are
# always exempt from hostblocking.
# Type: List of String
c.content.host_blocking.whitelist = ['*.flurry.com',
                                     '*.firebase.google.com',
                                     '*.google.com',
                                     '*.googleapis.com',
                                     '*.newrelic.com',
                                     '*.googleadservices.com',
                                     '*.gstatic.com',
                                     '*.googletagmanager.com',
                                     '*.githubapp.com',
                                     '*.nr-data.net',
                                     '*.qq.com',
                                     '*.googlecode.com',
                                     '*.google-analytics.com']

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
c.editor.command = ["emacsclient", "-c", "{}"]

# When a hint can be automatically followed without pressing Enter.
# Type: String
# Valid values:
#   - always: Auto-follow whenever there is only a single hint on a page.
#   - unique-match: Auto-follow whenever there is a unique non-empty match in either the hint string (word mode) or filter (number mode).
#   - full-match: Follow the hint when the user typed the whole hint (letter, word or number mode) or the element's text (only in number mode).
#   - never: The user will always need to press Enter to follow a hint.
c.hints.auto_follow = 'always'

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
# c.scrolling.bar = False

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
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?q={}',
                       'gh': 'https://github.com/search?q={}',
                       'so': 'https://stackoverflow.com/search?q={}',
                       'bd': 'https://www.baidu.com/s?wd={}'}

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
c.window.title_format = '{private}{perc}{current_title}{title_sep}qutebrowser'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = "16pt 'Fira code'"

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = "bold 16pt 'Fira code'"

# Font used for the debugging console.
# Type: QtFont
c.fonts.debug_console = "16pt 'Fira code'"

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = "16pt 'Fira code'"

# Font used for the hints.
# Type: Font
c.fonts.hints = "bold 16pt 'DejaVu Sans Mono'"

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = "16pt 'Fira code'"

# Font used for error messages.
# Type: Font
c.fonts.messages.error = "16pt 'Fira code'"

# Font used for info messages.
# Type: Font
c.fonts.messages.info = "16pt 'Fira code'"

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = "16pt 'Fira code'"

# Font used for prompts.
# Type: Font
c.fonts.prompts = "16pt 'Fira code'"

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = "16pt 'Fira code'"

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = "16pt 'Fira code'"

# Bindings for command mode
config.bind('<Ctrl+n>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl+p>', 'completion-item-focus prev', mode='command')


import dracula.draw

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    },
    'font': {
        'family': 'Menlo, Terminus, Monaco, Monospace',
        'size': 14
    }
})
