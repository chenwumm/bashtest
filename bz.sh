echo "晨雾扒站服务"
read -p "请输入你要扒的网站(记得加上https://和后面的/):" ws
echo "正在扒取,请耐心等待..."
mkdir 晨雾扒站服务
touch 晨雾扒站服务/index.html
html=`curl -s $ws`
echo $html > 晨雾扒站服务/index.html

