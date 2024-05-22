require('nvim_comment').setup({
    marker_padding = true,
    -- should comment out empty or whitespace only lines
    comment_empty = true,
    -- trim empty comment whitespace
    comment_empty_trim_whitespace = true,
    -- Should key mappings be created
    create_mappings = true,
    -- Normal mode mapping left hand side
    line_mapping = "<leader>;",
    -- Visual/Operator mapping left hand side
    operator_mapping = "<leader>gc",
    -- text object mapping, comment chunk,,
    comment_chunk_text_object = "ic",
    -- Hook function to call before commenting takes place
    hook = nil
})
