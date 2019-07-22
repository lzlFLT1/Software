" .vimrc 放在 ～ 目录下

" 字符编码格式配置
set encoding=utf-8                  " vim 内部使用的字符编码方式，即 vim 的 buffer、寄存器、脚本中的字符串，都使用该编码格式
set termencoding=utf-8              " vim terminal 编码，显示时，vim 会把内部编码转换成 terminal 编码，如果无法转换，则以 ？ 显示    
set fileencodings=utf-8,latin-1     " vim 从硬盘读取文件时，依次使用值中的编码方式对文件进行解码，如果成功，那么把 fileencoding 设置为当前使用的值

" Tab 键处理方式配置
set tabstop=4                       " 设置一个 \t 字符对应的列数
set expandtab                       " 设置 \t 字符用 Space 替代
set shiftwidth=4                    " 配置使用一次 << 和 >> 命令移动时的宽度为 4
" 软件计算是否插入 \t 符，
" 假设 tabstop=6，softtabstop=4， softtabstop 比较小的情况
" 按一次 tab 键， 结果： 4 space
" 再按一次 tab 键， 结果： 1 \t + 2 space
" 假设 tabstop=6，softtabstop=8， softtabstop 比较大的情况
" 按一次 tab 键， 结果： 1 \t + 2 space
" 按第二次 tab 键， 结果： 2 \t + 4 space
" 总的意思就是，满足 tabstop 的空格数替换为 \t，剩余的用 空格 填充
set softtabstop=4                   " 设置按一次 tab 键输入的列数


" 缩进配置
set autoindent                      " 自动对齐，跟上一行缩进一样
filetype plugin indent on           " 开启根据文件类型使用不同的缩进策略。缩进策略保存在 /usr/share/vim/vim74/indent 目录下面

" 显示配置
syntax on                           " 配置语法高亮
set number                          " 设置显示行号
set cursorline                      " 配置当前行高亮
"set guifont=Courier_New:h10:cANSI  " 设置字体
set ruler                           " 显示标尺
set showcmd                         " 输入的命令显示出来，看的清楚些
set showmatch                       " 括号匹配模式
set matchtime=1                     " 匹配括号高亮的时间（单位是十分之一秒）
set so=3                            " 设置页面滚动时保留 3 行原屏幕显示的当
set scrolloff=3                     " 光标移动到buffer的顶部和底部时保持3行距离
set wildmenu                        " 智能补全命令行
set laststatus=2                    " 启动显示状态行(1),总是显示状态行(2)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}       " 状态行显示格式



" 杂项配置
set nocompatible                    " 使用 vim 自己的键盘模式，不使用 vi 的默认键盘布局
set clipboard+=unnamed              " 与windows共享剪贴板
set mouse=a                         " 使 vim 支持鼠标操作


" 备份设置
set nobackup                        " 不要备份文件
set noswapfile                      " 禁止使用 swap 文件， Vim 在编辑一个文件的时候首先把文件拷贝成一个临时的 swap 文件，只有你使用 :w 保存之后才写入源文件中        


" 自动换行配置
set nowrap                          " 关闭 vim 自动换行
set colorcolumn=81                  " 显示一条竖线表示代码第 81 个字符
set fo+=mB                          " 使上述配置对中文也能生效，其中 m 表示允许在两个汉字中间换行，而 B 表示将两行合为一行的时候不要在两个汉字之间加入空格。

" 搜索配置
set ic                              " 设置搜索不区分大小写
set hlsearch                        " 设置高亮搜索
set incsearch                       " 实时搜索，即边输入边搜索
set ignorecase                      " 设置匹配的时候忽略大小写
set noignorecase                    " 设置匹配的时候区分大小写

" 展开折叠配置
set foldenable                      " 允许折叠  
set nofoldenable                    " 不使用代码折叠
set foldmethod=manual               " 手动折叠


" 使退格键（backspace）正常处理indent, eol, start等
" 0 same as ":set backspace=" (Vi compatible)
" 1 same as ":set backspace=indent,eol"
" 2 same as ":set backspace=indent,eol,start"    
set backspace=2     




" 快捷键配置
nnoremap  j  k                  " 普通模式下，非递归，把原来的 k 键 映射成 j 键，非递归模式
nnoremap  k  j                  " 普通模式下，非递归，把原来的 j 键 映射成 k 键，非递归模式
nmap lh   ^                     " 普通模式下， ^ 字符将光标移到行首
nmap le   $                     " 普通模式下， $ 字符将光标移到行首

" 配置括号自动带出
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O
