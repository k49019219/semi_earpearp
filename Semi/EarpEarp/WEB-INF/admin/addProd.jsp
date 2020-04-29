<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<style>

	table#tblProdInput th {
		text-align: center;
	    padding: 11px 0 10px;
	    border-left: 1px solid #dfdfdf;
	    border-bottom: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    font-weight: normal;
	    background-color: #fbfafa;
	
	}
	
	table#tblProdInput td{
	    
	    padding: 11px 10px 10px;
	    border: 1px solid #dfdfdf;
	    color: #353535;
	    vertical-align: middle;
	    word-break: break-all;
	    word-wrap: break-word;

	}
	
	.submitBtn {
		    box-sizing: border-box;
		    padding: 6px 10px;
		    border: 1px solid transparent;
		    border-radius: 2px;
		    font-size: 12px;
		    line-height: 18px;
		    text-align: center;
		    color: white;
		    background-color: #4a5164;
		    
	}
	
	.cancelBtn {
		
			margin-top : 10px;
		    box-sizing: border-box;
		    padding: 6px 10px;
		    border: 1px solid #d1d1d1;
		    border-radius: 2px;
		    font-size: 12px;
		    line-height: 18px;
		    text-align: center;
		    color: #222;
		    background-color: white;
		     
	}
	
	.error {
	
		margin : 5px;
		color : #0099e6;
	}
	
	.prodInputName  {
		background-color: #fbfafa;
	}

</style>

<script type="text/javascript" >

	$(function() {
		
		$(".error").hide();	
		
		$("#btnRegister").click(function() {
			
			var flag = false;
			
			$(".infoData").each(function() {
				
				var val = $(this).val().trim();	// value 값 갯수
				
				if(val == "") {
					
					$(this).next().show();
				//  $(".infoData").next().show(); ==  $(".error").show();	
					flag = true;
					
					return false;
					
				}
				
				
			});
			

			if(!flag) {	//flag 가 false 일때 submit
				
				var frm = document.prodInputFrm;
			
				frm.submit();
				
			}
			
			
		});	// end of $("#btnRegister").click(function()
		
		
	});
	
	

	
	

</script>


<div align="center" style="margin-bottom: 20px;">

	<div style="border-bottom: solid #00a0e2 3px; width: 100px; margin-top: 10px; padding-top: 10px; margin-bottom: 42px;">       
		<span style="font-size: 20px; font-weight: 600; color : #0099e6;">제품 등록</span>	
	</div>
	<br/>
	
	<%-- !!!!! ==== 중요 ==== !!!!! --%>
	<%-- 폼에서 파일을 업로드 하려면 반드시 method 는 POST 이어야 하고 
	     enctype="multipart/form-data" 으로 지정해주어야 한다.!! --%>
	<form name="prodInputFrm"
	      action="<%= request.getContextPath()%>/admin/addProdEnd.sa"
	      method="POST"
	      enctype="multipart/form-data"> 
	      
		<table id="tblProdInput" style="width: 85%;">
		<tbody>
			<tr>
				<td width="25%" class="prodInputName" style="padding-top: 10px;">카테고리</td>
				<td width="75%" align="left" style="padding-top: 10px;" >
					<select name="cateno" class="infoData">
						<option value="">카테고리 선택</option>
						<c:forEach var="categorymap" items="${ category }">
							<option value="${categorymap.cateno}">${categorymap.catename}</option>
						</c:forEach>
					</select>
					<span class="error">*필수입력</span>
				</td>	
			</tr>
			<tr>
				<td width="25%" class="prodInputName">제품명</td>
				<td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;" >
					<input type="text" style="width: 300px;" name="prodname" class="box infoData" />
					<span class="error">*필수입력</span>
				</td>
			</tr>
			<tr>
				<td width="25%" class="prodInputName">제품이미지</td>
				<td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
					<input type="file" name="prodimg" class="infoData" /><span class="error">필수입력</span>
				</td>
			</tr>
			<tr>
				<td width="25%" class="prodInputName">제품정가</td>
				<td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
					<input type="text" style="width: 100px;" name="price" class="box infoData" /> 원
					<span class="error">*필수입력</span>
				</td>
			</tr>
			<tr>
				<td width="25%" class="prodInputName">제품판매가</td>
				<td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
					<input type="text" style="width: 100px;" name="saleprice" class="box infoData" /> 원
					<span class="error">*필수입력</span>
				</td>
			</tr>
			
			<%-- ==== 첨부파일 타입 추가하기 ==== --%>
		    <tr>
		       	<td width="25%" class="prodInputName" style="padding-bottom: 10px;">상세이미지</td>
		       	<td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
					<input type="file" name="imgfilename" class="infoData" /><span class="error">*필수입력</span>
				</td>
		    </tr>
			
			<tr style="height: 70px;">
				<td colspan="2" align="right" style="padding-right: 0;  border-left: hidden; border-bottom: hidden; border-right: hidden;">
				    <input class = "submitBtn" type="button" value="제품등록" id="btnRegister" style="width: 80px;" /> 
				    <input class = "cancelBtn" type="reset" value="취소"  style="width: 80px;" />	
				</td>
			</tr>
		</tbody>
		</table>
	</form>
</div>



<jsp:include page="../footer.jsp"/>
