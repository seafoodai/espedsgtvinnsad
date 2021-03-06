  //this variable is a global jQuery var instead of using "$" all the time. Very handy
  var jq = jQuery.noConflict();
  var counterIndex = 0;

  jq(function() {
		//Clean values for createing new record
		jq('#newRecordButton').click(function() {
			jq('#ksakd').val("");
			jq("#ksakd").prop("readonly", false);
			jq("#ksakd").removeClass("inputTextReadOnly");
			jq("#ksakd").addClass("inputTextMediumBlueMandatoryField");
			//
			jq('#ksaft').val("");
  			
			//for update
			jq('#updateId').val("");
		});
}); 

  //-----------------------
  //GET specific db-record
  //-----------------------
  function getRecord(record){
	var rawId = record.id;
  	var applicationUserParam = jq('#applicationUser').val();
  	rawId = rawId.replace("recordUpdate_", "");
  	
	jq.ajax({
  	  type: 'GET',
  	  url: 'getSpecificRecordExport_sad002_kodtsar.do',
  	  data: { applicationUser : jq('#applicationUser').val(), 
  		  	  id : rawId },
  	  dataType: 'json',
  	  cache: false,
  	  contentType: 'application/json',
  	  success: function(data) {
	  	var len = data.length;
  		for ( var i = 0; i < len; i++) {
  			jq('#ksakd').val("");jq('#ksakd').val(data[i].ksakd);
  			jq("#ksakd").prop("readonly", true);
  			jq("#ksakd").removeClass("inputTextMediumBlueMandatoryField");
  			jq("#ksakd").addClass("inputTextReadOnly");
  			//editable fields
  			jq('#ksaft').val("");jq('#ksaft').val(data[i].ksaft);
  			//for a future update
  			jq('#updateId').val("");jq('#updateId').val(data[i].ksakd);
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
  