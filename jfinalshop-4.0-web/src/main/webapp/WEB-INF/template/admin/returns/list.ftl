[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>${message("admin.returns.list")} - Powered By JFinalShop</title>
<meta name="author" content="JFinalShop Team" />
<meta name="copyright" content="JFinalShop" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]

});
</script>
</head>
<body>
	<div class="breadcrumb">
		<a href="${base}/admin/common/index.jhtml">${message("admin.breadcrumb.home")}</a> &raquo; ${message("admin.returns.list")} <span>(${message("admin.page.total", page.totalRow)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="post">
		<div class="bar">
			<div class="buttonGroup">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div id="pageSizeMenu" class="dropdownMenu">
					<a href="javascript:;" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<ul>
						<li[#if page.pageSize == 10] class="current"[/#if] val="10">10</li>
						<li[#if page.pageSize == 20] class="current"[/#if] val="20">20</li>
						<li[#if page.pageSize == 50] class="current"[/#if] val="50">50</li>
						<li[#if page.pageSize == 100] class="current"[/#if] val="100">100</li>
					</ul>
				</div>
			</div>
			<div id="searchPropertyMenu" class="dropdownMenu">
				<div class="search">
					<span class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="pageable.searchValue" value="${pageable.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<ul>
					<li[#if pageable.searchProperty == "sn"] class="current"[/#if] val="sn">${message("Returns.sn")}</li>
					<li[#if pageable.searchProperty == "tracking_no"] class="current"[/#if] val="trackingNo">${message("Returns.trackingNo")}</li>
					<li[#if pageable.searchProperty == "shipper"] class="current"[/#if] val="shipper">${message("Returns.shipper")}</li>
					<li[#if pageable.searchProperty == "area_id"] class="current"[/#if] val="area">${message("Returns.area")}</li>
					<li[#if pageable.searchProperty == "address"] class="current"[/#if] val="address">${message("Returns.address")}</li>
					<li[#if pageable.searchProperty == "zip_code"] class="current"[/#if] val="zipCode">${message("Returns.zipCode")}</li>
					<li[#if pageable.searchProperty == "phone"] class="current"[/#if] val="phone">${message("Returns.phone")}</li>
				</ul>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="sn">${message("Returns.sn")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="shipping_method">${message("Returns.shippingMethod")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="delivery_corp">${message("Returns.deliveryCorp")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="tracking_no">${message("Returns.trackingNo")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="shipper">${message("Returns.shipper")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="create_date">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("admin.common.action")}</span>
				</th>
			</tr>
			[#list page.list as returns]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${returns.id}" />
					</td>
					<td>
						${returns.sn}
					</td>
					<td>
						${returns.shippingMethod}
					</td>
					<td>
						${returns.deliveryCorp}
					</td>
					<td>
						${returns.trackingNo}
					</td>
					<td>
						${returns.shipper}
					</td>
					<td>
						<span title="${returns.createDate?string("yyyy-MM-dd HH:mm:ss")}">${returns.createDate}</span>
					</td>
					<td>
						<a href="view.jhtml?id=${returns.id}">[${message("admin.common.view")}]</a>
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPage]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>
[/#escape]