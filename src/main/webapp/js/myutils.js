function CloseOverLay()
{
	$("#CloseBtn").click();
}
function OpenProcessor()
{
	$("#showProcessor").click();
}
function timer()
{
jQuery.timer = function(time,func,callback){
		var a = {timer:setTimeout(func,time),callback:null}
		if(typeof(callback) == 'function'){a.callback = callback;}
		return a;
	};
}

function links()
{
		
		// Provider Flow
		$("#homep").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("index.jsp",'_self');
			});
		});
		$("#track").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("trackregistrationlist.jsp",'_self');
			});
		});
		$("#btntrack").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("trackregistrationlist.jsp",'_self');
			});
		});
                $("#btnstart").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("startregistration.jsp",'_self');
			});
		});
		$("#find").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("findregistration.jsp",'_self');
			});
		});
		$("#btnfind").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("findregistration.jsp",'_self');
			});
		});
		$("#payment").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("paymentlist.jsp",'_self');
			});
		});
		$("#btnpayment").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("paymentlist.jsp",'_self');
			});
		});

		$("#grievance").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("provgrievancelist.jsp",'_self');
			});
		});
		$("#btngrievance").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("provgrievancelist.jsp",'_self');
			});
		});

		// State Flow
		$("#home").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("index-state.jsp",'_self');
			});
		});
		// Launch MIPP Index page
		$("#mipp").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("mipp-index.jsp",'_self');
			});
		});
		$("#mipp1").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("mipp-index.jsp",'_self');
			});
		});
		
		// Launch Track Registration and Make payment 
		$("#btnregtraker").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("trackregistrationlist - state.jsp",'_self');
			});
		});
		$("#btninitpayment").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("initpaymentlist.jsp",'_self');
			});
		});
		$("#btnviewpay").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("providerpayedlist.jsp",'_self');
			});
		});
		$("#btnMUmetadata").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("mumetadatreeview.jsp",'_self');
			});
		});
		
		//Main Munu
		$("#mhr").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("meaningfuluse - state.jsp",'_self');
			});
		});
		$("#mhr1").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("meaningfuluse - state.jsp",'_self');
			});
		});
		$("#hie").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("hie-base.jsp",'_self');
			});
			});
		$("#hie1").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("hie-base.jsp",'_self');
			});
		});
		$("#admin").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("admin-state.jsp",'_self');
			});
		});	
		
		$("#btntrackpayment").click(function(){
			//alert('hello');
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("meaningfuluse.jsp",'_self');
			});
		});	

		$("#btnreport").click(function(){
			//alert('hello');
			var myTimer = {};
			myTimer = $.timer(2500,function(){	
			window.open("reports-dash.jsp",'_self');
			});
		});	
		$("#btnrpt1").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){	
			window.open("registration-report.jsp",'_self');
			});
		});
		$("#btnrpt2").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){	
			window.open("supportdocs/List Participating Providers Report.pdf",'_new');
			});
		});
		$("#btnrpt3").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){	
			window.open("supportdocs/Paid to Date Fiscal Report.pdf",'_new');
			});
		});
		$("#mhrpdf").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("mhr.pdf",'_new');
			});
		});			
		$("#pd").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("patient-discovery.jsp",'_self');
			});
		});
		$("#query").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("patient_discovery_results.jsp",'_self');
			});
		});
		$("#retrieve").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("patient-discovery.jsp",'_self');
			});
		});
		$('#localpidsearch').click(function(){
		var myTimer = {};
		myTimer = $.timer(2500,function(){
		if ( document.patientform.localid.value == "")
				{
				$('#dialog').text('Please enter a valid patient ID.');
				$('#dialog').dialog('open');
				return false;
				}else if ( document.patientform.localid.value != "2468013579"){
				$('#dialog').text('The patient ID  '+document.patientform.localid.value+' is not found within the local MPI.');
				$('#dialog').dialog('open');
				return false;
				}
				else{
				document.patientform.firstname.value="Gary";
				document.patientform.lastname.value="Smith";
				document.patientform.gender.value="Male";
				document.patientform.dob.value="12 Dec, 1978";
				document.patientform.street.value="Cedar Street, 2378";
				document.patientform.city.value="Lansing";
				document.patientform.state.value="Michigan";
				document.patientform.firstname.disabled=true;
				document.patientform.lastname.disabled=true;
				document.patientform.gender.disabled=true;
				document.patientform.dob.disabled=true;
				document.patientform.street.disabled=true;
				document.patientform.city.disabled=true;
				document.patientform.state.disabled=true;
				return false;
				}
				});
				
		});
		$('#Discover').click(function(){
		var myTimer = {};
		myTimer = $.timer(2500,function(){
		if ( document.patientform.localid.value == "")
				{
				$('#dialog').text('Please enter a valid patient ID.');
				$('#dialog').dialog('open');
				return false;
				}else if ( document.patientform.localid.value != "2468013579"){
				$('#dialog').text('The patient ID  '+document.patientform.localid.value+' is not found within the local MPI.');
				$('#dialog').dialog('open');
				return false;
				}
				else{
				window.open("patient_discovery_results.jsp",'_self');
				return false;
				}
				});
				
		});
		$("#QueryDocs").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("document_listing.jsp",'_self');
			});
		});
		$("#Retrieve").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("document_Retrieved.jsp",'_self');
			});
		});
		$("#Back").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("patient_discovery_results.jsp",'_self');
			});
		});
		
}
function showprocessor()
{
var triggers = $(".modalInput").overlay({
	mask: {
		color: '#ebecff',
		loadSpeed: 1000,
		closeSpeed: 1000,
		opacity: 0.5
	},
	onLoad: function(){
	window.setTimeout(function() {
	 window.parent.CloseOverLay(); 
   }, 2000)
}
});
}

function over_button(buttonname,src) {   
   var button1_over = new Image();
  button1_over.src = src;
    document[buttonname].src = button1_over.src;
}
function up_button(buttonname,src) {
	 var button1_up = new Image();
  button1_up.src = src;
    document[buttonname].src = button1_up.src
  }