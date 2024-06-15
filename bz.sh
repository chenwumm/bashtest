echo "晨雾扒站服务"
read -p "请输入你要扒的网站(不要忘掉前面的https://和后面的/):" ws
mkdir $ws
touch $ws/index.html
html=`cu
