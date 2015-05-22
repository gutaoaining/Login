 function clur(j,id) {  
 //传入的单元格列号和单元格的id
         var str=id.toString();
		 //将传入的id转化为字符类型的str
         var value=document.getElementById(str).value;
		 //获取str的value值
         if (j == 0) {
		 	//判断是否是要判断的第一列的数据
		 	var i = parseFloat(value);
			//将value的转化为float型
		 	if (i<80 || i>250) {
				var warning=window.confirm("您输入的身高不在合理范围内！请重新输入！");
				if(warning){
					document.getElementById(id).value="";
				}else{
					document.getElementById(id).value="";
				}
		 	}
		 }
		 if (j == 1) {
		 	//判断是否是要判断的第二列的数据
		 	var i = parseFloat(value);
			//将value的值转化为float型
		    if (i<14 || i>200) {
				var warning=window.confirm("您输入的体重不在合理范围内！请重新输入！");
				if(warning){
					document.getElementById(id).value="";
				}else{
					document.getElementById(id).value="";
				}
			}
		 }
		 if (j == 2) {
		 	//判断是否是要判断的第三列的数据
		 	var i = parseInt(value);
			//将value的值转化为float型
		    if (i<500 || i >9999) {
				var warning=window.confirm("您输入的肺活量不在合理范围内！请重新输入！");
				if(warning){
					document.getElementById(id).value="";
				}else{
					document.getElementById(id).value="";
				}
			}
		 }
		 if (j == 3) {
		 	//判断是否是要判断的第四列的数据
		 	var i = parseFloat(value);
			//将value的值转化为float型
		    if (i <5 || i >20) {
				var warning=window.confirm("您输入的50米跑，不在合理范围内！请重新输入！");
				if(warning){
					document.getElementById(id).value="";
				}else{
					document.getElementById(id).value="";
				}
			}
		 }
		 
		 if (j == 4) {
		 	//判断是否是要判断的第五列的数据
		 	var i = parseFloat(value);
			//将value的值转化为float型
		    if (i <0.5 || i >4) {
				var warning=window.confirm("您输入的立定跳远，不在合理范围内！请重新输入！");
				if(warning){
					document.getElementById(id).value="";
				}else{
					document.getElementById(id).value="";
				}
			}
		 }
		 if (j == 5) {
		 	//判断是否是要判断的第六列的数据
		 	var i = parseFloat(value);
			//将value的值转化为float型
		    if (i <-30 || i >40) {
			  var warning=window.confirm("您输入的坐位体前屈，不在合理范围内！请重新输入！");
				if(warning){
					document.getElementById(id).value="";
				}else{
					document.getElementById(id).value="";
				}
			}
		 }
		 if (j == 6) {
		 	//判断是否是要判断的第七列的数据
		 	var i = parseFloat(value);
			//将value的值转化为float型
		    if (i <2 || i >9) {
			    var warning=window.confirm("您输入的跑步800/1000米，不在合理范围内！请重新输入！");
				if(warning){
					document.getElementById(id).value="";
				}else{
					document.getElementById(id).value="";
				}
			}
		 }
		 if (j == 7) {
		 	//判断是否是要判断的第八列的数据
		 	var i = parseInt(value);
			//将value的值转化为float型
		    if (i <0 || i >99) {
				//引体向上/仰卧起坐是否在0到99之间，如果不在消息框提示
				var warning=window.confirm('您输入的引体向上/仰卧起坐不在合理范围内！请重新输入！');
				if(warning){
					document.getElementById(id).value="";
				}else{
					document.getElementById(id).value="";
				}
			}
		 } 
}