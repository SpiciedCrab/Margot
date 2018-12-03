#!/bin/bash

JAZZY=/usr/local/bin/jazzy

TARGET=${TARGET_NAME}
PROJECT=${TARGET/"_Example"/""}

DIR="$( cd .. "$(dirname)" && pwd)"
cd ${DIR}
ls
echo "Jazzy in :${DIR} with project: ${PROJECT} "


JAZZY ${PROJECT} --swift-version 4.2 --podspec ${PROJECT}.podspec --min-acl internal


#Path to swiftlint
SWIFT_LINT=/usr/local/bin/swiftlint
GIT_ROOT=$(git rev-parse --show-toplevel)

#if $SWIFT_LINT >/dev/null 2>&1; then
if [[ -e "${SWIFT_LINT}" ]]; then
    count=0

    DIR="$( cd .. "$(dirname)" && pwd)"
    echo "检测目录:${DIR}"
    function read_dir(){
        for file in $(ls $1 | grep -v "Example"); do   #遍历文件夹下的所有文件包括子文件夹。Example除外
            if [ -d $1"/"$file ]  #注意此处之间一定要加上空格，否则会报错 如果是文件夹
            then
                read_dir $1"/"$file #递归啦
            else
                if [[ "${file}" == *.swift ]]; then  #判断swift文件后缀 
                    export  SCRIPT_INPUT_FILE_$count=$1"/"$file  #输入路径
                    count=$((count + 1)) #count+1
                fi
                # echo $1"/"$file   #在此处处理文件即可
            fi
        done
    }   

    read_dir $DIR
   


#for file_path in $(git diff --name-only --cached | grep ".swift$"); do
##### Check for modified files in unstaged/Staged area #####这里是只检测修改的swift文件 Example文件夹里不参与
   # for file_path in $(git diff --name-only | grep ".swift$" | grep -v "Example"); do
   #     export SCRIPT_INPUT_FILE_$count="$GIT_ROOT/$file_path"
   #     count=$((count + 1))
   # done


   #####这个很怪 我也不知道
   # for file_path in $(git ls-files -m --exclude-from=.gitignore | grep ".swift$"); do
   #     export SCRIPT_INPUT_FILE_$count="$GIT_ROOT/$file_path"
   #     count=$((count + 1))
   # done


##### Make the count avilable as global variable #####
    export SCRIPT_INPUT_FILE_COUNT=$count

    echo "检测文件个数:${SCRIPT_INPUT_FILE_COUNT}"

##### Lint files or exit if no files found for lintint #####
    if [ "$count" -ne 0 ]; then
        echo "Found lintable files! Linting and fixing the fixible parts..."

        DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        CONFIG_PATH="$DIR/.swiftlint.yml"

        #修改模版中的输出类型 ， json -》 xcode
        sed -i '' 's/json/xcode/g'  $CONFIG_PATH
        
        $SWIFT_LINT autocorrect --use-script-input-files --config $CONFIG_PATH #autocorrects before commit.
        $SWIFT_LINT lint --use-script-input-files --config $CONFIG_PATH
    else
        echo "No files to lint!"
        exit 0
    fi

    RESULT=$?

    if [ $RESULT -eq 0 ]; then
        echo ""
        echo "Violation found of the type WARNING! Must fix before commit!"
    else
        echo ""
        echo "Violation found of the type ERROR! Must fix before commit!"
    fi
    exit $RESULT
else
#### If SwiftLint is not installed, do not allow commit
    echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
    echo "If you have Homebrew, you can directly use 'brew install swiftlint' to install SwiftLint"
    exit 1
fi
