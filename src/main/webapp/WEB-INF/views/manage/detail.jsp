<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class='ui container'>
	<h2 class='ui header'>주차장 정보</h3>
    <form class='ui large form' method="post" action="/manage/update">
        <div class='two fields'>
            <input type="hidden" name="id" value="${parking.id}">
            <div class="field">
                <label>ID</label>
                <input type="text" disabled value="${parking.id}">
            </div>
            <div class='field'>
                <label>이름</label>
                <input type="text" name="name" value="${parking.name}">
            </div>
        </div>
        <div class='field'>
            <label>도로명 주소</label>
            <input type="text" name="addr" value="${parking.addr}">
        </div>
        <div class='field'>
            <label>지번 주소</label>
            <input type="text" name="prev_addr" value="${parking.prev_addr}">
        </div>
        <div class="two fields">
            <div class='field'>
                <label>관리자</label>
                <input type="text" name="manager" value="${parking.manager}">
            </div>
            <div class='field'>
                <label>연락처</label>
                <input type="text" name="contact" value="${parking.contact}">
            </div>
        </div>
        <div class='field'>
        <h4 class="ui header">운영요일</h4>
        <div class="ui grid">
            <div class="column"></div>
            
            <div class="ui toggle checkbox">
            	<c:if test="${parking.oper_mon eq true}">
	                <input type="checkbox" name="oper_mon" checked>
	                <label>월요일</label>
                </c:if>
                <c:if test="${parking.oper_mon eq false}">
  	                <input type="checkbox" name="oper_mon">
	                <label>월요일</label>
                </c:if>
            </div>
            <div class="ui toggle checkbox">
            	<c:if test="${parking.oper_tue eq true}">
	                <input type="checkbox" name="oper_tue" checked>
	                <label>화요일</label>
                </c:if>
                <c:if test="${parking.oper_tue eq false}">
  	                <input type="checkbox" name="oper_tue">
	                <label>화요일</label>
                </c:if>
            </div>
            <div class="ui toggle checkbox">
            	<c:if test="${parking.oper_tue eq true}">
	                <input type="checkbox" name="oper_tue" checked>
	                <label>수요일</label>
                </c:if>
                <c:if test="${parking.oper_tue eq false}">
  	                <input type="checkbox" name="oper_tue">
	                <label>수요일</label>
                </c:if>
            </div>
            <div class="ui toggle checkbox">
            	<c:if test="${parking.oper_thu eq true}">
	                <input type="checkbox" name="oper_thu" checked>
	                <label>목요일</label>
                </c:if>
                <c:if test="${parking.oper_thu eq false}">
  	                <input type="checkbox" name="oper_thu">
	                <label>목요일</label>
                </c:if>
            </div>
            <div class="ui toggle checkbox">
            	<c:if test="${parking.oper_fri eq true}">
	                <input type="checkbox" name="oper_fri" checked>
	                <label>금요일</label>
                </c:if>
                <c:if test="${parking.oper_fri eq false}">
  	                <input type="checkbox" name="oper_fri">
	                <label>금요일</label>
                </c:if>
            </div>
            <div class="ui toggle checkbox">
            	<c:if test="${parking.oper_sat eq true}">
	                <input type="checkbox" name="oper_sat" checked>
	                <label>토요일</label>
                </c:if>
                <c:if test="${parking.oper_sat eq false}">
  	                <input type="checkbox" name="oper_sat">
	                <label>토요일</label>
                </c:if>
            </div>
            <div class="ui toggle checkbox">
            	<c:if test="${parking.oper_sun eq true}">
	                <input type="checkbox" name="oper_sun" checked>
	                <label>일요일</label>
                </c:if>
                <c:if test="${parking.oper_sun eq false}">
  	                <input type="checkbox" name="oper_sun">
	                <label>일요일</label>
                </c:if>
            </div>
        
            <div class="column"></div>
        </div>
        </div>
        <div class='two fields'>
            <div class='field'>
                <label>개장 시간</label>
                <input type="text" name="start_time" value="${parking.start_time}">
            </div>
            <div class='field'>
                <label>폐장 시간</label>
                <input type="text" name="end_time" value="${parking.end_time}">
            </div>
        </div>
        <div class='two fields'>
           	<div class='field'>
                <label>기본 요금</label>
                <input type="text" name="fare" value="${parking.fare}">
            </div>
            <div class='field'>
                <label>기본 요금 적용 시간</label>
                <input type="text" name="duration" value="${parking.duration}">
            </div>
        </div>
        <div class='two fields'>
           	<div class='field'>
                <label>추가 요금</label>
                <input type="text" name="added_fare" value="${parking.added_fare}">
            </div>
            <div class='field'>
                <label>추가 요금 시간 단위</label>
                <input type="text" name="duration_interval" value="${parking.duration_interval}">
            </div>
        </div>
        <div class='field'>
        	<label>지불 방법</label>
			<div class="ui toggle checkbox">
				<c:if test="${parking.payment_cash eq true}">
					<input type="checkbox" name="payment_cash" checked>
					<label>현금 결제</label>
				</c:if>
				<c:if test="${parking.payment_cash eq false}">
				  	<input type="checkbox" name="payment_cash">
					<label>현금 결제</label>
				</c:if>
            </div>
			<div class="ui toggle checkbox">
				<c:if test="${parking.payment_card eq true}">
					<input type="checkbox" name="payment_card" checked>
					<label>카드 결제</label>
				</c:if>
				<c:if test="${parking.payment_card eq false}">
				  	<input type="checkbox" name="payment_card">
					<label>카드 결제</label>
				</c:if>
            </div>
			<div class="ui toggle checkbox">
				<c:if test="${parking.payment_machine eq true}">
					<input type="checkbox" name="payment_machine" checked>
					<label>무인정산기 결제</label>
				</c:if>
				<c:if test="${parking.payment_machine eq false}">
				  	<input type="checkbox" name="payment_machine">
					<label>무인정산기 결제</label>
				</c:if>
            </div>        
        </div>
        <div class='field'>
        	<label>기타</label>
			<div class="ui toggle checkbox">
				<c:if test="${parking.smallcar eq true}">
					<input type="checkbox" name="smallcar" checked>
					<label>경차 주차 구역 여부</label>
				</c:if>
				<c:if test="${parking.smallcar eq false}">
				  	<input type="checkbox" name="smallcar">
					<label>경차 주차 구역 여부</label>
				</c:if>
            </div>
			<div class="ui toggle checkbox">
				<c:if test="${parking.woman eq true}">
					<input type="checkbox" name="woman" checked>
					<label>여성 운전자 주차 구역 여부</label>
				</c:if>
				<c:if test="${parking.woman eq false}">
				  	<input type="checkbox" name="woman">
					<label>여성 운전자 주차 구역 여부</label>
				</c:if>
            </div>
			<div class="ui toggle checkbox">
				<c:if test="${parking.disabled eq true}">
					<input type="checkbox" name="disabled" checked>
					<label>장애인 운전자 주차 구역 여부</label>
				</c:if>
				<c:if test="${parking.disabled eq false}">
				  	<input type="checkbox" name="disabled">
					<label>장애인 운전자 주차 구역 여부</label>
				</c:if>
            </div>        
        </div>
        <div>
            <div class='field'>
                <label>자리 배치</label>
                <input id='layoutInput' type='text' name='layout_template' value='${parking.layout_template}'>
                <button type='button' class='ui button primary' onclick='addRow()'>줄 추가</button>
            </div>
        <div id="layout"></div>
        </div>
        <button class='ui button primary'>저장</button>
        <button class='ui button'>취소</button>
    </form>
</div>

<script>
    function generateLayout() {
    let layout = $("#layoutInput").val();
    let width = layout.search("/");
    $("#layout").css("grid-template-columns", "repeat(" + width + ", 1fr)");
    let count = 0;
    let seat = 0;
    

    for(let i = 0; i < layout.length; i++) {
        let char = layout.charAt(i);
        if (char == "A") {
            count++;
            seat++;
            $("#layout").append("<div class='seat normal' data-seat='" + seat + "'>" + count + "</div>");
            $("#layout").append("<div class='ui popup flowing'><div class='ui four column divided center aligned grid'><div class='column'><h3>일반</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "normal" + '"' + ")'>변경</button></div><div class='column'><h3>여성</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "woman" + '"' + ")'>변경</button></div><div class='column'><h3>장애인</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "disabled" + '"' + ")'>변경</button></div><div class='column'><h3>길</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "road" + '"' + ")'>변경</button></div></div></div>");
        } else if (char == "B") {
            count++;
            seat++;
            $("#layout").append("<div class='seat disabled' data-seat='" + seat + "'>" + count + "</div>");
            $("#layout").append("<div class='ui popup flowing'><div class='ui four column divided center aligned grid'><div class='column'><h3>일반</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "normal" + '"' + ")'>변경</button></div><div class='column'><h3>여성</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "woman" + '"' + ")'>변경</button></div><div class='column'><h3>장애인</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "disabled" + '"' + ")''>변경</button></div><div class='column'><h3>길</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "road" + '"' + ")'>변경</button></div></div></div>");
        } else if (char == "C") {
			count++;
			seat++;
            $("#layout").append("<div class='seat woman' data-seat='" + seat + "'>" + count + "</div>");
            $("#layout").append("<div class='ui popup flowing'><div class='ui four column divided center aligned grid'><div class='column'><h3>일반</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "normal" + '"' + ")'>변경</button></div><div class='column'><h3>여성</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "woman" + '"' + ")'>변경</button></div><div class='column'><h3>장애인</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "disabled" + '"' + ")'>변경</button></div><div class='column'><h3>길</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "road" + '"' + ")'>변경</button></div></div></div>");            
        } else if (char == "_") {
        	seat++;
            $("#layout").append("<div class='seat road' data-seat='" + seat + "'></div>");
            $("#layout").append("<div class='ui popup flowing'><div class='ui four column divided center aligned grid'><div class='column'><h3>일반</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "normal" + '"' + ")'>변경</button></div><div class='column'><h3>여성</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "woman" + '"' + ")'>변경</button></div><div class='column'><h3>장애인</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "disabled" + '"' + ")'>변경</button></div><div class='column'><h3>길</h3><button type='button' class='ui button primary' onclick='setSeat(" + seat + ', "' + char + '", "' + "road" + '"' + ")'>변경</button></div></div></div>");
			
        }       
    }
        $(".seat").popup({inline: true, hoverable:true});
}
    generateLayout();


    function setSeat(seat, char, type){
        let input = $("#layoutInput");
        let changed = input.val();
        if (type == "normal") {
            $(".seat[data-seat=" + seat + "]").removeClass("disabled woman road").addClass("normal");
            changed = changed.slice(0, seat-1) + changed.slice(seat-1, changed.length).replace(char, "A");
            console.log(changed);
            input.attr("value", changed);
        } else if (type == "disabled") {
            $(".seat[data-seat=" + seat + "]").removeClass("normal woman road").addClass("disabled");
            changed = changed.slice(0, seat-1) + changed.slice(seat-1, changed.length).replace(char, "B");
            console.log(changed);
            input.attr("value", changed);
        } else if (type == "woman") {
            $(".seat[data-seat=" + seat + "]").removeClass("normal disabled road").addClass("woman");
            changed = changed.slice(0, seat-1) + changed.slice(seat-1, changed.length).replace(char, "C");
            console.log(changed);
            input.attr("value", changed);
        } else if (type == "road") {
            $(".seat[data-seat=" + seat + "]").removeClass("normal disabled woman").addClass("road");
            changed = changed.slice(0, seat-1) + changed.slice(seat-1, changed.length).replace(char, "_");
            console.log(changed);
            input.attr("value", changed);
        }
        $("#layout").html("");
        generateLayout();   
    }

    function addRow(){
        let input = $("#layoutInput");
        let value = input.val()
        let row = value.slice(0, value.indexOf("/") + 1);
        input.attr("value", value + row);
        $("#layout").html("");
        generateLayout();
    }
</script>

<style>
    
    #layout {
        display: grid;
          margin-bottom: 5%;
          grid-auto-rows: 60px;
    }
    #layout .seat {
    	display:grid;
    	place-items:center;
    	color: white;
    }
    .normal {
        background-color : var(--primary);
    }
    .disabled {
    	background-color: var(--secondary);
    }
    .woman {
    	background-color: var(--pink);
    }
    .road {
        color:var(--black)!important;
    }

</style>
    


