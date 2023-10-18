local M = {}

M.get_git_web_link = function()
    -- Get the remote URL
    local handle = io.popen("git remote get-url origin")
    local ssh_url = handle:read("*a")
    handle:close()

    local https_url
    if ssh_url:find("git@gitlab.com:") then
        https_url = ssh_url:gsub('git@gitlab.com:', 'https://gitlab.com/')
        https_url = https_url:gsub('%.git\n$', '')
    elseif ssh_url:find("git@github.com:") then
        https_url = ssh_url:gsub('git@github.com:', 'https://github.com/')
        https_url = https_url:gsub('%.git\n$', '')
    else
        print("Remote URL format not recognized.")
        return
    end

    -- Get current file relative to git root and the line number
    local handle

    -- Get the absolute path to the git repository root
    handle = io.popen("git rev-parse --show-toplevel")
    local git_root = handle:read("*a"):gsub('\n', '')
    handle:close()

    -- Get the absolute path to the current file
    local abs_file_path = vim.fn.expand('%:p')

    -- Get the relative path of the file with respect to the git repository root
    local rel_file = abs_file_path:sub(#git_root + 2)  -- "+ 2" to also remove the trailing slash



    local line_num = vim.fn.line('.')

    -- Construct the final link
    local link
    if https_url:find("gitlab.com") then
        link = string.format("%s/-/blob/master/%s#L%d", https_url, rel_file, line_num)
    else -- Assuming GitHub format if not GitLab
        link = string.format("%s/blob/master/%s#L%d", https_url, rel_file, line_num)
    end

    -- Load the link to the clipboard (assuming you have xclip or pbcopy)
    vim.fn.system(string.format("echo '%s' | xclip -selection clipboard", link))

    print("Link copied to clipboard!")
end

return M

