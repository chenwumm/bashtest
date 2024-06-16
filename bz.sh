echo "晨雾扒站服务"
read -p "请输入你要扒的网站(记得加上https://和后面的/):" ws
echo "正在扒取,请耐心等待..."
mkdir 晨雾扒站服务
touch 晨雾扒站服务/index.html
html=`curl -s $ws`
echo $html > 晨雾扒站服务/index.html
echo "扒站成功,保存在 ~/晨雾扒站服务/index.html"
echo "你可以输入cat 晨雾扒站服务/index.html来查看这个文件"
echo "晨雾官网:https://chenwumm.github.io/ 欢迎访问!"
