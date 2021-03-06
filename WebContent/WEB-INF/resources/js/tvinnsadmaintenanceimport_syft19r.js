  //this variable is a global jQuery var instead of using "$" all the time. Very handy
  var jq = jQuery.noConflict();
  var counterIndex = 0;
  var BLOCKUI_OVERLAY_MESSAGE_DEFAULT = "Please wait...";
  
  function setBlockUI(element){
	  jq.blockUI({ css: { fontSize: '22px' }, message: BLOCKUI_OVERLAY_MESSAGE_DEFAULT});
  }
  
  jq(function() {
		//Clean values for createing new record
		jq('#newRecordButton').click(function() {
			jq('#klikod').val("");
			jq("#klikod").prop("readonly", false);
			jq("#klikod").removeClass("inputTextReadOnly");
			jq("#klikod").addClass("inputTextMediumBlueUPPERCASEMandatoryField");
			//rest of the gang
			jq('#klinav').val("");
			jq('#klisto').val("");
			//for update
			jq('#updateId').val("");
		});
}); 
  //-----------------------
  //GET specific db-record
  //-----------------------
  function getRecord(record){
	var id = record.id;
  	var applicationUserParam = jq('#applicationUser').val();
  	id = id.replace("recordUpdate_", "");
	  	
	jq.ajax({
  	  type: 'GET',
  	  url: 'getSpecificRecord_syft19r.do',
  	  data: { applicationUser : jq('#applicationUser').val(), 
  		  	  id : id },
  	  dataType: 'json',
  	  cache: false,
  	  contentType: 'application/json',
  	  success: function(data) {
	  	var len = data.length;
  		for ( var i = 0; i < len; i++) {
  			jq('#klikod').val("");jq('#klikod').val(data[i].klikod);
  			jq("#klikod").prop("readonly", true);
  			jq("#klikod").removeClass("inputTextMediumBlueUPPERCASEMandatoryField");
  			jq("#klikod").addClass("inputTextReadOnly");
  			
  			//rest of the gang
  			jq('#klinav').val("");jq('#klinav').val(data[i].klinav);
  			jq('#klisto').val("");jq('#klisto').val(data[i].klisto);
  			//for a future update
  			jq('#updateId').val("");jq('#updateId').val(data[i].klikod);
  			
  		}
  	  }, 
  	  error: function() {
  		  alert('Error loading ...');
  	  }
	});
		
  }
			
  //-------------------
  //Datatables jquery
  //-------------------
  //private function
  function filterGlobal () {
    jq('#mainList').dataTable().search(
    	jq('#mainList_filter').val()
    ).draw();
  }
  
  jq(document).ready(function() {
	  var lang = jq('#language').val();
	  jq('#mainList').dataTable( {
    	  "dom": '<"top">t<"bottom"flip><"clear">',
    	  "scrollY": "250px",
    	  "scrollCollapse":  false,
    	  "columnDefs": [{ "type": "num", "targets": 0 }],
    	  "lengthMenu": [ 75, 100],
  		  "language": {
  			  "url": getLanguage(lang)
           }   	  
  	  });
      
      //event on input field for search
      jq('input.mainList_filter').on( 'keyup click', function () {
      		filterGlobal();
      });
  	
  });
  