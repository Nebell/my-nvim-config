-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\ADMINI~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\ADMINI~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\ADMINI~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\ADMINI~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\ADMINI~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["argtextobj.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\argtextobj.vim",
    url = "https://github.com/vim-scripts/argtextobj.vim"
  },
  ["bufdelete.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\2B\0\2\1K\0\1\0\22bufferline_config\nTheme\nsetup\15bufferline\frequire,\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\14async_run\nutils\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["diffview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["github-nvim-theme"] = {
    config = { "\27LJ\2\nƒ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\rsidebars\1\3\0\0\rterminal\vpacker\1\0\2\15dark_float\2\16theme_style\tdark\nsetup\17github-theme\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nV\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\nsetup\rgitsigns\14async_run\nutils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\n$\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\tleap\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\2B\0\2\1K\0\1\0\19lualine_config\nTheme\nsetup\flualine\frequire,\1\0\3\0\3\0\0056\0\0\0009\0\1\0003\2\2\0B\0\2\1K\0\1\0\0\14async_run\nutils\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimS\0\1\3\1\3\0\r-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\1\0019\1\2\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\nabort\fmapping\fvisibleÇ\1\0\1\6\1\b\0\26-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\18€-\1\0\0009\1\1\1B\1\1\2\14\0\1\0X\2\t€-\2\0\0009\2\2\0025\4\5\0-\5\0\0009\5\3\0059\5\4\5=\5\6\4B\2\2\1X\2\6€-\2\0\0009\2\a\2B\2\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\fconfirm\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\23get_selected_entry\fvisibleî\5\1\0\f\0-\0k6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\f\4=\4\t\0039\4\r\0009\4\14\0049\4\15\0045\6\17\0009\a\r\0009\a\16\a)\tüÿB\a\2\2=\a\18\0069\a\r\0009\a\16\a)\t\4\0B\a\2\2=\a\19\0069\a\r\0009\a\20\aB\a\1\2=\a\21\0069\a\r\0003\t\22\0004\n\5\0006\v\23\0>\v\1\n6\v\24\0>\v\2\n6\v\25\0>\v\3\n6\v\26\0>\v\4\nB\a\3\2=\a\27\0069\a\r\0009\a\28\aB\a\1\2=\a\29\0069\a\r\0003\t\30\0005\n\31\0B\a\3\2=\a \6B\4\2\2=\4\r\0039\4\b\0009\4!\0044\6\3\0005\a\"\0>\a\1\0065\a#\0>\a\2\0064\a\3\0005\b$\0>\b\1\aB\4\3\2=\4!\3B\1\2\0019\1\2\0009\1%\0015\3&\0005\4'\0009\5\r\0009\5\14\0059\5%\5B\5\1\2=\5\r\0044\5\3\0005\6(\0>\6\1\5=\5!\4B\1\3\0019\1\2\0009\1%\1'\3)\0005\4*\0009\5\r\0009\5\14\0059\5%\5B\5\1\2=\5\r\0049\5\b\0009\5!\0054\a\3\0005\b+\0>\b\1\a4\b\3\0005\t,\0>\t\1\bB\5\3\2=\5!\4B\1\3\0012\0\0€K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\n<Tab>\1\4\0\0\6i\6s\6c\0\t<CR>\fconfirm\n<ESC>\6c\6s\6i\6n\0\14<C-Space>\rcomplete\n<C-D>\n<C-U>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\18documentation\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp.setup\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n[\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\nsetup\18nvim-surround\14async_run\nutils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\nV\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\0\1\0\1\nwidth\3\23\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n‘\1\0\2\t\0\a\1\21*\2\0\0006\3\0\0006\5\1\0009\5\2\0059\5\3\0056\6\1\0009\6\4\0069\6\5\6\18\b\1\0B\6\2\0A\3\1\3\15\0\3\0X\5\a€\15\0\4\0X\5\5€9\5\6\4\1\2\5\0X\5\2€+\5\2\0L\5\2\0K\0\1\0\tsize\22nvim_buf_get_name\bapi\ffs_stat\tloop\bvim\npcall€€€dK\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\0À\nsetup\28nvim-treesitter.configs\frequireò\1\1\0\4\0\v\0\0175\0\1\0005\1\0\0=\1\2\0005\1\3\0004\2\0\0=\2\4\0013\2\5\0=\2\4\1=\1\6\0006\1\a\0'\3\b\0B\1\2\0029\1\t\0013\3\n\0B\1\2\0012\0\0€K\0\1\0\0\14async_run\nutils\frequire\14highlight\0\fdisable\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\2\17auto_install\2\17sync_install\1\1\a\0\0\6c\blua\bvim\thelp\ago\vpython\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  rainbow = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\rainbow",
    url = "https://github.com/luochen1990/rainbow"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\nç\2\0\0\6\0\22\0\"5\0\6\0005\1\3\0006\2\0\0'\4\1\0B\2\2\0029\2\2\2>\2\1\0015\2\4\0=\2\5\1=\1\a\0005\1\t\0006\2\0\0'\4\1\0B\2\2\0029\2\b\2>\2\1\0015\2\n\0=\2\5\1=\1\v\0006\1\0\0'\3\f\0B\1\2\0029\1\r\0015\3\19\0005\4\17\0005\5\14\0=\0\15\5=\0\16\5=\5\18\4=\4\20\0034\4\0\0=\4\21\3B\1\2\1K\0\1\0\15extensions\rdefaults\1\0\0\rmappings\1\0\0\6n\6i\1\0\0\nsetup\14telescope\n<C-k>\1\0\2\vnowait\2\vsilent\2\1\0\1\ttype\vaction\28move_selection_previous\n<C-j>\1\0\0\topts\1\0\2\vnowait\2\vsilent\2\1\0\1\ttype\vaction\24move_selection_next\22telescope.actions\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-floaterm"] = {
    commands = { "FloatermToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  },
  ["vista.vim"] = {
    commands = { "Vista", "Vista!", "Vista!!" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^bufferline"] = "bufdelete.nvim",
  ["telescope.*"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\n$\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimS\0\1\3\1\3\0\r-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\1\0019\1\2\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\nabort\fmapping\fvisibleÇ\1\0\1\6\1\b\0\26-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\18€-\1\0\0009\1\1\1B\1\1\2\14\0\1\0X\2\t€-\2\0\0009\2\2\0025\4\5\0-\5\0\0009\5\3\0059\5\4\5=\5\6\4B\2\2\1X\2\6€-\2\0\0009\2\a\2B\2\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\fconfirm\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\23get_selected_entry\fvisibleî\5\1\0\f\0-\0k6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0035\4\v\0009\5\b\0009\5\t\0059\5\n\5B\5\1\2=\5\f\4=\4\t\0039\4\r\0009\4\14\0049\4\15\0045\6\17\0009\a\r\0009\a\16\a)\tüÿB\a\2\2=\a\18\0069\a\r\0009\a\16\a)\t\4\0B\a\2\2=\a\19\0069\a\r\0009\a\20\aB\a\1\2=\a\21\0069\a\r\0003\t\22\0004\n\5\0006\v\23\0>\v\1\n6\v\24\0>\v\2\n6\v\25\0>\v\3\n6\v\26\0>\v\4\nB\a\3\2=\a\27\0069\a\r\0009\a\28\aB\a\1\2=\a\29\0069\a\r\0003\t\30\0005\n\31\0B\a\3\2=\a \6B\4\2\2=\4\r\0039\4\b\0009\4!\0044\6\3\0005\a\"\0>\a\1\0065\a#\0>\a\2\0064\a\3\0005\b$\0>\b\1\aB\4\3\2=\4!\3B\1\2\0019\1\2\0009\1%\0015\3&\0005\4'\0009\5\r\0009\5\14\0059\5%\5B\5\1\2=\5\r\0044\5\3\0005\6(\0>\6\1\5=\5!\4B\1\3\0019\1\2\0009\1%\1'\3)\0005\4*\0009\5\r\0009\5\14\0059\5%\5B\5\1\2=\5\r\0049\5\b\0009\5!\0054\a\3\0005\b+\0>\b\1\a4\b\3\0005\t,\0>\t\1\bB\5\3\2=\5!\4B\1\3\0012\0\0€K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\rnvim_lsp\fsources\n<Tab>\1\4\0\0\6i\6s\6c\0\t<CR>\fconfirm\n<ESC>\6c\6s\6i\6n\0\14<C-Space>\rcomplete\n<C-D>\n<C-U>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\18documentation\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Vista', function(cmdargs)
          require('packer.load')({'vista.vim'}, { cmd = 'Vista', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vista.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Vista ', 'cmdline')
      end})
pcall(vim.cmd, [[au CmdUndefined Vista! ++once lua require"packer.load"({'vista.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined Vista!! ++once lua require"packer.load"({'vista.vim'}, {}, _G.packer_plugins)]])
pcall(vim.api.nvim_create_user_command, 'NvimTreeToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'FloatermToggle', function(cmdargs)
          require('packer.load')({'vim-floaterm'}, { cmd = 'FloatermToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-floaterm'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('FloatermToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-surround', 'diffview.nvim', 'argtextobj.vim', 'gitsigns.nvim', 'nvim-treesitter'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au UIEnter * ++once lua require("packer.load")({'github-nvim-theme', 'lualine.nvim'}, { event = "UIEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'rainbow', 'nvim-lspconfig', 'bufferline.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
