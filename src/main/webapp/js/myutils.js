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
			window.open("index.html",'_self');
			});
		});
		$("#track").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("trackregistrationlist.html",'_self');
			});
		});
		$("#btntrack").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("trackregistrationlist.html",'_self');
			});
		});
		$("#find").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("findregistration.html",'_self');
			});
		});
		$("#btnfind").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("findregistration.html",'_self');
			});
		});
		$("#payment").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("paymentlist.html",'_self');
			});
		});
		$("#btnpayment").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("paymentlist.html",'_self');
			});
		});

		$("#grievance").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("provgrievancelist.html",'_self');
			});
		});
		$("#btngrievance").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("provgrievancelist.html",'_self');
			});
		});

		// State Flow
		$("#home").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("index-state.html",'_self');
			});
		});
		// Launch MIPP Index page
		$("#mipp").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("mipp-index.html",'_self');
			});
		});
		$("#mipp1").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("mipp-index.html",'_self');
			});
		});
		
		// Launch Track Registration and Make payment 
		$("#btnregtraker").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("trackregistrationlist - state.html",'_self');
			});
		});
		$("#btninitpayment").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("initpaymentlist.html",'_self');
			});
		});
		$("#btnviewpay").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("providerpayedlist.html",'_self');
			});
		});
		$("#btnMUmetadata").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("mumetadatreeview.html",'_self');
			});
		});
		
		//Main Munu
		$("#mhr").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("meaningfuluse - state.html",'_self');
			});
		});
		$("#mhr1").click(function(){
			var myTimer = {};
			myTimer = $.timer(1500,function(){
			window.open("meaningfuluse - state.html",'_self');
			});
		});
		$("#hie").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("hie-base.html",'_self');
			});
			});
		$("#hie1").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("hie-base.html",'_self');
			});
		});
		$("#admin").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("admin-state.html",'_self');
			});
		});	
		
		$("#btntrackpayment").click(function(){
			//alert('hello');
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("meaningfuluse.html",'_self');
			});
		});	

		$("#btnreport").click(function(){
			//alert('hello');
			var myTimer = {};
			myTimer = $.timer(2500,function(){	
			window.open("reports-dash.html",'_self');
			});
		});	
		$("#btnrpt1").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){	
			window.open("registration-report.html",'_self');
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
			window.open("patient-discovery.html",'_self');
			});
		});
		$("#query").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("patient_discovery_results.html",'_self');
			});
		});
		$("#retrieve").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("patient-discovery.html",'_self');
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
				window.open("patient_discovery_results.html",'_self');
				return false;
				}
				});
				
		});
		$("#QueryDocs").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("document_listing.html",'_self');
			});
		});
		$("#Retrieve").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("document_Retrieved.html",'_self');
			});
		});
		$("#Back").click(function(){
			var myTimer = {};
			myTimer = $.timer(2500,function(){
			window.open("patient_discovery_results.html",'_self');
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