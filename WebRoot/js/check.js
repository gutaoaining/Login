$(function(){
	$('#listGrid').datagrid({
		url : getRequestPath('listShow'),
		//获取数据源
		striped: true,
		//是否显示斑马线效果
		columns:[[
			{field:'stunumber',title:'学号', width:80},
			{field:'stuname',title:'姓名', width:80},
			{field:'class_id',title:'班级编号', width:100},
			{field:'class_name',title:'班级名称', width:100},
			{field:'nationalid',title:'民族编号',width:100},
			{field:'sex',title:'性别', width:100},
			{field:'stu_sources',title:'生源', width:100},
			{field:'birthday',title:'出生日期', width:100},
			{field:'stu_enr',title:'年级编号', width:80},
			{field:'per_id',title:'身份证号', width:150},
			{field:'stu_adress',title:'家庭住址', width:250}
		]]
		//列名，列名id ，谨记此处的fieldid必须和返回的数值名一致
	});
	$("#commit").bind('click',function(){
		//commit是我的提交按钮
		 var key=encodeURI($("#keyword").val());
		$('#listGrid').datagrid({url : getRequestPath('listShow?data='+key)});
		//将数据传给listshow
	});
	$("#add").bind('click',function(){
		$("#listForm").form("reset");
		//重置listForm，目的是为了清空之前的数据防止影响
		$('#listInput').window({title :'信息添加'}).window('open');
		//触发listInput打开,窗口的标题设置为'信息添加'
		$("#listSave").unbind('click');
		//撤销绑定listSave的绑定事件
		$("#listSave").bind('click',function(){
			//listSave绑定单击事件
			$.ajax({
				//ajax传输
				type : "POST",
				//传送数据类型为post
				url : getRequestPath('listAdd'),
				//目的地址，也可以说的传达到的目标链接
				data:$("#listForm").serialize(),
				//表进行序列化，提交
				async : true,
				//是否异步
				dataType : 'json',
				//返回数据类型为json
				error : function(request) {
					$.messager.show({title : '提示',msg : '学号，年级编号和性别不能为空'});
	                  //连接出错时提示			
				},
				success : function(data) {
					//成功时提示
					if(data[0].success){//数据返回的第一个名值对是我用来判断是否真确的
					$('#listGrid').datagrid('reload');	//刷新表格
					$.messager.show({title : '提示',msg : '操作成功'});
					$('#listInput').window('close');//关闭listInput
					}else{
						$.messager.show({title : '提示',msg : '操作失败（可能因为学号为空等）'});
					   //失败时提示，servlet出错时提示
					}
				}
			});
		})
	});
	
	$("#edit").bind('click',function(){
		//编辑按钮绑定单击事件
		var row = $('#listGrid').datagrid('getSelected');//选中行
		if(row){
			//选中不为空时，为编辑界面加载数据
			$("#listForm #stunumber").val(row.stunumber);
			$("#listForm #stuname").val(row.stuname);
			$("#listForm #class_id").val(row.class_id);
			$("#listForm #class_name").val(row.class_name);
			$("#listForm #nationalid").val(row.nationalid);
			$("#listForm #sex").val(row.sex);
			$("#listForm #stu_sources").val(row.stu_sources);
			$("#listForm #birthday").val(row.birthday);
			$("#listForm #stu_enr").val(row.stu_enr);
			$("#listForm #per_id").val(row.per_id);
			$("#listForm #stu_adress").val(row.stu_adress);
			
			$('#listInput').window({title :'信息编辑'}).window('open');
			$("#listSave").unbind('click');
			$("#listSave").bind('click',function(){
				$.ajax({
					//ajax传输
					type : "POST",
					//传输类型为post
					url : getRequestPath('listEdit'),
					//连接的目的地址
					data:$("#listForm").serialize(),
					//表进行序列化，提交
					async : true,
					//是否异步
					dataType : 'json',
					//返回的数据类型
					error : function(request) {
						alert(request.responseText);
						//提示框
					},
					success : function(data) {
					$('#listGrid').datagrid('reload');	//刷新表格
					$.messager.show({title : '提示',msg : '操作成功'});
					$('#listInput').window('close');		
				}
				});
			})		
		}else{
			$.messager.alert("提示","请选择要修改的信息行");
		}
	});
	
	$("#del").bind('click',function(){
		//为del删除按钮绑定单击事件
		var row = $('#listGrid').datagrid('getSelected');//选中行
		if(row){
			$.messager.confirm('提示', '你确定要删除此条数据?', function(del){
		//提示框提示是否删除
				if(del){
					//判断del的点击事件
					$.ajax({
						//ajax传输
						type : "POST",
						//传输的方式post
						url : getRequestPath('listDel'),
						//目的地址
						data:{stunumber:row.stunumber},
						//将选中行的stunumber传过去
						async : true,
						//是否异步
						//dataType : 'json',
						error : function(request) {
							//错误提示，弹出提示框
							alert(request.responseText);
						},
						success : function(data) {
							//成功之后传回，并重新加载datagrid，并弹出提示框
							$('#listGrid').datagrid('reload');	//刷新表格
							$.messager.show({title : '提示',msg : '操作成功'});
						}
					});
				}
			})
		}else{
			$.messager.alert("提示","请选择要删除的信息行");
			//信息提示框
		}
	})
})