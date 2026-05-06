#!/usr/bin/env bash
# cron:0 0 1 1 *
# new Env("bili尝试修复异常[dev先行版]")

. /root/.bashrc

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
baihu_bili_repo_dir="$(dirname $(dirname $(dirname "$CURRENT_DIR")))"
echo "bili仓库目录: $baihu_bili_repo_dir"


echo -e "清理缓存...\n"
cd $baihu_bili_repo_dir
find . -type d -name "bin" -exec rm -rf {} +
find . -type d -name "obj" -exec rm -rf {} +
echo -e "清理完成\n"

dotnet() {
    mise exec dotnet@8 -- dotnet "$@"
}

echo "检测dotnet..."
dotnetVersion=$(dotnet --version 2>/dev/null || true)
echo "当前dotnet版本：$dotnetVersion"
if [[ $(echo "$dotnetVersion" | grep -oE '^[0-9]+') -ge 8 ]]; then
    echo "已安装，且版本满足"
else
    echo "which dotnet: $(which dotnet)"
    echo "Path: $PATH"
fi
echo "检测dotnet结束"