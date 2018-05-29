##### bash profile opration #####
alias ebash='vim ~/.bash_profile'
alias sbash='source ~/.bash_profile'
alias ebashrc='vim ~/.bashrc'
alias sbashrc='source ~/.bashrc'

##### tar useful aliases #####
alias ztar='tar -zcvf'
alias uztar='tar -zxvf'

##### common  useful aliases #####
alias cd..='cd ..'
alias la='ls -a'
alias cl='clear'
alias md='mkdir'
alias rd='rmdir'
alias ll='ls -l'

#misc alias
alias ip='ifconfig |grep "inet 192" |cut -c 7-19'
alias vt='curl http://www.vim-tips.com/random_tips/txt && echo'

##### git useful aliases #####
alias gs='git status -s'
alias gmt='git mergetool'
alias gc='git commit'
alias gca='git commit -a'
alias gb='git branch'
alias gpo='git push origin'
alias gaa='git add .'
alias gco='git checkout'
alias glg='git log --graph'
alias gl='git log'
alias gm='git merge'
alias gtk='gitk'
alias gcl='git clone'
alias gp='git push'
alias gd='git diff'
alias gsl='git stash list'
alias gsa='git stash apply'
alias gpu='git pull'
alias gpuo='git pull origin'
alias gstash='git stash'
alias gpop='git stash pop'

##### svn useful aliases #####
alias svns='svn status .'

##### common useful functions #####
pcol(){
    awk -v col=$1 '{print $col}'
}

l_scp(){
    src_f=$1
    dst_f=$2
    #拷文件夹
    if [ -d $src_f ];then
        if [ ! -d $dst_f ];then
            mkdir -p $dst_f
        fi
        cp -rf $src_f $dst_f/
    else
        #拷文件
        f_name=${dst_f%%/*}
        #处理拷文件到文件夹 l_scp /a/b/c/game.pdm /c/d/e/
        if [ ${#f_name} == 0 ] && [ ! -e $dst_f ];then
            echo 'mkdir' $dst_f
            mkdir -p $dst_f
        fi
        cp -f $src_f $dst_f
    fi
}

##### svn useful functions #####
svnd(){
    svn st | awk '{if ( $1 == "!") { print $2}}' | xargs svn delete
}
svna(){
    svn st | awk '{if ( $1 == "?") { print $2}}' | xargs svn add
}

##### git useful functions #####
gita(){
    git status -s | awk '{if ( $1 == "??") { print $2}}' | xargs git add
}

gitd(){
    git status -s | awk '{if ( $1 == "D") { print $2}}' | xargs git add
}

usestash(){
    gs | grep UU |pcol 2 | xargs -I{} git checkout --theirs "{}"
    gs | grep UU |pcol 2 | xargs -I{} git add "{}"
}

useours(){
    gs | grep UU |pcol 2 | xargs -I{} git checkout --ours "{}"
    gs | grep UU |pcol 2 | xargs -I{} git add "{}"
}

upgit(){
    gstash && gpuo && gpop
}
