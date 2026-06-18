local status_ok, otter = pcall(require, "otter")
if not status_ok then
  return
end

-- Languages you want to extract from the HTML file
local embedded_languages = { "javascript", "css" }

-- Set to true to enable linting/diagnostics
local main_diagnostics = true

-- Set to true to wrap completions 
local emap = true

-- Trigger otter activation for the current buffer
otter.activate(embedded_languages, true, true, nil)
