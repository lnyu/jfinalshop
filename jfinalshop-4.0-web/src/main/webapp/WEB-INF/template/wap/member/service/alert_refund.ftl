[#include "/wap/include/header.ftl" /]
<script type="text/javascript" src="${base}/statics/js/jfinalshop.validate.js?v=2.6.0.161014"></script>
<link type="text/css" rel="stylesheet" href="${base}/statics/js/upload/uploader.css?v=2.6.0.161014" />
<script type="text/javascript" src="${base}/statics/js/upload/uploader.js?v=2.6.0.161014"></script>
	<div class="mui-content">
	<form action="${base}/wap/member/service/save.jhtml" method="post">
	    <ul class="mui-table-view layout-list-common comment-form margin-none">
	    	<li class="mui-table-view-cell">
	    		<a href="${base}/wap/goods/detail.jhtml?id=${orderItem.product.goods.id}" class="mui-navigate-right">
	    			<span class="mui-pull-left margin-right"><img src="${orderItem.thumbnail!setting.defaultThumbnailProductImage}"></span>
	    			<div class="title margin-small-bottom">
	    				<span>${orderItem.name}</span>
	    			</div>
	    			<span class="text-ellipsis text-gray">规格：${orderItem.product.specifications?join(", ")}</span>
	    		</a>
	    		<div class="margin-top padding-top border-top">
	    			<span class="mui-btn margin-small-right hd-btn-blue" data-val="1" data-url="">退货退款</span>
	    			<!-- <span class="mui-btn margin-small-right hd-btn-gray" data-val="2" data-url="{url('ajax_refund')}">&nbsp;仅退款&nbsp;</span> -->
	    			<input type="hidden" name="returnsItem.type" value="1">
	    		</div>
	    	</li>
	    	<li class="padding border-bottom hd-h5">
	    		<span class="margin-right-15">售后原因</span>
	    		<span class="inline">
	    			<select class="margin-none padding-none" name="returnsItem.cause">
	    				<option value="">请选择退货退款原因</option>
						<option value="外观/参数等与描述不符">外观/参数等与描述不符</option>
						<option value="商品发错货">商品发错货</option>
						<option value="产品质量/故障">产品质量/故障</option>
						<option value="效果不好或不喜欢">效果不好或不喜欢</option>
						<option value="收到商品少件/破损/污渍">收到商品少件/破损/污渍</option>
						<option value="假冒商品">假冒商品</option>
						<option value="其他">其他</option>
	    			</select>
	    		</span>
	    	</li>
	    	<li class="padding border-bottom hd-h5">
	    		<span class="margin-right-15">退款金额</span>
	    		<span class="inline mui-input-row over-initial">
	    			<input type="text" name="amount" class="padding-none margin-none border-none bg-none mui-input-clear" value="${orderItem.price}" placeholder="请填退款金额" />
	    		</span>
	    	</li>
	    	<li class="padding border-bottom hd-h5">
	    		<span class="margin-right-15">退款数量</span>
	    		<span class="inline mui-input-row over-initial">
	    			<input type="text" name="returnsItem.quantity" class="padding-none margin-none border-none bg-none mui-input-clear" value="${orderItem.quantity}" placeholder="请填退货数量" />
	    		</span>
	    	</li>
	    	<li>
	    		<textarea class="border-none margin-none hd-h5" name="returnsItem.desc" placeholder="请说明详细原因"></textarea>
	    	</li>
	    </ul>
	    <!-- <div class="list-col-10 padding-lr">
	    	<div class="padding-tb border-bottom">
	    		<span class="icon-15 mui-pull-left margin-right"><img src="${base}/statics/images/ico_1.png" /></span>
	    		<span>上传售后凭证</span>
	    	</div>
	    	<ul class="comment-upload-list padding-top mui-clearfix">
	    		<li><label class="upload"></label></li>
	    	</ul>
	    </div> -->
	    <div class="padding">
	    	<input type="hidden" name="id" value="${orderItem.id}" />
	    	<input type="submit" value="提交申请" class="mui-btn full mui-btn-primary hd-h3 ajax_return">
	    </div>
	</form>
	</div>
	<script type="text/javascript">
	$('.ajax_return').bind('click',function(){
		var ajax_return = $("form").Validform({
			showAllError:true,
			ajaxPost:true,
			callback:function(ret) {
				if(ret.status == 0) {
					$.tips({
						content:ret.message,
						callback:function() {
							return false;
						}
					});
				} else {
					$.tips({
						content:ret.message,
						callback:function() {
							//window.location.reload();
							window.location.href = ret.referer;
						}
					});					
				}
			}
		})
	})
	/* var uploader = WebUploader.create({
        auto:true,
        fileNumLimit:10,
        fileVal:'upfile',
        // swf文件路径
        swf: '${base}/statics/js/upload/uploader.swf',
        // 文件接收服务端。
        server: "<?php echo url('attachment/index/upload')?>",
        // 选择文件的按钮。可选
        formData:{
            file : 'upfile',
            upload_init : '<?php echo $attachment_init ?>'
        },
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: {
            id: '.upload',
            multiple:true
        },
        // 压缩图片大小
        compress:false,
        accept:{
            title: '图片文件',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        },
        chunked: false,
        chunkSize:1000000,
        resize: false
    })

    uploader.onUploadSuccess = function(file, response) {
    	if(response.status == 1) {
    		$('.upload').parents('.comment-upload-list').prepend('<li><img src="' + response.result.url + '" /><input type="hidden" name="imgs[]" value="' + response.result.url + '"/><span class="remove">×</span></li>');
    	} else {
    		alert(response.message);
    		return false;
    	}
    }
    $(function(){
    	$('.margin-small-right').bind('click',function(){
    		if($(this).hasClass('hd-btn-gray')){
    			$(this).removeClass('hd-btn-gray').addClass('hd-btn-blue').siblings().removeClass('hd-btn-blue').addClass('hd-btn-gray');
    			$('input[name=type]').val($(this).attr('data-val'));
    			$('form').attr('action',$(this).attr('data-url'));
    		}
    	})
    	
    	mui(".comment-upload-list").on('tap','.remove',function(){
	    	var li = $(this).parents("li");
	    	$.confirms("是否确认删除？",function(){
	    		li.fadeOut(300,function(){
		    		li.remove();
		    	});
	    	});
	    });
    }) */
	</script>
