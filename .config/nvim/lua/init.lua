-- taken from https://github.com/smolck/dotfiles/blob/master/.config/nvim/lua/init.lua

local vim                  = vim
local os                   = require 'os'
local helpers              = require 'helpers'
local nvim_options         = helpers.nvim_options
local nvim_apply_mappings  = helpers.nvim_apply_mappings
local nvim_create_augroups = helpers.nvim_create_augroups
local plug                 = helpers.plug

local function create_mappings()
  local mappings = {
    ['n<Leader>rs'] = {':%s///<left><left>', noremap=true}
  }

  nvim_apply_mappings(mappings)
end

create_mappings()
