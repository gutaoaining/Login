$(function(){
	$('#listGrid').datagrid({
		url : getRequestPath('gradeShow'),
		striped: true,
		columns:[[
			{field:'stunumber',title:'学号', width:80},
			{field:'classname',title:'班级', width:80},
			{field:'name',title:'姓名', width:100},
			{field:'height',title:'身高', width:100},
			{field:'weight',title:'体重', width:100},
			{field:'VitalCapacity',title:'肺 活 量', width:100},
			{field:'run50',title:'跑步50米', width:100},
			{field:'StandJump',title:'立定跳远', width:100},
			{field:'SitReach',title:'坐位体前屈', width:100},
			{field:'run800or1000',title:'跑800米/1000米', width:100},
			{field:'situporChinning',title:'引体向上/仰卧起坐每分', width:150}
		]]
	});
	$("#commit").bind('click',function(){
		var key=encodeURI($("#keyword").val());
		$("#listGrid").datagrid({url : getRequestPath('gradeShow?keyword='+key)});
		
	});
	$("#add").bind('click',function(){
		$("#listForm").form("reset");
		
		$('#listInput').window({title :'信息添加'}).window('open');
		$("#listSave").unbind('click');
		$("#listSave").bind('click',function(){
			$.ajax({
				type : "POST",
				url : getRequestPath('gradeAdd'),
				data:$("#listForm").serialize(),
				async : true,
				dataType : 'json',
				error : function(request) {
					$.messager.show({title : '提示',msg : '学号，年级编号和性别不能为空或者学号已存在'});
				},
				success : function(data) {
					if(data[0].success){
					$('#listGrid').datagrid('reload');	//刷新表格
					$.messager.show({title : '提示',msg : '操作成功'});
					$('#listInput').window('close');
					}else{
						$.messager.show({title : '提示',msg : '操作失败（可能因为或者学号已存在等）'});
					}
				}
			});
		})
	});
	
	$("#edit").bind('click',function(){
		var row = $('#listGrid').datagrid('getSelected');//选中行
		if(row){
			//为编辑界面加载数据
			$("#listForm #stunumber").val(row.stunumber);
			$("#listForm #classname").val(row.classname);
			$("#listForm #name").val(row.name);
			$("#listForm #height").val(row.height);
			$("#listForm #weight").val(row.weight);
			$("#listForm #VitalCapacity").val(row.VitalCapacity);
			$("#listForm #run50").val(row.run50);
			$("#listForm #StandJump").val(row.StandJump);
			$("#listForm #SitReach").val(row.SitReach);
			$("#listForm #run800or1000").val(row.run800or1000);
			$("#listForm #situporChinning").val(row.situporChinning);
			
			$('#listInput').window({title :'信息编辑'}).window('open');
			$("#listSave").unbind('click');
			$("#listSave").bind('click',function(){
				$.ajax({
					type : "POST",
					url : getRequestPath('managerEdit'),
					data:$("#listForm").serialize(),
					async : true,
					dataType : 'json',
					error : function(request) {
					$.messager.show({title : '提示',msg : '学号，年级编号和性别不能为空'});
				},
				success : function(data) {
					if(data[0].success){
					$('#listGrid').datagrid('reload');	//刷新表格
					$.messager.show({title : '提示',msg : '操作成功'});
					$('#listInput').window('close');
					}else{
						$.messager.show({title : '提示',msg : '操作失败（可能因为学号为空等）'});
					}
				}
				});
			})		
		}else{
			$.messager.alert("提示","请选择要修改的信息行");
		}
	});
	
	$("#del").bind('click',function(){
		var row = $('#listGrid').datagrid('getSelected');//选中行
		if(row){
			$.messager.confirm('提示', '你确定要删除此条数据?', function(del){
				if(del){
					$.ajax({
						type : "POST",
						url : getRequestPath('gradeDel'),
						data:{stunumber:row.stunumber},
						async : true,
						//dataType : 'json',
						error : function(request) {
							alert(request.responseText);
						},
						success : function(data) {
							$('#listGrid').datagrid('reload');	//刷新表格
							$.messager.show({title : '提示',msg : '操作成功'});
						}
					});
				}
			})
		}else{
			$.messager.alert("提示","请选择要删除的信息行");
		}
	})
})