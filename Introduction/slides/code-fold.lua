local str = pandoc.utils.stringify

local template_fold_p1 = [[
<details>
  <summary>
  %s
  </summary>
]]

local template_fold_p2 = [[
%s
</details>
]]

function Div(el)
  if el.attributes['code-fold'] then
    local code_summary = str(el.attributes['code-summary'])
    local fold = string.format(template_fold_p1, code_summary)
    local fold_rb1 = pandoc.RawBlock('html', fold)
    local fold_rb2 = pandoc.RawBlock('html', template_fold_p2)
    el.content:insert(1, fold_rb1)
    el.content:insert(fold_rb1)
    return el
  end
end