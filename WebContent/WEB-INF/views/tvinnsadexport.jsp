<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %>

<!-- ======================= header ===========================-->
<jsp:include page="/WEB-INF/views/headerTvinnSad.jsp" />
<!-- =====================end header ==========================-->
	<%-- specific jQuery functions for this JSP (must reside under the resource map since this has been
		specified in servlet.xml as static <mvc:resources mapping="/resources/**" location="WEB-INF/resources/" order="1"/> --%>
	<SCRIPT type="text/javascript" src="resources/js/tvinnsadglobal_edit.js?ver=${user.versionEspedsg}"></SCRIPT>	
	<SCRIPT type="text/javascript" src="resources/js/tvinnsadexport.js?ver=${user.versionEspedsg}"></SCRIPT>	
	
	<style type = "text/css">
	.ui-datepicker { font-size:9pt;}
	</style>


<table width="100%" class="text11" cellspacing="0" border="0" cellpadding="0">
<tr>
	<td>
	<%-- tab container component --%>
	<table width="100%"  class="text14" cellspacing="0" border="0" cellpadding="0">
		<tr height="2"><td></td></tr>
		<tr height="25"> 
			<td width="20%" valign="bottom" class="tab" align="center" nowrap>
				<font class="tabLink">&nbsp;<spring:message code="systema.tvinn.sad.export.list.tab"/></font>
				<img valign="bottom" src="resources/images/list.gif" border="0" alt="general list">
				&nbsp;&nbsp;${listSize}
			</td>
			<td width="1px" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>
			<td width="20%" valign="bottom" class="tabDisabled" align="center" nowrap>
					<a style="display:block;" id="copyFromTransportUppdragLink" runat="server" href="#">
						<font class="tabDisabledLink">&nbsp;<spring:message code="systema.tvinn.sad.export.createnew.tab"/></font>
						<img valign="bottom" src="resources/images/add.png" width="12" hight="12" border="0" alt="create new">
					</a>
				
			</td>
			<td width="60%" class="tabFantomSpace" align="center" nowrap><font class="tabDisabledLink">&nbsp;</font></td>	
		</tr>
	</table>
	</td>
</tr>

<tr>
	<td>
	<%-- search filter component --%>
		
 		<table width="100%" class="tabThinBorderWhite" border="0" cellspacing="0" cellpadding="0">
 	        <tr height="3"><td></td></tr>
 	        <form name="tvinnsadExportSearchForm" id="searchForm" action="tvinnsadexport?action=doFind" method="post" >
 	        <tr>	
                <td class="text14" align="left" title="avd">&nbsp;&nbsp;&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.avd"/></td>
                <td class="text14" align="left" title="sg">&nbsp;&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.signatur"/></td>
                <td class="text14" align="left" title="opd">&nbsp;&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.arende"/></td>
                <td class="text14" align="left" title="h_xref">&nbsp;&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.extrefnr"/></td>
                <td class="text14" align="left" title="datum">
				<img onMouseOver="showPop('datum_info');" onMouseOut="hidePop('datum_info');"style="vertical-align:top;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
               	<spring:message code="systema.tvinn.sad.export.list.search.label.fdatum"/>
                <div class="text14" style="position: relative;" align="left">
                <span style="position:absolute;top:2px; width:250px;" id="datum_info" class="popupWithInputText text11"  >
                	Fra Dato
	           		Standardsøk (blank dato) er <b>7 dager på etterskudd</b> på den tiden. 
	           		<br/>
					Hvis du ønsker å se lenger tilbake i tid, angi datoen.<br/>
					For eksempel 010116 på utkikk etter en 1-Jan-2016 til i dag.
				</span>	
				</div>
                </td>
                <td class="text14" align="left" title="datumt"><spring:message code="systema.tvinn.sad.export.list.search.label.tdatum"/></td>
                <td class="text14" align="left" title="setll">&nbsp;&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.lopenr"/></td>
                <td class="text14" align="left" title="status">
                <img onMouseOver="showPop('status_info');" onMouseOut="hidePop('status_info');"style="vertical-align:top;" width="12px" height="12px" src="resources/images/info3.png" border="0" alt="info">
                <spring:message code="systema.tvinn.sad.export.list.search.label.status"/>
                <div class="text11" style="position: relative;" align="left">
                <span style="position:absolute;top:2px; width:250px;" id="status_info" class="popupWithInputText text11"  >
		           		<br/>
		           		Bare status <b>M</b> (Fejl) eller <b>' '</b> kan redigeres. 
		           			<ul>
		           				<li><b>' '</b>&nbsp;Deklarasjonen er åpen for endring.
		           				<li><b>+</b>&nbsp;Systemet lager nu utgående EDIFACT melding for å kunne sende deklarasjonen..</li>
		           				<li><b>A</b>&nbsp;Deklarasjonen ligger i en sending i påvente av å bli sendt.</li>
		           				<li><b>C</b>&nbsp;Sendingen er videresendt til TVINN.</li>
		           				<li><b>D</b>&nbsp;Melding om dokumentkontroll er mottatt fra Tollvesenet.</li>
		           				<li><b>E</b>&nbsp;Deklarasjonen blir endret av en saksbehandler.</li>
		           				<li><b>F</b>&nbsp;Edifacttekniske fejl oppdaget.</li>
		           				<li><b>K</b>&nbsp;Deklarasjonen er klar for utskrift men er ikke skrevet ut.</li>
		           				<li><b>L</b>&nbsp;Deklarasjonen er klar for utskrift men er ikke skrevet ut.</li>	
		           				<li><b>M</b>&nbsp;Tollteknisk fejl</li>
		           				<li><b>P</b>&nbsp;Deklarasjonen er skrevet ut. Hvis den er sendt på TVINN vil denne koden bety at tollkvittering er mottatt fra Tollvesenet og skrevet ut.</li>
		           				<li><b>Q</b>&nbsp;Deklarasjonen ligger i utgående postkasse for TVINN. men er ikke sendt.</li>
		           				<li><b>T</b>&nbsp;Informasjonsmelding om at deklarasjonen er lagt til manuell ekspedering hos Tollvesenet.</li>
		           				<li><b>U</b>&nbsp;Utleveringsattest er mottatt fra Tollvesenet.</li>
		           				<li><b>V</b>&nbsp;Melding om varekontroll er mottatt fra Tollvesenet.</li>
		           				<li><b>1</b>&nbsp;Melding fra Input-kontroll / Toller er mottatt og klar til å skrives ut.</li>	
		           				<li><b>2</b>&nbsp;Utleveringsattest er mottatt fra Tvinn og klar til å skrives ut.</li>	
		           				<li><b>3</b>&nbsp;Tollkvittering/tolldeklarasjon er mottatt fra Tvinn og klar til å skrives ut.</li>		           				
		           			</ul>
					</span>	
					</div>
                </td>
                <td class="text14" align="left" title="avsNavn">&nbsp;&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.avsandare"/></td>
                <td class="text14" align="left" title="motNavn">&nbsp;&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.mottagare"/></td>
                <td class="text14" align="left" title="sign">&nbsp;&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.godsnr"/></td>
                <td class="text14" align="left" title="semi">&nbsp;&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.innstikk"/></td>
                
                <td>&nbsp;</td>
			</tr>
 	        <tr>
				<td align="left" >&nbsp;
           			<select class="selectMediumBlueE2" name="avd" id="avd">
	            		<option value="">-velg-</option>
	 				  	<c:forEach var="record" items="${model.avdList}" >
                       	 	<option value="${record.avd}"<c:if test="${searchFilterSadExport.avd == record.avd}"> selected </c:if> >${record.avd}<c:if test="${record.tst== '2'}">&nbsp;(test)</c:if></option>
						</c:forEach> 
					</select>
				</td>
				<td align="left" >
           			<select class="selectMediumBlueE2" name="sg" id="sg">
	            		<option value="">-velg-</option>
	 				  	<c:forEach var="record" items="${model.signList}" >
                       	 	<option value="${record.sign}"
                    	 		<c:if test="${searchFilterSadExport.sg == record.sign}"> selected </c:if> >
                          	 		${record.sign}</option>
						</c:forEach> 
					</select>
				</td>
				<td align="left" ><input type="text" class="inputText" name="opd" id="opd" size="8" maxlength="7" value='${searchFilterSadExport.opd}'>&nbsp;</td>
				<td align="left" ><input type="text" class="inputText" name="xref" id="xref" size="10" maxlength="35" value='${searchFilterSadExport.xref}'>&nbsp;</td>
				<td align="left" ><input onKeyPress="return numberKey(event)" type="text" class="inputText" name="datum" id="datum" size="7" maxlength="6" value='${searchFilterSadExport.datum}'>&nbsp;</td>
				<td align="left" ><input onKeyPress="return numberKey(event)" type="text" class="inputText" name="datumt" id="datumt" size="7" maxlength="6" value='${searchFilterSadExport.datumt}'>&nbsp;</td>
				<td align="left" ><input type="text" class="inputText" name="setll" id="setll"size="10" maxlength="35" value='${searchFilterSadExport.setll}'>&nbsp;</td>
				<td align="left" ><input type="text" class="inputText" name="status" id="status" size="1" maxlength="1" value='${searchFilterSadExport.status}'>&nbsp;</td>
				<td align="left" ><input type="text" class="inputText" name="avsNavn" id="avsNavn" size="9" maxlength="50" value='${searchFilterSadExport.avsNavn}'>&nbsp;</td>
				<td align="left" ><input type="text" class="inputText" name="motNavn" id="motNavn" size="9" maxlength="50" value='${searchFilterSadExport.motNavn}'>&nbsp;</td>
				<td align="left" ><input type="text" class="inputText" name="godsnr" id="godsnr" size="10" maxlength="50" value='${searchFilterSadExport.godsnr}'>&nbsp;</td>
				<td align="left" ><input type="text" class="inputText" name="innstikk" id="innstikk" size="1" maxlength="1" value='${searchFilterSadExport.innstikk}'>&nbsp;</td>
				<td valign="top" align="left" >
                   &nbsp;<input class="inputFormSubmit" type="submit" name="submit" id="submit" value='<spring:message code="systema.tvinn.sad.search"/>'>
              
                </td>
			</tr>
			</form>
			<tr height="10"><td></td></tr>
		</table>
	</td>
	</tr>
	<tr height="3"><td></td></tr>
	<%-- Validation errors --%>
	<spring:hasBindErrors name="record"> <%-- name must equal the command object name in the Controller --%>
	<tr>
		<td>
           	<table width="100%" align="left" border="0" cellspacing="0" cellpadding="0">
           	<tr>
			<td class="textError">					
	            <ul>
	            <c:forEach var="error" items="${errors.allErrors}">
	                <li >
	                	<spring:message code="${error.code}" text="${error.defaultMessage}"/>
	                </li>
	            </c:forEach>
	            </ul>
			</td>
			</tr>
			</table>
		</td>
	</tr>
	</spring:hasBindErrors>	
	<%-- list component --%>
	<c:if test="${not empty list}">
	<tr>
		<td>		
		<table width="100%" cellspacing="0" border="0" cellpadding="0">
	    	<%-- separator --%>
	        <tr height="1"><td></td></tr> 
			<tr>
				<td>
				<table width="100%" cellspacing="0" border="0" cellpadding="0">
					<thead>
					<tr class="tableHeaderField" height="20" >
	                    <th class="tableHeaderFieldFirst">&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.avd"/>&nbsp;</th>   
	                    <th class="tableHeaderField" nowrap>&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.signatur"/>&nbsp;</th>
	                    <th class="tableHeaderField" nowrap><spring:message code="systema.tvinn.sad.export.list.search.label.update"/></th>
	                    <th class="tableHeaderField">&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.arende"/>&nbsp;</th>
	                    <th class="tableHeaderField">&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.extrefnr"/>&nbsp;</th>
	                    <th class="tableHeaderField" nowrap>&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.datum"/>&nbsp;</th>
	                    <th class="tableHeaderField" nowrap>&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.lopenr"/>&nbsp;</th>
	                    <th class="tableHeaderField">&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.status"/>&nbsp;</th>
	                    <th class="tableHeaderField">&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.avsandare"/>&nbsp;</th>
	                    <th class="tableHeaderField">&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.mottagare"/>&nbsp;</th>
	                    <th class="tableHeaderField">&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.godsnr"/>&nbsp;</th>
	                    <th class="tableHeaderField" align="center">&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.innstikk"/>&nbsp;</th>
	                    <th class="tableHeaderField" align="center">&nbsp;EP&nbsp;</th>
	                     <%-- START Omberegning --%>
	                    <th class="tableHeaderFieldOmberegning" align="center">&nbsp;Omber&nbsp;</th>
	                    <th class="tableHeaderFieldOmberegning" align="center">&nbsp;St&nbsp;</th>
	                    <th class="tableHeaderFieldOmberegning" align="center">&nbsp;Dato&nbsp;</th>
	                    <th class="tableHeaderFieldOmberegning" align="center">&nbsp;Løpenr&nbsp;</th>
	                    <%-- END Omberegning --%>
	                    <th class="tableHeaderField" align="center">&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.notisblock"/>&nbsp;</th>	                    
	                    <th class="tableHeaderField">&nbsp;<spring:message code="systema.tvinn.sad.export.list.search.label.kopieraArende"/></th>
	                </tr>  
	                </thead>
	                <tbody>   
		            <c:forEach items="${list}" var="topic" varStatus="counter">    
		               <c:choose>           
		                   <c:when test="${counter.count%2==0}">
		                       <tr class="tableRow" height="20" >
		                   </c:when>
		                   <c:otherwise>   
		                       <tr class="tableOddRow" height="20" >
		                   </c:otherwise>
		               </c:choose>
		               <td class="tableCellFirst" widtd="5%">&nbsp;${topic.avd}</td>
		               <td class="tableCell" >&nbsp;${topic.sg}</td>
		               <td nowrap class="tableCell" align="center">
	               	   		<a id="alinkCurrentdeaderId_${counter.count}" onClick="setBlockUI(tdis);" href="tvinnsadexport_edit.do?action=doFetch&avd=${topic.avd}&opd=${topic.opd}&sysg=${topic.sg}&setll=${topic.setll}&syst=${topic.status}&sydt=${topic.datum}&o2_sest=${topic.o2_sest}&o2_sedt=${topic.o2_sedt}&o2_semf=${topic.o2_semf}">
	               				<img title="Oppdatera tolldekl." valign="bottom" src="resources/images/update.gif" border="0" alt="edit">
            					</a>
               		   </td>
               		   <td class="tableCell" >&nbsp;
               		   		<a id="alinkCurrentdeaderOpdId_${counter.count}" onClick="setBlockUI(tdis);" href="tvinnsadexport_edit.do?action=doFetch&avd=${topic.avd}&opd=${topic.opd}&sysg=${topic.sg}&setll=${topic.setll}&syst=${topic.status}&sydt=${topic.datum}&o2_sest=${topic.o2_sest}&o2_sedt=${topic.o2_sedt}&o2_semf=${topic.o2_semf}">
	               				&nbsp;${topic.opd}
		               		</a>
		               </td>
		               <td class="tableCell" >&nbsp;${topic.h_xref}&nbsp;</td>
		               <td class="tableCell" >&nbsp;${topic.datum}&nbsp;</td>
		               <td class="tableCell" >&nbsp;${topic.setll}&nbsp;</td>
		               <td class="tableCell" >&nbsp;<b>${topic.status}&nbsp;</b></td>
		               <td class="tableCell" >&nbsp;${topic.avsNavn}&nbsp;</td>
		               <td class="tableCell" >&nbsp;${topic.motNavn}&nbsp;</td>
		               <td class="tableCell" >&nbsp;${topic.sign}&nbsp;</td>
		               <td class="tableCell" align="center"><b>${topic.semi}&nbsp;</b></td>
		               <td class="tableCell" >&nbsp;todo&nbsp;</td>
		               <td class="tableCellOmberegning" >&nbsp;${topic.o2_semf}&nbsp;</td>
		               <td class="tableCellOmberegning" >&nbsp;${topic.o2_sest}&nbsp;</td>
		               <td class="tableCellOmberegning" >&nbsp;${topic.o2_sedt}&nbsp;</td>
		               <td class="tableCellOmberegning" >&nbsp;${topic.o2_setll}&nbsp;</td>
		               <td class="tableCell" align="left">&nbsp;
	               		 <a href="editNotisblock.do?action=doFetch&subsys=sade&avd=${topic.avd}&opd=${topic.opd}&sign=${topic.sg}">
							<img title="Notisblokk til oppdrag" src="resources/images/largeTextContent.png" width="16px" height="16px" border="0" alt="notisblock">
							<font class="text14MediumBlue" style="font-style: italic;">${topic.opd}</font>
						 </a>
	               	   </td>
		               <td class="tableCell" >&nbsp;
		               		<%--<button class="buttonGray" type="button" name="copyButton${counter.count}" id="copyButton${counter.count}" >Kopiera</button> --%>
							<a class="copyLink" id="copyLink${counter.count}" runat="server" href="#">
								<img src="resources/images/copy.png" border="0" alt="copy">
							</a>
							 
							<div style="display: none;" class="clazz_dialog" id="dialog${counter.count}" title="Dialog">
								<form  action="tvinnsadexport_copyTopic.do" name="copyForm${counter.count}" id="copyForm${counter.count}" method="post">
								 	<input type="hidden" name="action${counter.count}" id="action${counter.count}" value='doUpdate'/>
									<input type="hidden" name="originalAvd${counter.count}" id="originalAvd${counter.count}" value='${topic.avd}'/>
				 					<input type="hidden" name="originalOpd${counter.count}" id="originalOpd${counter.count}" value='${topic.opd}'/>
					 					
									<p class="text14" >Du må velge nye&nbsp;<code>Avdeling</code>&nbsp;og ny&nbsp;
										<code>Signatur</code> for å kunne kopiere en tolldeklarasjon
									</p>
									<p class="text14" >En ny Tolldeknr. vil bli opprettet automatisk.
									</p>
									
									<table>
										<tr>
											<td class="text14" align="left" >&nbsp;Avdeling</td>
	                							<td class="text14" align="left" >&nbsp;Signatur</td>
	                						</tr>
	 									<tr>
											<td class="text14MediumBlue">
												<select class="newAvd" name="newAvd${counter.count}" id="newAvd${counter.count}">
								            		<option value="">-velg-</option>
								 				  	<c:forEach var="record" items="${model.avdList}" >
							                             	 	<option value="${record.avd}">${record.avd}</option>
													</c:forEach> 
												</select>
											</td>
											<td class="text14MediumBlue">
												<select class="newSign" name="newSign${counter.count}" id="newSign${counter.count}">
								            		<option value="">-velg-</option>
								 				  	<c:forEach var="record" items="${model.signList}" >
							                             	 	<option value="${record.sign}">${record.sign}</option>
													</c:forEach> 
												</select>
											</td>
										</tr>
									</table>
								</form>
							</div>
		               </td>
		            </tr> 
		            </c:forEach>
		            </tbody>
	            </table>
			</td>	
			</tr>
		</table>
		</td>
		</tr>
		
    </c:if> 
    
    		<tr>
		<td>
			<div id="dialogCopyFromTransportUppdrag" title="Dialog">
				<form  action="tvinnsadexport_doFetchTopicFromTransportUppdrag.do" name="copyFromTransportUppdragForm" id="copyFromTransportUppdragForm" method="post">
				 	<input type="hidden" name="actionGS" id="actionGS" value='doUpdate'/>
				 	
					<p class="text14" ><b>Ved å taste</b> avdeling og oppdragsnummer lages det en ny deklarasjon med utgangspunkt i data fra SYSPED Transportoppdrag.</p>
					<p class="text14">eller</p>
					<p class="text14" ><b>Ved å IKKE taste</b> avdeling og oppdragnummer lages det en ny deklarasjon med utgangspunkt i avdelingens standardopplysninger.</p>
					<p class="text14">Klikk deretter Fortsett.</p>
						
					<table>
						<tr>
							<td class="text14" align="left" >&nbsp;Avdeling</td>
    							<td class="text14" align="left" >&nbsp;Oppdragsnr.</td>
    							<td class="text14" align="left" >&nbsp;Ext.ref.nr.</td>
    						</tr>
						<tr>
							<td class="text14MediumBlue">
								<select name="selectedAvd" id="selectedAvd">
				            		<option value="">-velg-</option>
				 				  	<c:forEach var="record" items="${model.avdList}" >
	                             	 	<option value="${record.avd}"<c:if test="${searchFilterSadExport.avd == record.avd}"> selected </c:if> >${record.avd}<c:if test="${record.tst== '2'}">&nbsp;(test)</c:if></option>
									</c:forEach> 
								</select>
							</td>
							<td class="text14MediumBlue">
								<input type="text" class="inputText" id="selectedOpd" name="selectedOpd" size="10" maxlength="35" value=''>&nbsp;
							</td>
							<td class="text14MediumBlue">
								<input type="text" class="inputText" id="selectedExtRefNr" name="selectedExtRefNr" size="25" maxlength="35" value=''>&nbsp;
							</td>
						</tr>
					</table>
				</form>
			</div>
		</td>
		</tr>
		
    
</table>	
		
<!-- ======================= footer ===========================-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
<!-- =====================end footer ==========================-->

