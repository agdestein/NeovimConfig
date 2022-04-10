Neuron = require("neuron")
NeuronTelescope = require("neuron/telescope")
NeuronCmd = require("neuron/cmd")
NeuronConfig = require("neuron/config")

-- these are all the default values
Neuron.setup({
    virtual_titles = true,
    mappings = false,
    run = nil, -- function to run when in neuron dir
    neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
    leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
})

-- Default keybindings
WhichKey.register({
    -- -- Click enter on [[my_link]] or [[[my_link]]] to enter it
    -- ["<CR>"] = { Neuron.enter_link, "Enter link" },

    gz = {
        -- Create a new note
        n = {
            function()
                NeuronCmd.new_edit(NeuronConfig.neuron_dir)
            end,
            "Create new note",
        },

        -- Find your notes, click enter to create the note if there are not notes that match
        z = { NeuronTelescope.find_zettels, "Find zettels" },

        -- Insert the id of the note that is found
        Z = {
            function()
                NeuronTelescope.find_zettels({ insert = true })
            end,
            "Insert ID",
        },

        -- Find the backlinks of the current note all the note that link this note
        b = { NeuronTelescope.find_backlinks, "Find backlinks" },

        -- Same as above but insert the found id
        B = {
            function()
                NeuronTelescope.find_backlinks({ insert = true })
            end,
            "Insert backlink",
        },

        s = { Neuron.rib, "Rib"},
        i = { Neuron.got_index, "Go to index"},

        -- Click enter on [[my_link]] or [[[my_link]]] to enter it
        ["<CR>"] = { Neuron.enter_link, "Enter link" },

        -- Find all tags and insert
        t = { NeuronTelescope.find_tags, "Find tags" },

        -- Start the neuron server and render markdown, auto reload on save
        -- Go to next [[my_link]] or [[[my_link]]]
        ["]"] = { Neuron.goto_next_extmark, "Go to next extmark" },

        -- Go to previous
        ["["] = { ":lua require'neuron'.goto_prev_extmark()<CR>]]", "Go to previous extmark" },
    },
}, { noremap = true, mode = "n" })
