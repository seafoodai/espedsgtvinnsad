<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header =====================================-->
<jsp:include page="/WEB-INF/views/headerTvinnSadChildWindows.jsp" />
<!-- =====================end header ====================================-->

	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
	specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/tvinnsadimport_edit_items_childwindow_kundensvarereg.js?ver=${user.versionEspedsg}"></SCRIPT>
	
	<table width="90%" height="500px" class="tableBorderWithRoundCorners3D_RoundOnlyOnBottom" cellspacing="0" border="0" cellpadding="0">
		<tr>
			<td colspan="3" class="text14Bold">&nbsp;&nbsp;&nbsp;
			<img title="search" valign="bottom" src="resources/images/search.gif" width="24px" height="24px" border="0" alt="search">
			Søk Kundens Varenr.
			</td>
		</tr>
		<tr>
		<td valign="top">
		
		  		<%-- this container table is necessary in order to separate the datatables element and the frame above, otherwise
			 	the cosmetic frame will not follow the whole datatable grid including the search field... --%>
				<table id="containerdatatableTable" cellspacing="2" align="left" width="100%" >
					<tr>
					<td>
						<table>
						<form name="tvinnsadImportKundensvareRegForm" id="tvinnsadImportKundensvareRegForm" action="tvinnsadimport_edit_items_childwindow_kundensvarereg.do?action=doInit" method="post">
						<tr>
							<td class="text14">&nbsp;Varenr.</td>
							<td class="text14">&nbsp;<input type="text" class="inputText" name="vkod" id="vkod" size="10" maxlength="10" value="${model.vkod}"></td>
							<td class="text14">&nbsp;</td>
	           				<td class="text14">&nbsp;Kundenr.(Mottaker)</td>
							<td class="text14">&nbsp;<input type="text" class="inputText" name="recId" id="recId" size="10" maxlength="20" value="${model.recId}"></td>
							<td class="text14">&nbsp;</td>
	           				<td align="right">&nbsp;<input class="inputFormSubmit" type="submit" name="submit" value='<spring:message code="systema.tvinn.sad.search"/>'></td>
           				</tr>
		           		</form>
		           		</table>
					</td>
					</tr>
					
													           		
	           		<tr height="5"><td></td></tr>
					
					<tr class="text12" >
					<td class="ownScrollableSubWindowDynamicWidthHeight" width="100%" style="height:30em;">
					<%-- this is the datatables grid (content)--%>
					<table id="kundensVareRegList" class="display compact cell-border" width="100%" >
						<thead>
						<tr class="tableHeaderField" height="20" >
							<th class="text14" title="adunnr">&nbsp;Varenr&nbsp;</th>
		                    <th class="text14" title="adunnr">&nbsp;Varekod/Tariffnr&nbsp;</th>
		                    <th class="text14" title="adembg">&nbsp;Beskrivelse&nbsp;</th>
		                    <th class="text14" title="adunnr">&nbsp;Tollverdi&nbsp;</th>
		                    <th class="text14" title="adunnr">&nbsp;Bruttovekt&nbsp;</th>
		                    <th class="text14" title="adunnr">&nbsp;Nettovekt&nbsp;</th>
		                </tr> 
		                </thead>
		                <tbody>
		                <c:forEach var="record" items="${model.kundensVareRegList}" varStatus="counter">    
			               <c:choose>           
			                   <c:when test="${counter.count%2==0}">
			                       <tr class="text14">
			                   </c:when>
			                   <c:otherwise>   
			                       <tr class="text14">
			                   </c:otherwise>
			               </c:choose>
			               <td nowrap style="cursor:pointer;" class="text14MediumBlue" id="varenr${record.varenr}@varebe${record.varebe}@w2vnti${record.w2vnti}@w2belt${record.w2belt}@w2vktb${record.w2vktb}@w2vktn${record.w2vktn}" >
               			   		<img title="select" valign="bottom" src="resources/images/update.gif" border="0" alt="edit">&nbsp;${record.varenr}
			               </td>
		               	   <td class="text14">&nbsp;${record.w2vnti}</td>
		               	   <td class="text14">&nbsp;${record.varebe}</td>
		               	   <td class="text14">&nbsp;${record.w2belt}</td>
		               	   <td class="text14">&nbsp;${record.w2vktb}</td>
		               	   <td class="text14">&nbsp;${record.w2vktn}</td>
			            </tr> 
			            </c:forEach>
			            </tbody>
		            </table>
		            </td>
	           		</tr>
        			</table>
		
		</td>
		</tr>
	</table> 
