<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class='ui container'>
	<table id="parkings" class='ui table hover'>
		<thead>
			<tr>
				<th></th>
				<th>ID</th>
				<th>이름</th>
				<th>도로명주소</th>
				<th>관리자</th>
				<th>관리자 연락처</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${parkings}" var="dto">
				<tr>
					<c:if test="${dto.paid eq false}">
						<td><div class='ui primary horizontal label'>무료</div></td>
					</c:if>
					<c:if test="${dto.paid eq true}">
						<td><div class="ui teal horizontal label">유료</div></td>
					</c:if>
					<td>${dto.id}</td>
					<td><a href="/manage/detail?id=${dto.id}">${dto.name}</a></td>
					<td>${dto.addr}</td>
					<td>${dto.manager}</td>
					<td>${dto.contact}</td>
				</tr>
			</c:forEach>

		</tbody>
    </table>
    <div id="box"></div>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">  
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>    
    <script>
        $(document).ready( function () {
            $('#parkings').DataTable({
                language : {
                    url : 'http://cdn.datatables.net/plug-ins/1.10.22/i18n/Korean.json'
                }
            });
        } );

    </script>
</div>