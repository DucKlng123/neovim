---@class render.md.test.MarkDetails: render.md.test.MarkInfo
local MarkDetails = {}
MarkDetails.__index = MarkDetails

---@param row integer
---@param col integer
---@param details vim.api.keyset.extmark_details
---@return render.md.test.MarkDetails
function MarkDetails.new(row, col, details)
    local self = setmetatable({}, MarkDetails)
    self.row = { row, details.end_row }
    self.col = { col, details.end_col }
    self.hl_eol = details.hl_eol
    self.hl_group = details.hl_group
    if self.hl_group ~= nil then
        self.hl_group = MarkDetails.simplify(self.hl_group)
    end
    ---@diagnostic disable-next-line: assign-type-mismatch
    self.conceal = details.conceal
    ---@diagnostic disable-next-line: undefined-field
    self.conceal_lines = details.conceal_lines
    self.virt_text = details.virt_text
    if self.virt_text ~= nil then
        for _, text in ipairs(self.virt_text) do
            text[2] = MarkDetails.simplify(text[2])
        end
    end
    self.virt_text_pos = details.virt_text_pos
    self.virt_text_win_col = details.virt_text_win_col
    self.virt_lines = details.virt_lines
    if self.virt_lines ~= nil then
        for _, line in ipairs(self.virt_lines) do
            for _, text in ipairs(line) do
                text[2] = MarkDetails.simplify(text[2])
            end
        end
    end
    self.virt_lines_above = details.virt_lines_above
    self.sign_text = details.sign_text
    self.sign_hl_group = details.sign_hl_group
    if self.sign_hl_group ~= nil then
        self.sign_hl_group = MarkDetails.simplify(self.sign_hl_group)
    end
    if details.priority ~= 4096 then
        self.priority = details.priority
    end
    return self
end

---@param highlights number|string|string[]
---@return string
function MarkDetails.simplify(highlights)
    if type(highlights) == 'number' then
        return tostring(highlights)
    end
    if type(highlights) == 'string' then
        highlights = { highlights }
    end
    local result = {}
    for _, highlight in ipairs(highlights) do
        highlight = string.gsub(highlight, 'RenderMarkdown', 'Rm')
        table.insert(result, highlight)
    end
    return table.concat(result, ':')
end

---@return integer[]
function MarkDetails:priorities()
    local virt_row = 0
    if self.virt_lines ~= nil then
        virt_row = self.virt_lines_above and -0.5 or 0.5
    end

    local win_col = self.virt_text_win_col or 0

    local width = 0
    for _, text in ipairs(self.virt_text or {}) do
        width = width + #text[1]
    end
    for _, line in ipairs(self.virt_lines or {}) do
        for _, text in ipairs(line) do
            width = width + #text[1]
        end
    end

    ---@type integer[]
    return {
        -- rows
        self.row[1] + virt_row,
        (self.row[2] or self.row[1]) + virt_row,
        -- cols
        math.max(self.col[1], win_col),
        math.max((self.col[2] or self.col[1]), win_col),
        -- signs
        self.sign_text ~= nil and 0 or 1,
        -- inline text
        self.virt_text_pos == 'inline' and 0 or 1,
        -- text width
        width,
        -- conceal
        self.conceal ~= nil and 0 or 1,
        self.conceal_lines ~= nil and 0 or 1,
    }
end

---@param a render.md.test.MarkDetails
---@param b render.md.test.MarkDetails
---@return boolean
function MarkDetails.__lt(a, b)
    local as, bs = a:priorities(), b:priorities()
    assert(#as == #bs)
    for i = 1, #as do
        if as[i] ~= bs[i] then
            return as[i] < bs[i]
        end
    end
    return false
end

return MarkDetails
