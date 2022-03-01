vim.api.nvim_exec([[
let s:clip = 'clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
    endif
]], true)
