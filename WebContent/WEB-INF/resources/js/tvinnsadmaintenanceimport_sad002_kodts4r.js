  //this variable is a global jQuery var instead of using "$" all the time. Very handy
  var jq = jQuery.noConflict();
  var counterIndex = 0;
  
  jq(function() {
		//Clean values for createing new record
		jq('#newRecordButton').click(function() {
			jq('#ks4trm').val("");
			jq("#ks4trm").prop("readonly", false);
			jq("#ks4trm").removeClass("inputTextReadOnly");
			jq("#ks4trm").addClass("inputTextMediumBlueMandatoryField");
			//
			jq('#ks4ftx').val("");
  			
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
  	  url: 'getSpecificRecord_sad002_kodts4r.do',
  	  data: { applicationUser : jq('#applicationUser').val(), 
  		  	  id : rawId },
  	  dataType: 'json',
  	  cache: false,
  	  contentType: 'application/json',
  	  success: function(data) {
	  	var len = data.length;
  		for ( var i = 0; i < len; i++) {
  			jq('#ks4trm').val("");jq('#ks4trm').val(data[i].ks4trm);
  			jq("#ks4trm").prop("readonly", true);
  			jq("#ks4trm").removeClass("inputTextMediumBlueMandatoryField");
  			jq("#ks4trm").addClass("inputTextReadOnly");
  			//editable fields
  			jq('#ks4ftx').val("");jq('#ks4ftx').val(data[i].ks4ftx);
  			//for a future update
  			jq('#updateId').val("");jq('#updateId').val(data[i].ks4trm);
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
  