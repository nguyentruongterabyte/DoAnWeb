<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách kho hàng</title>
<base href="${pageContext.servletContext.contextPath}">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resource/css/base.css">
</head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.inventory-list {
	max-height: 78vh;
	overflow-y: scroll; 
	position: relative;
}

.inventory-list__heading {
	position: sticky;
	top: 0;
	right: 0;
	left: 0;
	z-index: 1;
}

.inventory-list__table {
	position: relative;
	max-height: 85vh;
}

.inventory-list__table-heading {
	position: sticky;
	top: 38px;
	right: 0;
	background: #fff;
}

.inventory-capability {
    max-height: 25vh;
    overflow-y: scroll;
}

.inventory-capability__list {
    position: relative;
}

.inventory-capability__list-heading {
	position: sticky;
	top: 0;
	right: 0;
	left: 0;
	z-index: 1;
}


</style>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Quản lý</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="#">Home</a></li>
				<li><a
					href="${pageContext.servletContext.contextPath}/danh-sach.htm">Danh
						sách sản phẩm</a></li>
				<li class="active"><a
					href="${pageContext.servletContext.contextPath}/danh-sach-kho-hang.htm">Danh
						sách kho hàng</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-primary mt-12 inventory-list filterable">
					<div class="inventory-list__heading panel-heading">
						<h3 class="panel-title">Kho hàng</h3>
						<div class="pull-right">
							<button class="btn btn-default btn-xs btn-filter">
								<span class="glyphicon glyphicon-filter"></span> Lọc
							</button>
						</div>
					</div>
					<table class="inventory-list__table table table-hover">
						<thead class="inventory-list__table-heading">
							<tr class="filters">
								<th><input type="text" class="form-control" placeholder="#"
									disabled></th>
								<th><input type="text" class="form-control"
									placeholder="Tên kho" disabled></th>
								<th><input type="text" class="form-control"
									placeholder="Địa chỉ" disabled></th>
								<th><input type="text" class="form-control"
									placeholder="Giá thuê" disabled></th>
							</tr>
						</thead>
						<tbody>
<%-- 							<c:forEach items="${inventories}" var="i"> --%>
<!-- 								<tr> -->
<%-- 									<td>${i.id}</td> --%>
<%-- 									<td>${i.name}</td> --%>
<%-- 									<td>${i.address}</td> --%>
<%-- 									<td>${i.rentPrice}</td> --%>
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>

								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Kho 1</td>
									<td>Thủ Đức</td>
									<td>1000000</td>
								</tr>
						</tbody>
					</table>
				</div>
				<div>
					<button class="btn btn-success">Thêm</button>
				</div>
			</div>
			<div class="col-md-6">
				<h4>Thông tin</h4>
				<div class="row">
					<div class="col-md-3">
						<div style="margin-top: 10px;">
							<label for="inventory-id">Mã kho</label>
						</div>
						<div style="margin-top: 16px;">
							<label for="inventory-name">Tên kho</label>
						</div>
						<div style="margin-top: 12px;">
							<label for="inventory-address">Địa chỉ</label>
						</div>
						<div style="margin-top: 60px;">
							<label for="inventory-term">Kỳ</label>
						</div>
						<div style="margin-top: 18px;">
							<label for="inventory-rent-price">Giá thuê</label>
						</div>
					</div>
					<div class="col-md-9">
						<div>
							<input class="form-control" id="inventory-id" type="text" value="1" readonly>
						</div>
						<div class="mt-8">
							<input class="form-control" id="inventory-name" type="text" value="Kho 1" readonly>
						</div>
						<div class="mt-8">
							<textarea class="form-control no-resize" id="inventory-address" rows="3" cols="40" readonly>Thủ Đức</textarea>
						</div>
						<div class="mt-8">
							<input class="form-control" id="inventory-term" type="text" value="1" readonly>
						</div>
						<div class="mt-8">
							<input class="form-control" id="inventory-rent-price" type="text" value="100000" readonly>
						</div>
					</div>
				</div>
				<hr>
				
				<div class="inventory-capability">
					<table class="table table-hover inventory-capability__list">
						<thead class="inventory-capability__list">
							<tr>
								<th>Sản phẩm</th>
								<th>Số lượng tối đa</th>
								<th>Số lượng hiện tại</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Rockstar</td>
								<td>50</td>
								<td>15</td>
							</tr>
							<tr>
								<td>Rockstar</td>
								<td>50</td>
								<td>15</td>
							</tr>
							<tr>
								<td>Rockstar</td>
								<td>50</td>
								<td>15</td>
							</tr>
							<tr>
								<td>Rockstar</td>
								<td>50</td>
								<td>15</td>
							</tr>
							<tr>
								<td>Rockstar</td>
								<td>50</td>
								<td>15</td>
							</tr>
							<tr>
								<td>Rockstar</td>
								<td>50</td>
								<td>15</td>
							</tr>
							<tr>
								<td>Rockstar</td>
								<td>50</td>
								<td>15</td>
							</tr>
							<tr>
								<td>Rockstar</td>
								<td>50</td>
								<td>15</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.servletContext.contextPath}/resource/js/filter.js"></script>
</body>
</html>