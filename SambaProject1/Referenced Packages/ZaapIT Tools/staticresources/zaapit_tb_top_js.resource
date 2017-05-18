function preAddRowBublein(obj){
	var titd1=$(obj).attr("titd1");
	closeOctrF1O();
	if(titd1==null){
		
		$(obj).attr("titd1","1");
		//alert(NumberOfNewRows);
		if(NumberOfNewRows==""){
			NumberOfNewRows="1";
		}
		var html1=$(obj).attr("title")+": <input type='text' class='addrowsINP' value='' onclick='stopProp1(event);' onkeyup='var v1=$(this).val().replace(/[^0-9]/ig,\"\");$(this).val(v1);NumberOfNewRows=v1;' onkeydown='if(event!=null && event.keyCode===13){preAddRow();return false;}'>";
        //$(obj).attr("onmouseover","");
		//$(obj).attr("title","");
		openQtip1(obj,html1,"bottom center","top center",function(){$(".addrowsINP").val(NumberOfNewRows.replace('.0',''));});
		//$(obj).tooltip({content:html1
		//,position: { my: "left top+5", at: "left bottom", collision: "flipfit"} 
		//,items:"[onmouseover]",hide: { effect: "fadeOut",delay:15000, duration: 300 },open:function(){$(".addrowsINP").val(NumberOfNewRows.replace('.0',''));}}).tooltip( "open" );
		
    }
}
function fixTitlex1(obj,stopP1){
		//alert($(obj).prop("tagName")+" "+$(obj).find("a.btt1[alnk]").size());
	if($(obj).attr("titd1")==null && $(obj).find("a[onblur]").size() > 0){
		$(obj).attr("titd1","1");
		fixLnkIntById($(obj).find("a[onblur]")[0]);
		
	}
	if($(obj).attr("alnk")!=null || $(obj).find("a.btt1[alnk]").size() > 0|| $(obj).hasClass("btt1") || isSF1() || isMobileRSMode() || $(obj).find("input,select,textarea").size()>0){
		$(obj).attr("titd1","1");
	}
    var titd1=$(obj).attr("titd1");
    var tagName=$(obj).prop("tagName").toLowerCase();
    if(titd1==null && (tagName=="a" || tagName=="span" || tagName=="div" || tagName=="label")){
    	var _elm = obj;
	    var _hasScrollBar = false;
		
	    if ((_elm.clientHeight < _elm.scrollHeight) || (_elm.clientWidth < (_elm.scrollWidth-15)) || (!$(_elm).hasClass("thTxtzp") && $(_elm).width() > ($(_elm).parents("td:first").width()-15))|| $(_elm).hasClass("thTxtzp") ) {
	        _hasScrollBar = true;
	    }
	    if(_hasScrollBar){
	    	
        	$(obj).attr("titd1","1");
        	closeOctrF1O();
        	var ost1I=$(obj).find(".ost1I:visible");
        	var ost1P=$(obj).parents("td:first");
        	//_elm.clientWidth < _elm.scrollWidth || 
        	if(ost1I.length>0 && ost1I.width()+16> $(ost1P).width()){
        		ost1I.addClass("HOV");
        	}
        	if(stopP1==null && $(obj).prop("tagName")!="a" && $(obj).find("a").size()==0 && $(obj).prop("tagName")!="LABEL"){
        		$(obj).click(stopProp1);
        	}
	        var tit=$(obj).attr("title");
	        var text=$.trim($(obj).text());
	        
			//alert(text+"+++++"+text.indexOf("<br"));
	        if( tit==null && text!=null && text!='' && (_hasScrollBar || text.length>30)){
	            var html1=$(obj).html();
	            $(obj).css({"cursor":"help"});
	            //$(obj).attr("title",html1);
	            //alert(text);
	            //$(obj).tooltip({ content:html1,items: "[onmouseover]"}).tooltip( "open" );
	            if($(obj).hasClass("thTxtzp")){
	            	openQtip1(obj,html1,"bottom center","top center");
	            }else{
	            	openQtip1(obj,html1);
	            }
	        }
        }
        
    }else{
    	$(obj).attr("titd1","1");
    }
}

function afix1(obj){
	var href=$(obj).attr("href");
	navigateZP(href,window.top);
}
function btnClk1(href){
	if(href.indexOf("retURL=")>-1){
	   href=href.replace(/retURL\=[^\&]+/,"retURL="+(parentLocParam1!="" && mainIDForURL==""?escape(parentLocParam1):currentURL));
	}
	navigateZP(href,window.top);
}
function openQtip1Ajax(obj,alnk,my1,at1,removeClick,fixLinks,noViewport){ 
var isSf1x=isSF1();
//alert(alnk + isSFLight1XV);
if(alnk!=null && alnk.indexOf("/m?isAjax")>-1 && ( alnk.indexOf("lightning.force.com")>-1 || isSFLight1XV)){
	return;
}
if(isSf1x){
my1="center";
at1="center";
}
lastQtip1=$(obj).qtip({
    content: {
        text: function(event, api) {
            $.ajax({ url: alnk  ,statusCode: {302: function() {
		      top.location=top.location;
		    }}})
                .done(function(html) {//
                	if(fixLinks==null){
                	   html=html.replace(/<a /ig,"<a onclick='afix1(this);return false;' ").replace(/navigateToUrl/ig,"btnClk1");
                	}
                    api.set('content.text', html);
                    fixIfmHegt();
                })
                .fail(function(xhr, status, error) {
                    
                   api.set('content.text', status + ': ' + error);
                })

            return "<div class='bbt1Loading'></div>";
        },
        button: true
    },
    show: {
        ready: true,
        solo: $(".Zstbl1WS"),
        delay: 300,
        modal:isSf1x
    },
    style: {
        classes: 'qtip-light qtip-shadow qtip-rounded qtip-brd-gry qtip-ajax',   
         tip: {
            corner: !isSf1x,
            width: 15,
            height:15
        }
    },
    position: {
        viewport: (noViewport!=null?$("body"):$(self)),
        my: (my1?my1:'leftTop  left'),  // Position my top left...
        at: (at1?at1:'bottom right'), // at the bottom right of...
        target: (isSf1x?$("body"):$(obj)) // my target
    },
    hide: {
        fixed: true,
        delay: 500,
        event: (removeClick?"mouseleave":"click mouseleave")+""
    },
    events:{
       show: function(event, api) {
            fixIfmHegt();
        },hide: function(event, api) {
            fixIfmHegt();
        }
    }
    
});
}
var lastQtip1=null;
function openQtip1(obj,html1,my1,at1,onshow,modal,removeClick){
var isSf1x=isSF1();
if(!isSf1x){
	
lastQtip1=$(obj).qtip({
    content: {
        text: html1,
        button: true
    },
    show: {
        ready: true,
        solo: $(".Zstbl1WS"),
        modal:(modal!=null),
        delay: 300
    },
    style: {
        classes: 'qtip-light qtip-shadow qtip-rounded qtip-brd-gry',   
         tip: {
            corner: !isSf1x,
            width: 15,
            height:15
        }
    },
    position: {
        viewport: $("body"),//$(self),
        container:$(".mZPForm1"),
        my: (my1==null?'leftTop left':my1),  // Position my top left...
        at: (at1==null?'bottom right':at1), // at the bottom right of...
        //target: $('.selector') // my target
    },
    hide: {
        fixed: true,
        delay: 500,
        event: (removeClick!=null?"mouseleave":"click mouseleave")+""
    },
    events:{
       show:(onshow==null?function(event, api) {
            fixIfmHegt();
        }:onshow)
        ,hide: function(event, api) {
            fixIfmHegt();
        }
    }
       
    
});
}
}
var positionL1= { my: "right-15 center", at: "left center" };
function fixTitlex2(obj,worksOnMob,pos,reopenQT,removeClick){
	if(reopenQT!=null){
		$(obj).removeAttr("titd1");
	}
	var titd1=$(obj).attr("titd1");
	$(obj).attr("titd1","1");
	if(titd1==null && (worksOnMob==null || worksOnMob==isMobileRSMode())){
		$(obj).attr("titd1","1");
		closeOctrF1O();
		if(pos!=null && pos=='L'){
			//$(obj).tooltip({ content:$(obj).attr("title"),position:positionL1}).tooltip( "open" );
			openQtip1(obj,$(obj).attr("title"),"center right","center left",null,null,removeClick);
		}else if(pos!=null && pos=='R'){
			
			openQtip1(obj,$(obj).attr("title"),"left center","right center",null,null,removeClick);
		}else{
		 	//$(obj).tooltip({ content:$(obj).attr("title")}).tooltip( "open" );
		 	openQtip1(obj,$(obj).attr("title"),"bottom center","top center",null,null,removeClick);
		}
	}
}
var totChanged=0;
function cbAll(obj){
    var isCHK=$(obj).prop("checked");
    $(".lcbX input[type='checkbox']").each(function(){$(this).prop("checked",isCHK);});
}
function cbAllV(obj){

    $("input.lcbXAll").prop("checked",($(obj).prop("checked") && $("input.lcbXRow").size()==$("input.lcbXRow:checked").size()));
}

function fixCommuniPD1(){

    var loc1=(self.location+"");
  if(loc1.indexOf(".com/servlet/")==-1 && loc1.indexOf(".com/apex/")==-1 && !isInIframe()){
        $(".zen-select").each(function(){
            var thisO=$(this);
            var trigger=thisO.find(".zen-trigger");
            if(trigger.hasClass("zenfixZP")){
            	return false;
            }
            trigger.addClass("zenfixZP");
            var options=thisO.find(".zen-options");
            if(trigger.size()==1 && options.size()==1){
                trigger.click(function(){
                    if(!options.is(":visible")){
                        $(".zen-select .zen-options:visible").hide();
                    }
                    options.toggle();
                    return false;
                });
            }
        });
   }
    
}
var lastmarkChangeRW=null;
function markChangeRW(obj,refresh){

    var rowChanged=false; 
    var mTR=$(obj).parents("tr.dataRow:first");
	var valChnaged=$(obj).data("oldV")!=$(obj).val();
	if(valChnaged){
		$(obj).addClass("mFu1");
	}else{
		$(obj).removeClass("mFu1");
	}
    mTR.find("input,select,textarea").each(function(){
        rowChanged=rowChanged||$(this).data("oldV")!=$(this).val();
        if($(this).prop("checked")!=null && !$(this).parent().hasClass("lcbX")){
            rowChanged=rowChanged||$(this).data("oldCH")!=$(this).prop("checked");
        }
    });
	//alert($(obj).text()+ " "+rowChanged);
    if(rowChanged){
        if(!mTR.hasClass("marked")){
            totChanged++;
        }       
        mTR.addClass("marked");
        mTR.find(".lcbX input").prop("checked",true);
    }else{
        if(mTR.hasClass("marked")){
            totChanged--;
        }       
        mTR.removeClass("marked");
        mTR.find(".lcbX input").prop("checked",false);
    }
	if(lastmarkChangeRW!=null){
		try{
		window.clearTimeout(lastmarkChangeRW);
		}catch(e1){}
	}
    lastmarkChangeRW=window.setTimeout(function(){showChanged1(refresh);},150);
}
function showChanged1(refresh){
	lastmarkChangeRW=null;
	totChanged=$("#mainTBX1 tbody tr.marked .lcbX").size();
    $(".unSVNum").html(totChanged+"");
    if(totChanged!=0){
        $(".btnsSV").addClass("x");
    }else{
        $(".btnsSV").removeClass("x");
    }
    if(refresh==null){
        checkPosFixHeaderResize();
        checkFilterHeaderResize();
        checkColumnFreeze();
    }
}


function fixLnkIntById(obj){//LookupHoverDetail.getHover
	var element=$(obj);
	//alert(this);
	try{
	if(isSF1()){
        	element.attr("onmouseout","").attr("onmouseover","").attr("onfocus","").attr("onblur","");
        }else{
            if( Show_Hover_Preview_On_Name_Field=="true"){
				element.attr("onmouseout","").attr("onmouseover","").attr("onfocus","").attr("onblur","").attr("alnk","../{0}/m?isAjaxRequest=1").attr("afld","href").attr("objk","1").addClass("btt1").click(function(event){
        		var href1=$(this).attr("href");
        		if(href1.indexOf("javascript:srcUp(")>-1){
        			var h2=href1;
        			h2=unescape(h2);
        			h2=h2.split("'")[1];
        			if(h2.indexOf("?isdtp=vw")>-1){
        				h2=h2.substring(0,h2.indexOf("?isdtp=vw"));
        			}
        			if(h2.indexOf("?isdtp=p1")>-1){
                        h2=h2.substring(0,h2.indexOf("?isdtp=p1"));
                    }
        			//alert(h2);
        			navigateZP(h2,window.top);
        		}else{
                	navigateZP(href1,window.top);
                }
                stopProp1(event);
               });

           }
       }
      // alert(1);
   }catch(e){}
}
   function fixLnkInternal(){
        try{
        /*if(window.self != window.top){
            $(".lnkPrp1 a[href!='']").click(function(){
                navigateZP($(this).attr("href"),window.top);
                return false;
            });
        }
        */
        if(false &&  !fixLinkStarted){
        fixLinkStarted=true;
        if(isSF1()){
        	$("#mainTBX1 a[onmouseout]").attr("onmouseout","").attr("onmouseover","").attr("onfocus","").attr("onblur","");
        }else{
        	if( false && Show_Hover_Preview_On_Name_Field=="true"){
        		$("#mainTBX1 span.ost1X a[onmouseover]").attr("onmouseout","").attr("onmouseover","").attr("onfocus","").attr("onblur","").attr("alnk","../{0}/m?isAjaxRequest=1").attr("afld","href").attr("objk","1").addClass("btt1").click(function(){
        		var href1=$(this).attr("href");
        		if(href1.indexOf("javascript:srcUp(")>-1){
        			var h2=href1;
        			h2=unescape(h2);
        			h2=h2.split("'")[1];
        			if(h2.indexOf("?isdtp=vw")>-1){
        				h2=h2.substring(0,h2.indexOf("?isdtp=vw"));
        			}
        			//alert(h2);
        			navigateZP(h2,window.top);
        		}else{
                	navigateZP(href1,window.top);
                }
                return false;
            });
        	}
        }
        fixLinkStarted=false;
        }
        }catch(e){}
   }
   var fixLinkStarted=false;
   var markCheckedRows=false;
   var isEditMode1=false;
   var cancleFocus1=false;
function fixOnload(){
//alert("fixOnload");
//if(true)reutrn;
    $(".availVals").html("<div class='ld1'></div>");
    $("#loadingx1").hide();
    //if(fixIfmHegt!=null)fixIfmHegt();
    if($(".foundX").size()==0){
//        $(".Zstbl1 h2.mainTitle").append('<span class="foundX">'+$("#found1").html()+'</span>');
			var extraDescTitle=$(".extraDescTitle");
			var extraDescTitleHTML="";
			if(extraDescTitle.size()!=0){
				extraDescTitleHTML="<span class=\"extraDescTx1\">"+extraDescTitle.html()+"</span>";
			}
        $(".Zstbl1 h2.mainTitle").append(extraDescTitleHTML+'<span class="foundX"></span>');
    }else{
        $(".foundX").html("");//$("#found1").html());
    }
    setTimeout( getTotals1,5);
    if(isEditMode1){

    $("td.btnicoflt").mouseover(function(){if(!cancleFocus1){$(".cancelBtn1").focus();}});
    $("#mainTBX1 tbody input, #mainTBX1 tbody select, #mainTBX1 tbody textarea").each(    function(){
    		if($(this).data("oldV")==null){
            $(this).data("oldV",$(this).val());
            if($(this).prop("checked")!=null && !$(this).parent().hasClass("lcbX")){
                $(this).data("oldCH",$(this).prop("checked"));
            }
            
	        if($(this).prop("tagName")=="SELECT" && $(this).attr("onchange")==null){
            	$(this).attr("onchange",'if(!$(this).parent().hasClass("lcbX")){markChangeRW(this,"1");}');
	        }else{
	            $(this).bind("focusout change",function(){
	                if(!$(this).parent().hasClass("lcbX")){
	                    markChangeRW(this,"1");
	                }
	            });
	        }
            
            /*.focus(function(){
                if(!$(this).parent().hasClass("lcbX")){
                    markChangeRW(this,"1");
                }
            }).focusout(function(){
                if(!$(this).parent().hasClass("lcbX")){
                    markChangeRW(this,"1");
                }
            });*/
			}
        });
        
    }
    if(markCheckedRows){
        $("#mainTBX1 tbody tr").each(function(){markCheckedRow(this);});
        totChanged=$("#mainTBX1 tbody tr.marked .lcbX").size();
        showChanged1();
    }
        
    
    fixLnkInternal();
    $(".CBMU1").prop("checked","");
        
        try{
        if(refreshAfterSave!=null){
        //refreshAfterSave();
        }
        }catch(e){}
        
        if(!markCheckedRows){
            checkPosFixHeaderResize();
            checkFilterHeaderResize();
        }
        //alert(isSearchFocus1 + $(".seatchInptFZP:visible").size());
        /*if(isSearchFocus1){
            isFirstLoadPage=false;
            var seatchInptFZP=$(".seatchInptFZP:first:visible");
            if(!isInIframe() && seatchInptFZP.size()>0){
                
                seatchInptFZP[0].focus();
                seatchInptFZP.val(seatchInptFZP.val());//end of word
            }
        }*/
        searchOnload1();

        prepareFilters2();
     
        //$("#scrollCntrls1").css({"top":(Math.round($(self).height()/2)-50)+"px"}).show();
        
    if(lastMassFunctionBtnCall!=null){
    	if($("#massUpdatein1").find(".errorMsg:first").size()>0){
    		$.globalEval(lastMassFunctionBtnCall);
    	}
    	lastMassFunctionBtnCall=null;
    }
    
    if((sortByFieldforColor!=null && sortByFieldforColor!='' ))colorRowsByFieldChange(sortByFieldforColor);
    if(fixCommuniZPD1Bool=="/**/"){
        	fixCommuniPD1();
    }
    if(false && isSF1()){
		lastColx1=3;
		$("#columnScrollW1 .l").fadeTo("fast",0.5);
		$("#columnScrollW1 .r").fadeTo("fast",1.0);
	}
	if(runMultiDepandantFix){
		retrySetmulti=0;
		if(lastCallfixMultiDependancefield!=null){
			clearTimeout(lastCallfixMultiDependancefield);
			lastCallfixMultiDependancefield=null;
		}
		lastCallfixMultiDependancefield=setTimeout(fixMultiDependancefield,30);
	}else{
		picklist.initAll=oldInitAll;
	}
	var hasDate1=false;
	$(".dateInput .dateFormat a[href]").each(function(){
		$(this).attr("onclick",$(this).attr("href")+";return false;");
		hasDate1=true;
	});
	if(hasDate1){
	   $(".dateInput input").on("click focus",function(){
		  var bh1=$("body").height();
		  //alert(bh1+" "+ $("#padBut1").height());
		  if(bh1<350 && $("#padBut1").height()<1){
		     $("#padBut1").height(350-bh1);
		     fixIfmHegt();
		  }
	   });
	}
	//return false;
	showHideRightFPan();

	//fix nextPrev (right side)
	if($('.prevBtn:disabled').size()==0){
        $('.prevBtnF').removeClass("ui-state-disabled");
    }else{
        $('.prevBtnF').addClass("ui-state-disabled");
    }
    if($('.nextBtn:disabled').size()==0){
        $('.nextBtnF').removeClass("ui-state-disabled");
    }else{
        $('.nextBtnF').addClass("ui-state-disabled");
    }
    
	$("body").trigger("OnLoadDone");
}

function showHideRightFPan(){
   try{
   		if(!isInIframe()){
		   $("#scrollCntrls1").show();
		}
	}catch(e){
	}
}
var runMultiDepandantFix=true;
var lastCallfixMultiDependancefield=null;
var retrySetmulti=0;

function fixMultiDependancefield(){
var noMultPickLIst=false;
	var doneX=0;
	if(  $(".multiSelectPicklistTable:first").size()>0){
		$(".multiSelectPicklistCell a").each(function(){
			$(this).attr("onclick",$(this).attr("href")+";return false;");
		});
		if(isEditMode1){
		try{
		if( retrySetmulti<=3 && (picklist==null || picklist.picklists==null || picklist.picklists.length==0)){
			retrySetmulti++;
			lastCallfixMultiDependancefield=setTimeout(fixMultiDependancefield,(fixMultiDependancefield+1)*150);
			return;
		}
		//alert($("select.iTb[multiple][selVal]").size()+" "+retrySetmulti);
		$("select.iTb[multiple][selVal]").each(function(){
			var selVal=$(this).attr("selVal");
			if(selVal!=null){
				
				var curMPL= picklist.picklists[$(this).attr("id")];
				
				//alert(curMPL.initialValue.length);
				if(curMPL!=null && (curMPL.initialValue==null || curMPL.initialValue.length==0 || curMPL.initialValue.join(";")!=selVal) ){//
					var selSplit=selVal.split(";");
					var newArr=new Array();
					for(var i=0;i<selSplit.length;i++){
						if(selSplit[i]!=""){
							newArr.push(selSplit[i]);
							newArr.push(selSplit[i]);
						}
					}
					//alert(newArr);
					curMPL.initialValue=newArr;
					curMPL.loaded=!1;
					doneX++;
				}
				
			}
		});
		
		}catch(e){alert(e);}
		

		}
	}else{
			noMultPickLIst=true;
	}
	if(true ){//|| retrySetmulti==3 || doneX>0 || !isEditMode1
		try{
		picklist.initAll=oldInitAll;
		picklist.initAll();
		picklist.initAll=function(){};
			
		}catch(e){alert(e);}
	}
//alert($(".iTd .multiSelectPicklistTable").size());
}
function clearBtnFocusIn(){
    var par1=$(this).parents("span:first");
    par1.find(".ui-icon-circle-closeZP").addClass("ui-icon-circle-closeZPH").show();
    par1.find(".searchTxt").hide();
}
function clearBtnFocusOut(){
    if($.trim($(this).val())==""){
        $(this).parents("span:first").find(".ui-icon-circle-closeZP").hide("fade",1000);
    }
}
function clickSearchTxt(obj){//searchTxt
    $(obj).hide();
    $(obj).parents("span:first").find("input:first").click().focus();
}

function searchOnload1(){
   
    //$("#foundX").html($("#found1").html());
    //.keypress(function(){searchChanged(2500);})
    $("input.seatchInptFZP:first").keyup(function(event){
        var waitMilis=1;
        if (event!=null && event.keyCode===13){
            waitMilis=1;
            searchChanged(waitMilis);
        }else{
            waitMilis=(isSF1()?1650:1650);
            searchChanged(waitMilis);
        }
        //searchChanged(waitMilis);
    
    }).focusin(clearBtnFocusIn).focusout(clearBtnFocusOut);
    
     prepareFilters();
     
    //setTimeout('$(".seatchInptFZP").attr("onfocus","");',300);
   fixIfmHegt();
   
}

function prepareFilters(){
	 $("input.filterinoIPT").keypress(filterCol).keyup(filterCol).focusin(clearBtnFocusIn).focusout(clearBtnFocusOut);//.tooltip({content:Filter_box_help_Title});
     $(".filtDatex1Mnx").each(function(){
        var vx1=$(this).val().split("~");
        if(vx1.length>0){
            var origFl=$(this).parents("span:first").attr("origFl");
            $("."+origFl+"1").val(vx1[0]);
            if(vx1.length>1){
                $("."+origFl+"2").val(vx1[1]);
            }
        }
        
     });
     $(".filterObjShow1 input.inptFilter").keyup(function(event){
        if (event!=null && event.keyCode===13){ 
            setTimeout(clickVisFilerBtn,10);
        }
     });
}
function prepareFilters2(){
  $("input.filtDatex1").datepicker( { 
    dateFormat: "yy-mm-dd"
    ,changeMonth: true
    ,changeYear: true 
    }).change(function(){
        var origFl=$(this).attr("origFl");
        $("."+origFl).val($("."+origFl+"1").val()+"~"+$("."+origFl+"2").val());
        filterCol(null,100);;//13
        
     }).css({"width":"69px","height":"17px"}).keydown(function(){return false;});
}
     

function markCheckedRow(row){
    if(!$(row).hasClass("marked") && $(row).find(".lcbX input:checked").length==1){
        $(row).addClass("marked");
        $(row).find("td:first").append("<input type='hidden' class='mupdateX' name='mupdateX' value='1' oldV='2'/>");
        //markChangeRW($(row).find(".mupdateX"))
        //totChanged++;
    }
}

function fixAfterScrollG1(){
//alert("after scroll");
	
            if(posFixth!=null){
                window.clearTimeout(posFixth);
            }
            posFixth=setTimeout(fixAferScroll,50);
            //fixAferScroll();
    

}
function checkXwf51(){
/*zp lstnr*/
try{
var eventMethodx1 = window.addEventListener ? "addEventListener" : "attachEvent";
var eventerx1 = window[eventMethodx1];var messageEventx1 = eventMethodx1 == "attachEvent" ? "onmessage" : "message";
eventerx1(messageEventx1,function(e) {
    try{
    if(e.data.indexOf("zaapit_tb_")>0){$.globalEval(e.data);  }  
}catch(e2){  }},false);
}catch(e1){}
}

function ready4ZP(){

     checkXwf51();
     
     
     try{
         if(window.self != window.top){
        if(!isSF1P){
            $(self).resize(function(){
                paretnAk1();
            }); 
        }else{
             paretnAk1();
        }
        fixIfmHegt();
        if(turnOnscrolModeForTabsRL==0){
            setTimeout(showMsgConf,4000);   
        }
        fixCommuniZPD1Bool="---";  
   }else{
        
   }
   }catch(e){}
   //searchOnload1();
  
   //, hide: { duration: 2500 }
   if(!isSF1P && isEditMode1){
       /*$(".lcbX").each(function(){
        var rid=$(this).attr("rid");
        var num=$(this).attr("num");
        var t1="<a href='../"+rid+"' target='_blank' >"+Label_View_Row+"</a>";
        if((rid==null || rid=="") && num!=null && num!=""){
        	t1=Unmark_to_ignore_row;//"<a href='javascript:void(0);' onclick='disableNotice1=true;removeNewRows("+num+");'>"+Label_remove_Row+"</a>";
        }
        $(this).tooltip({content:t1,items:"input[type='checkbox']", position: { my: "right-15 center", at: "left center" }, hide: { duration: 2500 }} );
        });
        */
        $("body").delegate("td.CBL .lcbX","mouseover",function(e1){
				if(isEditMode1 && $(this).data("LinkHov1")==null){
					$(this).data("LinkHov1","1");
					
					var rid=$(this).attr("rid");
			        var num=$(this).attr("num");
			        var t1="<a href='../"+rid+"' target='_blank' >"+Label_View_Row+"</a>";
			        if((rid==null || rid=="") && num!=null && num!=""){
			        	t1=Unmark_to_ignore_row;//"<a href='javascript:void(0);' onclick='disableNotice1=true;removeNewRows("+num+");'>"+Label_remove_Row+"</a>";
			        }
					$(this).attr("title",t1);
					fixTitlex2(this,false,'L');
					
					
				}
		});
        
        
         if($( "body" ).data("lookupInputClick1")==null){
         	$( "body" ).data("lookupInputClick1","1");
	        $( "body" ).delegate(".lookupInput a", "click", function() {
				cancleFocus1=true;
				setTimeout(function(){cancleFocus1=false;},3500);
			});
		}
    }
     if(!isSF1P && $( "body" ).data("copycell")==null){
        $( "body" ).data("copycell","1");
        $("body").delegate(".copyCell","mousedown",function(e1){
			copyCellStart(this,e1);
		});
		$("body").delegate("td.iTd,td.CBL","mouseenter",function(e1){
			copyCellHOVER(this,e1);
		});
		$("body").delegate("td.iTd,td.CBL","mouseup",function(e1){
			copyCellEnd(this,e1);
		});
		
		if(hasMassMerge=="true"){
			$("#massUpdatein .muf1[fld]").each(function(){
				MassMergefieldsToAvilOv[$(this).attr("fld")]=true;
			});
			$("body").delegate("tr.dataRow td[fld]","click",function(e1){//copy to master
				var fld=$(this).attr("fld");
				var fldEdit=MassMergefieldsToAvilOv[fld];
				if(!isEditMode1 && fldEdit!=null && fldEdit){
					var tr1=$(this).parents("tr.dataRow:first");
					var gnz=tr1.attr("gnz");
					$("tr.dataRow[gnz='"+gnz+"'] td[fld='"+fld+"'].copyCellMark").removeClass("copyCellMark");
					$(this).toggleClass("copyCellMark");
					if(!tr1.find(".lcbXRow").is(":checked")){
			    		tr1.find(".lcbXRow").click();
			    	}
				}else if(!isEditMode1 && fldEdit==null){
					var t1="Read Only Field";
					$(this).css({"cursor":"not-allowed"}).attr("title",t1);
					
					fixTitlex2(this,false);
				}
				
			});
			
			$("body").delegate("td.CBL .lcbX","mouseover",function(e1){//master mark
				if($(this).data("mergeHov1")==null && !isEditMode1){
					$(this).data("mergeHov1","1");
					var t1="<a href='javascript:void(0);' onclick='markAsMaster(\""+$(this).attr("rid")+"\");'>Mark as Master</a>";
					$(this).attr("title",t1);//
					$(this).find(".lcbXRow").click(function(){
						if(!$(this).prop("checked")){
							$(this).parents("tr:first").removeClass("gnzMSR");
							$(this).parents("tr:first").find(".copyCellMark").removeClass("copyCellMark");
						}
					});
					fixTitlex2(this,false,'L');
				}
			});
				
		}
	   }
    $(".mZPForm1").click(function(){
        closeAllTooltips();
    });
    
    runReadyJSIncZP();
    
    $(window).bind('beforeunload', function(eventObject) {
        var res=noticeUnsaveWin(eventObject);
        
        if(res!=null){
            return res;
        }
    });
	copyCellStarted1=false;
	
	if(currConf_name!="" && tp_conf!="" && tp_conf!=currConf_name){//open layout editor for new pages
		var tit1=$("#customizeViewx1").attr("title");
		if($("#customizeViewx1").data("ft1")==null){
			$("#customizeViewx1").data("ft1","1");
			$("#customizeViewx1").attr("title",tit1+" "+Create_a_new_Smart_Table);
		}
		$(".LE1X").click();
	}
	
}

function hideSuccess(){
	setTimeout(function(){
		var confirmM3=$(".confirmM3 img[alt='CONFIRM']");
		confirmM3.parents(".confirmM3:first").hide(500);
		},2500);
}

function removeNewRows(num){
	$(".lcbX[num='"+num+"']").parents("tr.dataRow:first").remove();
	setTimeout(function(){disableNotice1=false;},500);
}

function ready3ZP(){


                if(!isMobileRSMode()){
                    //$(".btt1L").tooltip({ content: function() {return $(this).attr("title");},position: { my: "right-15 center", at: "left center" }} );
                    //$(".btt1[title]").tooltip({ content: function() {return $(this).attr("title");}});
                }else{
                    //$(".helpQMSFDC.btt1[title]").tooltip({ content: function() {return $(this).attr("title");}});
                }
                if(topLeftFilterIMG!=null && topLeftFilterIMG!="" && topLeftFilterIMG!="/s.gif"){ 
                    //alert(topLeftFilterIMG);
                    $(".topFilterSave img.pageTitleIcon").attr("src",topLeftFilterIMG);
                }
                
                if(!isSF1() && NOT_hideEditButton=="true"){
                    $("#mainTBX1").addClass("IErmo");
                }
}

function ready2ZP(){

topLeftFilterIMG=$(".topFilterSave .pageTitleIcon.userDefinedImage").attr("src");
//$(document).tooltip({
//    position: { my: "right-15 center", at: "left center" },
//   items:".btt1L"});
   
//$(document).tooltip({items:".btt1[title"});

    tooltipFix();
   $("body").mouseup(bdMouseUp);
   $("body").mousemove(bdMouseMove);
   
   try{

		if(returnFocus!=""){
			setTimeout(function(){scrollTopObjRow1("a[href='"+returnFocus+"']:first");},900);
		}
	}catch(e){
	
	
	}
	if(!isSF1() && autoShowGuides=="1"){
		var welcome_guide_meLS=getLS1("welcome_guide_me");
		//alert(welcome_guide_meLS);
		if(welcome_guide_meLS==null){
			setLS1("welcome_guide_me","1")
			setTimeout(function(){guideMe('welcome_guide_me',0);},1000);
		}
	}
	

	setTimeout(trackgaX,1500);
}

function bdMouseMove(e){
	resizeColOv(e);
	moveColPos(e);
}
function bdMouseUp(e){
	resizeColSt(e);
	stopColPos(e);
}
function runReadyJSIncZP(){

//if(true)return;
    fixOnload();
    
    
     
        $(self).scroll(fixAfterScrollG1);
        
        if(EnableHorizontalScroll==1){
        	 $("#mainTBX1").scroll(fixAfterScrollG1);
        }
        $(self).resize(function(){
            if(posFixth!=null){
                window.clearTimeout(posFixth);
            }
            posFixth=setTimeout(fixAferResize,50);
            showHideRightFPan();
        });
        $("#handlebarContainer").click( function(){
                if(posFixth!=null){
                    window.clearTimeout(posFixth);
                }
                posFixth=setTimeout(fixAferResize,50);
        });
        
        readyFixLKPX();
       // if(isSF1()){
        //	$( "div#mainTBX1" ).on( "swipeleft", function(){columnSwitch(-1);} );
        //	$( "div#mainTBX1" ).on( "swiperight", function(){columnSwitch(1);} );
       // }
     autoPinGraph();
     markFieldINlineEdit();
     
     if($( "body" ).data("DelopenLookup")==null){
     	$( "body" ).delegate("a.iTb[href*='openLookup']", "click", function(event) {
     		disableNotice1=true;
     		setTimeout(function(){disableNotice1=false;},500);
     	}).data("DelopenLookup","1");
     }
     
}
var disableNotice1=false;
function markFieldINlineEdit(){
	if(!isSF1() && lastIDClicked!=null){
     	try{
	     	var td=$(".lcbX[rid='"+lastIDClicked+"']").parents("tr:first").find(".iTd."+lastFieldClicked);
	     	td.addClass("marked");
	     	var inputs=td.find("input:visible,select:visible,textarea:visible");
	     	if(inputs.size()>0){
	     		inputs[0].focus();
	     		
	     		$("html, body").animate({ scrollTop: Math.max($(inputs[0]).offset().top-650,0) }, "fast");
	     		
	     	}
	     	
	     	td.removeClass("marked",3500,function(){});

	 	}catch(e){}
	 	lastIDClicked=null;
		lastFieldClicked=null;
	 }
}
function fixAferResize(){
    checkPosFixHeaderResize();
    checkFilterHeaderResize(); 
    checkColumnFreeze(1);

}

function fixAferScroll(){
    checkPosFixHeader();
    checkFilterHeaderResize();
    checkColumnFreeze();
}
function closeFilterx(){

    //close filter
    if(lastOpenCFilterId!=null && lastOpenCFilterSearchBID!=null && $("#"+lastOpenCFilterSearchBID).is(":visible")){
        $("#"+lastOpenCFilterId).click();
    }
}
function checkPosFixHeaderResize(){
//alert("111");
        widthWasSetScroll=false;
            $(".floatTopHead").remove();
            $("#btnicofltTB").removeClass("btnicofltTBTOP");
            $("#mainTBX1 table:first").width("");
            $("#mainTBX1 thead th").width("");
           $("#btnicofltTB").parents("div:first").width("").height("");
            $("#btnicofltTB").width("").height("");
            if( isScrollMode()){
                checkPosFixHeader();
            }
}

function checkFilterHeaderResize(){

    if(lastOpenCFilterId!=null && lastOpenCFilterSearchBID!=null ){
        if(isScrollMode() && lastOpenCFilterId.indexOf("-2")==-1){
            lastOpenCFilterId=lastOpenCFilterId+"-2";
        }else if( !isScrollMode() && lastOpenCFilterId.indexOf("-2")>-1){
            lastOpenCFilterId=lastOpenCFilterId.substring(0,lastOpenCFilterId.length-2);
        }
        if( $("#"+lastOpenCFilterSearchBID).is(":visible")){
                 $("#"+lastOpenCFilterSearchBID).hide();
                 $("#"+lastOpenCFilterId).click();
        }
    }
     
}
function isScrollMode(){
			var res=!isSF1();
			if(res){
	            var pos1=$("#mainTBX1").offset();
	            var st1=$(self).scrollTop();
	            res=(st1!=null &&pos1!=null && pos1.top!=null && pos1.top <st1);
            }
            return res; 
}

var posFixth=null;
var widthWasSetScroll=false;
function checkPosFixHeader(){
			if(isSF1())return;
            var pos1=$("#mainTBX1").offset();
            
            var st1=$(self).scrollTop();
            var sl1= getCUrrScollLeft(true);
            if(!isSF1() && st1!=null &&pos1!=null && pos1.top!=null && pos1.top <st1){
                if($(".floatTopHead").size()==0){
                    if(!widthWasSetScroll){
                        widthWasSetScroll=true;
                            //closeFilterx();
                            $(".btnicoflt").parents("table:first").attr("id","btnicofltTB");
                            $("#btnicofltTB").width($("#btnicofltTB").width());
                                                
                            $("#btnicofltTB").height($("#btnicofltTB").height());
                            
                            var firstPrt=$("#btnicofltTB").parents("div:first");
                            firstPrt.attr("id","btnicofltTBD");
                            firstPrt.height(firstPrt.height());
                            
                        if($("#mainTBX1 table:first").css("width")!=""){
                        $("#mainTBX1 table:first").width($("#mainTBX1 table:first").width());
                        $("#mainTBX1 thead th").each(function(){
                        
                            $(this).width($(this).width());
                            $(this).height($(this).height());
                        });
                        $("#mainTBX1 tfoot td").each(function(){
                        
                            $(this).width($(this).width());
                            $(this).height($(this).height());
                        });
                        
                        }
                    }
                     
                    $("#btnicofltTB").addClass("btnicofltTBTOP");   
                    $("#mainTBX1").append("<table class=\"floatTopHead list\" cellspacing=\"0\" border=\"0\"><thead class=\"rich-table-thead\">"+$("#mainTBX1 thead").html()+"</thead></table>")
                    //$("#mainTBX1").append("<table class=\"floatTopFoot list\" cellspacing=\"0\" border=\"0\"><tfoot class=\"rich-table-thead\">"+$("#mainTBX1 tfoot").html()+"</tfoot></table>")
                    $(".floatTopHead thead th .fltIC").each(function(){
                        var curId=$(this).attr("id");
                        if(curId.indexOf("-2")==-1){
                            $(this).attr("id",curId+"-2");
                        }
                    });
                    $(".floatTopHead").width($("#mainTBX1 table:first").width());
                    
                }
                if(EnableHorizontalScroll!=1 && zptabhsP!="1"){
                	$("#btnicofltTB").css({"left":(pos1.left-sl1)+"px"});
                }
                
                $(".floatTopHead").css({"left":(pos1.left-sl1)+"px","top":($("#btnicofltTBD").height()+(openDialogAsMod()?0:-10))+"px"});
                $("#scrollCntrls1").css({"top":(Math.round($(self).height()/2)-50)+"px"});
                
                $("#scrollCntrls1").show();
                

            }else{
                if($("#btnicofltTB").hasClass("btnicofltTBTOP")){
                    //closeFilterx();
                }
                $(".floatTopHead").remove();
                $("#btnicofltTB").removeClass("btnicofltTBTOP");
                
                //$("#scrollCntrls1").hide();
                
                
                
            }
}
function  noticeUnsaveWin(eventObject){
	totChanged=$("#mainTBX1 tbody tr.marked .lcbX").size();
    var res= (!disableNotice1 && !NOT_isEditOL && totChanged>0 ?"You have "+totChanged+" changed row"+(totChanged>1?"s":"")+"!\nIgnore the changes and continue?\n\n To save your changes please click the top Save Button.":null);
    return res;
}
function  noticeUnsave(){
	totChanged=$("#mainTBX1 tbody tr.marked .lcbX").size();
    var res= (NOT_isEditOL || totChanged==0 ||confirm("You have "+totChanged+" changed row"+(totChanged>1?"s":"")+"!\nIgnore the changes and continue?\n\n To save your changes please click the top Save Button."));
    return res;
}

function  noticeUnsaveCancelWork(){
	totChanged=$("#mainTBX1 tbody tr.marked .lcbX").size();
    var res= (NOT_isEditOL || totChanged==0 );
    if(!res){
        alert("You have "+totChanged+" changed row"+(totChanged>1?"s":"")+"!\nPlease save or cancel your work before using the filters.");
    }
    return res;
}
function isInIframe(){
    return  (!isSF1() && window.top!=null && window.top != self && parent.frames.length > 0);
}
function  isIframex1(id1,pgRows,hideConfirm){
    var isIfrm= (window.top!=null && window.top != self && parent.frames.length > 0);
    var res=isIfrm;
    if(isIfrm && (hideConfirm=="true" || confirm("Long lists are only available as a sperate page.\nDo you want to open this list in a new page?"))){
        var pg1=Urlx1.split(/\?/);
        window.open(pg1[0]+"?id="+id1+"&pgRows="+pgRows);       
    }
    return res;
}
var lastValTosearchTBX1="";
var lastValTosearchTBX1LJZ=null;
var lastValTosearchTBX1Cnt=0;
function searchTBX1(milisWait){
    lastValTosearchTBX1Cnt++;
    if(lastValTosearchTBX1LJZ!=null){
        window.clearTimeout(lastValTosearchTBX1LJZ);
    }
    if(milisWait==null){
        milisWait=(isSF1()?1500:1650);
    }
    lastValTosearchTBX1=$('.seatchInptFZP:first').val();
    lastValTosearchTBX1LJZ=window.setTimeout("if(lastValTosearchTBX1Cnt=="+lastValTosearchTBX1Cnt+" && lastValTosearchTBX1!=null && noticeUnsaveCancelWork()){loadingSH();searchTB(lastValTosearchTBX1);}",milisWait);
    //lastValTosearchTBX1LJZ=window.setTimeout("if(lastValTosearchTBX1Cnt=="+lastValTosearchTBX1Cnt+"){alert(lastValTosearchTBX1);}",milisWait);
}
function loadingSH(){
	
    $("#loadingx1").fadeTo(0,0.5);
    $("#loadingx1").width($("#mainTBX1").width());
    $("#loadingx1").height($("#mainTBX1").height());
    $("#loadingx1").show();
}
var lastFilterColJS=null;
var lastFilterCnt=0;

 function filterCol(event,extVal){
     var waitMilis=1;
        if ((event!=null && event.keyCode===13) || (extVal!=null && extVal==13)){
            waitMilis=1;
        }else if(extVal!=null && extVal>13){
            waitMilis=extVal;
        }else{
            waitMilis=(isSF1()?1500:1650);
        }
     if(lastFilterColJS!=null){
        window.clearTimeout(lastFilterColJS);
     }
     lastFilterCnt++;
     lastFilterColJS=window.setTimeout("if(lastFilterCnt=="+lastFilterCnt+" && lastFilterColJS!=null && noticeUnsaveCancelWork()){loadingSH();filterColsX();}",waitMilis);
    

 }
 var filterClicked=false;
 var lastOpenCFilterId=null;
 var lastOpenCFilterSearchBID=null;
function openCFilter(pobj,objId,fieldName,fieldCalss1,filterObjShowType,colName,objRefName,event){
	trackEventX('openCFilter');
	clearColPos();
    stopResizing=0;
    var curObj=$("#"+objId);
    if(!curObj.is(":visible")){
        $(".filterino").hide();
        var parent1=$(pobj).parents("th:first");
        //calc width and pos
        var position = parent1.position();
        var offset = parent1.offset();
        var scrollMode=isScrollMode();
        var sl1= getCUrrScollLeft(false);
        var sT1=$(self).scrollTop();
        var availVals=curObj.find(".availVals:first").width("");
        var fltTblOfw=curObj.find(".fltTblOfw:first").height("");
        //inner stuffScondClick
        var exptWidth2=(fltTblOfw.size()>0 && fltTblOfw[0].scrollWidth >fltTblOfw.width()?fltTblOfw[0].scrollWidth:availVals.width());
        var expWidth=Math.max(Math.max(parent1.width(),120),exptWidth2);
    
        var expLeft=0;
        if(isSF1()){
        	//expLeft=0;
        }else if(scrollMode){
            expLeft=Math.round(offset.left-sl1);
        }else{
            expLeft=Math.round(position.left);
        }
         //expLeft=Math.round((scrollMode?(Math.round(offset.left)-Math.round(sl1)):Math.round(position.left)));
        var bodyW=$("body").width()+(scrollMode?0:sl1);

        if( expLeft+expWidth>bodyW){
            expLeft=bodyW-expWidth-20;
        }
        if(isSF1()){
        	expLeft=5;
        }
        //alert(expLeft + " "+availVals.size() + " "+availVals.width());
        curObj.css({ top: ((scrollMode?offset.top-sT1+9+parent1.height():position.top+9+parent1.height())), left: (expLeft),position:(scrollMode?"fixed":"absolute")});
        //curObj.css({ top: ((scrollMode?offset.top-sT1+9+parent1.height():position.top-curObj.height()-9)), left: (scrollMode?offset.left-(sl1):position.left),position:(scrollMode?"fixed":"absolute")});
         
        curObj.find("input:first").width(expWidth);
    }
    curObj.toggle(); 

    if(curObj.is(":visible")){
        if(curObj.find(".availVals").width()>20){
            var availVals=curObj.find(".availVals");
            var fltTblOfw=curObj.find(".fltTblOfw");
            curObj.find("input:first").width(Math.max(parent1.width(),(fltTblOfw.size()>0 && fltTblOfw[0].scrollWidth >fltTblOfw.width()?fltTblOfw[0].scrollWidth:availVals.width())));
        }
        var firstinpt=curObj.find("input:first");
        if(firstinpt.is(":visible") ){
            isSearchFocus1=false;
            //firstinpt[0].focus();
            //firstinpt.val(firstinpt.val());//end of word
        }
        lastOpenCFilterId=$(pobj).attr("id");
        lastOpenCFilterSearchBID=objId;
        setTimeout(function(){loadDataFilter(fieldName,objId,fieldCalss1,filterObjShowType,colName,null,null,objRefName);},1);
        //fixIfmHegt();
    }else{
        lastOpenCFilterId=null;
        lastOpenCFilterSearchBID=null;
        //fixIfmHegt();
    }
    fixIfmHegt();
    stopProp1(event);
        //filterClicked=false;
    setTimeout("filterClicked=false;",50);
    return false;
}
function scrollTop1(){
     $("html, body").animate({ scrollTop: 0 }, "slow");
}
function scrollBottom1(){
     $("html, body").animate({ scrollTop: $(document).height() }, "slow");
}
function scrollTopObjRow1(str){
		var obj1=$(str);
	if(obj1.size()>0){
		var obj1Tr=obj1.parents("tr:first");
		if(obj1Tr.size()>0){
     		$("html, body").animate({ scrollTop: Math.max((obj1Tr.offset().top-300),0) }, "slow");
     		obj1Tr.addClass("markedRowTA");
			obj1Tr.removeClass("markedRowTA",6000,function(){});
     	}
     }
}
function openDialogAsMod(){
    var t1=true;
    try{
        t1=navigator.userAgent.indexOf("Chrome")==-1 && navigator.userAgent.indexOf("Safari")==-1;;
    }catch(e1){}
    return t1;
}
var isMobileRSModeCH1=null;
function isMobileRSMode(){
    var t1=true;
    try{
    	if(isMobileRSModeCH1==null){
        	t1=navigator.userAgent.indexOf("iPhone")>-1 || navigator.userAgent.indexOf("iPad")>-1;;
        	isMobileRSModeCH1=t1;
        }else{
        	t1=isMobileRSModeCH1;
        }
    }catch(e1){}
    return t1;
}
function stopProp1(event){
    if(event!=null &&event.preventDefault){
        event.returnValue = false;
        event.preventDefault();
        
    }
    if(event!=null && event.stopPropagation){
        event.stopPropagation();
        }
        
}
function pinGraph(gid,field1,autoPIn){
	var isBar="true"==$("#"+gid).attr("isBar");
	var topChartsFields="#"+$(".topChartsFields").val()+"#";
	if(topChartsFields.indexOf("#"+field1+"~"+isBar+"#")==-1){
		$(".topChartsFields").val(topChartsFields.substring(1)+field1+"~"+isBar);
	}
	
	$(".filterino:visible").hide();
	var dialog=$("#"+gid).parents("div.ui-dialog:first");
	$("#topGraphs").append(dialog);
	//dialog.css({"position":"relative","z-index":"1","top":"0px","left":"0px","display":"inline-block"});
	 fixPinnedGraph(gid);
	//dialog.find(".ui-dialog-titlebar").unbind( "click" ).unbind( "mouseover" );
	fixIfmHegt();
	if(autoPIn==null)showSaveAlert();
}


function autoPinGraph(){
	
	var topChartsFields=$(".topChartsFields").val();
	if(topChartsFields!=null && topChartsFields!=""){
		var topChartsFieldsArr=topChartsFields.split("#");
		//alert("autoPinGraph"+topChartsFieldsArr.length);
		if(topChartsFieldsArr!=null && topChartsFieldsArr.length>0){
			for(var i=0;i<topChartsFieldsArr.length;i++){
				var fldArr=topChartsFieldsArr[i].split("~");
				var fld1=fldArr[0];
				var isBar=(fldArr.length>1?fldArr[1]=="true":false);
				if(fld1!=null && fld1!=""){
					var cleanFld1=fld1.replace(/\./ig,"-");
					var obj1=$(".fltIC"+cleanFld1);
					if(obj1.size()==0 && fld1.indexOf(".name")>0){
						cleanFld1=cleanFld1.replace("__r-name","__c");
						cleanFld1=cleanFld1.replace("-name","id");
						obj1=$(".fltIC"+cleanFld1);
					}
					var grus=obj1.attr("grus");
					//alert(grus);
					if(grus!=null && grus!=""){
						//alert(isBar)
						if(isBar)grus=grus.replace(/false\,'/ig,"true,'");//set isBar
						//alert(grus);
						$.globalEval("try{"+grus+"}catch(e1){}");
					}
				}
			}
			
		}
	}
}


function closeGraph(gid,field1){
//alert(field1);
	var topChartsFields="#"+$(".topChartsFields").val()+"#";
	var field1C=field1;
	if(topChartsFields.indexOf("#"+field1C+"#")==-1 && field1C.indexOf(".name")>0){
		field1C=field1C.replace("__r.name","__c");
		field1C=field1C.replace(".name","id");
	}
	if(topChartsFields.indexOf("#"+field1C+"~")>-1 ||topChartsFields.indexOf("#"+field1C+"#")>-1){
		topChartsFields=topChartsFields.replace("#"+field1C+"~false#","#").replace("#"+field1C+"~true#","#").replace("#"+field1C+"#","#");
		topChartsFields=topChartsFields.replace(/[#]+/ig,"#");
		if(topChartsFields.indexOf("#")==0){
			topChartsFields=topChartsFields.substring(1);
		}
		$(".topChartsFields").val(topChartsFields);
	}
	
	$("#"+gid).remove();
	closeAllTooltips();
    fixIfmHegt();
}

function fixPinnedGraph(gwinId){
	if($("#"+gwinId).size()>0 && $("#"+gwinId).parents("#topGraphs").size()>0){
       		var dialog=$("#"+gwinId).parents("div.ui-dialog:first");
			dialog.css({"position":"relative","z-index":"1","top":"0px","left":"0px","display":"inline-block"}); 
			$("#"+gwinId).dialog({
			  draggable: false
			});
			//alert(1);
        }
}
var graphWasLoaded=0;
function createGarphsDataFilter(field1,filterIdSpan,fieldCalss1,filterObjShowType,amountFleild,amountFName,colName,filterCount1,hasGeo,resultData,fetchCount1,autoPIn,isBar,objRefName){
   var fieldMap1=new Array();
   var maxResRows=500;
   try{
    var orderTH=8;
   var resultsHTML="";
   var useExpField=false;
   var boolValFirst=-1;
   var gwinId=filterIdSpan+"GWin";
        var gwinIdIn=filterIdSpan+"GWinIn";
   if(filterObjShowType=='1' || filterObjShowType=='4' || filterObjShowType=='2'|| filterObjShowType=='6'|| filterObjShowType=='5'|| filterObjShowType=='7'){//text,bool,date,datetime,int,reference
        
        var isGeo1=("true"==hasGeo)&&(filterObjShowType=='1' ||filterObjShowType=='1f'  )&& (field1.indexOf("country")>-1);
        
        if(isBar==null){
        	isBar=null;
        }
        if(autoPIn==null){
        	autoPIn=null;
        }
       
        var funcStr="createGarphsDataFilter(\""+field1+"\",\""+filterIdSpan+"\",\""+fieldCalss1+"\",\""+filterObjShowType+"\",\""+amountFleild+"\",\""+amountFName+"\",\""+colName+"\",\""+filterCount1+"\",\""+hasGeo+"\",null,null,"+autoPIn+","+isBar+",\""+objRefName+"\")";
        var funcStrNoGeo="closeGraph(\""+gwinId+"\",\""+field1+"\");createGarphsDataFilter(\""+field1+"\",\""+filterIdSpan+"\",\""+fieldCalss1+"\",\""+filterObjShowType+"\",\""+amountFleild+"\",\""+amountFName+"\",\""+colName+"\",\""+filterCount1+"\",\"false\",null,null,"+autoPIn+","+isBar+",\""+objRefName+"\")";
        var funcStrBar="createGarphsDataFilter(\""+field1+"\",\""+filterIdSpan+"\",\""+fieldCalss1+"\",\""+filterObjShowType+"\",\""+amountFleild+"\",\""+amountFName+"\",\""+colName+"\",\""+filterCount1+"\",\"false\",null,null,"+autoPIn+","+true+",\""+objRefName+"\")";
        $("#topGraphs").width($("#topGraphs").width());
        var width1=(isGeo1?800:Math.min(650,650));//$("#topGraphs").width()/2-10
        var height1=(isGeo1?450:Math.min(305,Math.max(250,250)));//$(self).height()/2-30
		var showBar=isBar==null && filterObjShowType=="1";        
        if($("#"+gwinId).size()==0){
            var graphTitle=Graphs_title_field_per_col.replace("{0}",(amountFName==""?labelForObj:amountFName)).replace("{1}",colName);
            //<a href='javascript:void(0);' class='graphsRefresh btn' onclick='"+funcStr+"'><span class=''><span class='ui-icon ui-icon-refresh' title='"+Refresh_Chart+"'></span></span></a>
            $("body").append("<div id='"+gwinId+"' class='graphs' title='"+graphTitle+"' style='height:"+(height1)+"px;width:"+(width1)+"px;padding:0px;'><div id='"+gwinIdIn+"' class='graphsIn' style='height:"+(height1-55)+"px;width:"+(width1-10)+"px;'> <div class='ld1'></div></div></div>");
            
            $("#"+gwinId).dialog({width:width1,height:height1
                ,position: (autoPIn==null?{ my: "right bottom", at: "right bottom", of: "#mainTBX1" }:null)
            ,close:function(){
            	closeGraph(gwinId,field1);
            	}
            ,open:function(){ 
            	$("#"+gwinId).parents("div.ui-dialog:first").find(".ui-dialog-titlebar:first").append((isGeo1 ||showBar ?"<a href='javascript:void(0);' class='noGeoIcon ' onclick='"+(isGeo1?funcStrNoGeo:(showBar?funcStrBar:""))+"'>&nbsp;</a>":"")+"<a href='javascript:void(0);' class='graphsRefresh ui-corner-all' onclick='"+funcStr+"' role='button' onmouseover='$(this).addClass(\"ui-state-hover\");' onmouseout='$(this).removeClass(\"ui-state-hover\");'><span class='ui-icon ui-icon-refresh' title='"+Refresh_Chart+"'></span></a>").append("<a href='javascript:void(0);' class='graphsPin ui-corner-all' onclick='pinGraph(\""+gwinId+"\",\""+field1+"\");' role='button' onmouseover='$(this).addClass(\"ui-state-hover\");' onmouseout='$(this).removeClass(\"ui-state-hover\");'><span class='ui-icon ui-icon-pin-w' title='"+Pin_Chart+"'></span></a>")
            	
            	if(autoPIn!=null){
            		pinGraph(gwinId,field1,autoPIn);
            	}
            	fixIfmHegt();
            	},draggable:(autoPIn==null)
            	
            }
            );
            //fixIfmHegt();
        }else{
            $("#"+gwinId+ " #"+gwinIdIn).html("<div class='ld1'></div>");
            $("#"+gwinId).dialog({width:width1,height:height1,close:function(){
            	closeGraph(gwinId,field1);
            	
            	},open:fixIfmHegt,draggable:(autoPIn==null)});
            	fixPinnedGraph(gwinId);
            //$("#"+gwinId).dialog("destroy");
        }
            $("#"+gwinId).dialog("moveToTop");
			$("#"+gwinId).attr("isBar",isBar);
			if(isBar){
				var topChartsFields="#"+$(".topChartsFields").val().replace("#"+field1+"~false#","#"+field1+"~true");
				if(topChartsFields.indexOf("#")==0){
					topChartsFields=topChartsFields.substring(1);
				}
				$(".topChartsFields").val(topChartsFields);
			}
        //loadingSH();
        var fieldSoql=field1;
        if(filterObjShowType=='7' && field1!='id' ){
            if(field1.indexOf("id")==field1.length-2){
                field1=field1.substring(0,field1.length-2)+"."+objRefName;
            }
            if(field1.indexOf("__c",Math.max(0,field1.length-4))==field1.length-3){
                field1=field1.substring(0,field1.length-1)+"r."+objRefName;//'zaapit__'+
            }
            fieldSoql=field1;
        }else if(filterObjShowType=='6'){
            fieldSoql="DAY_ONLY("+field1+")";
            useExpField=true;
        }
        var query1="";
        if(amountFleild!=null && amountFleild!=""){
            query1="SELECT "+fieldSoql+" f1,count(id) c1,sum("+amountFleild+") s1 "+DBsubQery+" group by "+fieldSoql+" order by "+(filterObjShowType!='5'?" sum("+amountFleild+")desc, "+fieldSoql+" asc ":" "+fieldSoql+" asc, sum("+amountFleild+")desc " )+" limit "+maxResRows+DB_END_ALLROWS_Qery;
        }else{
            query1="SELECT "+fieldSoql+" f1,count(id) c1 "+DBsubQery+" group by "+fieldSoql+" order by "+(filterObjShowType!='5'?" count(id) desc,"+fieldSoql+" asc ":" "+fieldSoql+" asc, count(id) desc ")+" limit "+maxResRows+DB_END_ALLROWS_Qery;
        }
         //alert(query1);
    
    if(resultData==null && fetchCount1==null){
    Visualforce.remoting.Manager.invokeAction(
                remoteQueryAjax2,
                query1, 
                function(result, event){
                    if (event.status && result!=null) {
    
                        createGarphsDataFilter(field1,filterIdSpan,fieldCalss1,filterObjShowType,amountFleild,amountFName,colName,filterCount1,hasGeo,result,"1",autoPIn,isBar,objRefName);
                    
                     } else if (event.type === 'exception') {
                        if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){
                            self.location=self.location;
                        }else if(event.message!=null && (event.message+"").indexOf("Unable to connect")==-1){
                            if($("body:visible").size()>0)alert("An error has occurred: "+event.message);
                        }
                    } else {
                        //self.location=self.location;
                        // $("#"+filterIdSpan+" .availVals").html("");
                        //alert(1);
                    }
                }, 
                {escape: true,buffer:true,timeout: 90000}
            );
            return;
            }

        var queryMore = true;
        var hasRows = false;
        var count1=0;
        var showButtons=false;
         var data = new google.visualization.DataTable();
             

            var records = resultData;
            if(records!=null && records.length>0){
                   
                for (var key in records[0]) {
                    //alert(key+" "+records[0][key]+" "+(typeof  records[0][key]));
                    fieldMap1[key.toLowerCase()]=key;
                    if(records[0][key]!=null && (typeof records[0][key]) == "object"){
                    
                        for (var key1 in records[0][key]) {
                            fieldMap1[key1.toLowerCase()]=key1;
                        }
                    }  
                }
                
            }else{
            	$("#"+gwinIdIn+"").html("<div style='margin:"+((height1/2)-30)+"px 0px 0px "+((width1/2)-69)+"px;color:#999999;'>"+No_Chart_Data+"</div>");
            }
            var type1="string";
            if(filterObjShowType=='5'){//int
                if(filterCount1<=orderTH){
                    type1="string";//
                }else{
                    type1="number";
                }
            }else if(filterObjShowType=='2' || filterObjShowType=='6'){//date
                type1="date";
            }
           // else if(isGeo1){
           //    type1="country";
           // }
            
            data.addColumn({type:type1, label:colName});
            data.addColumn({type:"number", id:'Total',label:(amountFName==null || amountFName==""?Total_text:amountFName)});
             
            //data.addColumn({type:'string',role:'tooltip'});
            //data.addColumn('string', null);   
            
            //alert(records[0]);
            var expfieldsStart=(!useExpField?0:1);
            var expfieldsStart2=expfieldsStart+1;
            var countFname="c1";//'expr'+expfieldsStart;
            var sumFname="s1";//'expr'+expfieldsStart2;
            var fieldDotIdx=field1.indexOf(".");
            var field1Xnd=(fieldDotIdx>-1?field1.substring(fieldDotIdx+1):field1);
            var mainFieldName="f1";//(useExpField?"expr0":fieldMap1[field1Xnd]);
            data.addRows(records.length);
            
            for (var i = 0; i < records.length; i++) {
                hasRows=true;
                var val1=records[i][mainFieldName];
                 var val1Vis=val1;
                if(val1==null || val1==""){
                    val1Vis=Blanks_txt;
                } else if(val1.indexOf("&")>-1){
                    
                    val1=val1.replace("amp;","").replace("amp;","");
                    
                     val1Vis=val1;
                }
                
               
                
                var val1Count=records[i][countFname];
                var val2sum=records[i][sumFname];
                var objN="";
                if(filterObjShowType=='5'){//int
                    if(filterCount1<=orderTH){
                        data.setValue(i,0,val1+" ("+val1Count+")");
                    }else{
                        data.setValue(i,0,Number(val1));
                    }
                }else if(filterObjShowType=='2' || filterObjShowType=='6'){//date
                    if(val1!=null && val1!=""){
                        var darr=val1.split(/\-/);
                        data.setValue(i,0,new Date(darr[0],(Number(darr[1])-1),darr[2]));
                    }else{
                        data.setValue(i,0,null);
                    }
                }else if(filterObjShowType=='4'){//booleans
                    var valBoo=(val1+"")=="true";
                    val1Vis=(valBoo?"Yes":"No");
                    if(boolValFirst==-1){
                        boolValFirst=(valBoo?1:0);
                    }
                    data.setValue(i,0,val1Vis +" ("+val1Count+")");
                }else{
                    if(!isGeo1  &&  (amountFleild!=null && amountFleild!="")){
                        data.setValue(i,0,val1Vis +" ("+val1Count+")");
                    }else{
                        data.setValue(i,0,val1Vis);
                    }
                }
                if(val2sum!=null){
                    data.setValue(i,1,Number(val2sum==null || val2sum=="" ?0:val2sum));
                    //data.setValue(i,2,val1+": $"+val2sum+" ("+val1Count+")");
                }else{
                    data.setValue(i,1,Number(val1Count==null || val1Count=="" ?0:val1Count));
                    //data.setValue(i,2,val1+": "+val1Count+"");
                }
                //data.setValue(i,3,field1+"="+val1);

            count1++;
            }
           
   
        //alert(data+ "\n\n "+amountFleild);
        if(hasRows){
         //var data = google.visualization.arrayToDataTable(dataPreG);

        
         
        if(amountFleild!=null && amountFleild!=""){
            var symbol= orgDefCurrency;
            symbol=symbol.substring(0,1);
             var formatter = new google.visualization.NumberFormat(
                {prefix: symbol});
            formatter.format(data, 1); // Apply formatter to second column 
            // var formatter = new google.visualization.PatternFormat('{0}: {1}');
            // formatter.format(data, [0,1], 0); 
        }
        
       
            
            var options = null;//
          var chart=null;
         if(filterObjShowType=='5'){//int
          
              
            if(filterCount1<=orderTH){
                    options={chartArea:{top:0,height:"90%"}
                    ,colors:['blue','#CC0000','orange','#00CC00','#800080','#FFAA00','#00FFFF','#FF00AA','green','#AA00AA','#00AAAA','#AAAA00','#999900','#555500','lime']
                    // title: 'My Daily Activities'
                    };
                chart = new google.visualization.ColumnChart(document.getElementById(gwinIdIn));
            }else{
                options={chartArea:{top:0,height:"95%"}
                ,colors:['blue','#CC0000','orange','#00CC00','#800080','#FFAA00','#00FFFF','#FF00AA','green','#AA00AA','#00AAAA','#AAAA00','#999900','#555500','lime']
                // title: 'My Daily Activities'
                };
                chart = new google.visualization.LineChart(document.getElementById(gwinIdIn));
            }
          }else if(filterObjShowType=='2' || filterObjShowType=='6'){//date
          
               options={chartArea:{top:5,height:"95%"}
            ,colors:['blue','#CC0000','orange','#00CC00','#800080','#FFAA00','#00FFFF','#FF00AA','green','#AA00AA','#00AAAA','#AAAA00','#999900','#555500','lime']
            // title: 'My Daily Activities'
            };
            
            chart = new google.visualization.AnnotationChart(document.getElementById(gwinIdIn));

             var rangechange= function () {
                var topping="";
                try{
                var selTot=chart.getVisibleChartRange();
                var start=selTot.start;
                var startStr=start.getFullYear()+"-"+(start.getMonth()+1<10?"0":"")+""+(start.getMonth()+1)+"-"+(start.getDate()<10?"0":"")+""+start.getDate();
                var end=selTot.end;
                var endStr=end.getFullYear()+"-"+(end.getMonth()+1<10?"0":"")+""+(end.getMonth()+1)+"-"+(end.getDate()<10?"0":"")+""+end.getDate();
                //alert(startStr + " " +endStr+ " ");
                $('#'+filterIdSpan+' .'+fieldCalss1+"1").val(startStr);
                $('#'+filterIdSpan+' .'+fieldCalss1+"2").val(endStr).change();
                //filterCol(null,100);//13
                }catch(e){}
                //$('#'+filterIdSpan+' .'+fieldCalss1).val(topping).focusin().keyup();
                };
                google.visualization.events.addListener(chart, 'rangechange', rangechange); 
            
          }else if(filterObjShowType=='4'){//booleans
              options={chartArea:{left:0,top:10,width:"100%",height:"95%"},tooltip:{isHtml:(isIe8!="true")}
                ,colors:[(boolValFirst==1?'#00AA00':'#CC0000'),(boolValFirst!=1?'#00AA00':'#CC0000'),'orange','#00CC00','#800080','#FFAA00','#00FFFF','#FF00AA','green','#AA00AA','#00AAAA','#AAAA00','#999900','#555500','lime']
                // title: 'My Daily Activities'
                };
                var formatter = new google.visualization.PatternFormat(colName+": {0}  "+(amountFName==null || amountFName==""?Total_text:amountFName)+': {1}');
             formatter.format(data, [0,1], 1); 
                chart = new google.visualization.PieChart(document.getElementById(gwinIdIn));
          }else if(isGeo1){
                
                options={chartArea:{left:0,top:5,width:"100%",height:"95%"},displayMode:"regions"
                    //,colors:['blue','#CC0000','orange','#00CC00','#800080','#FFAA00','#00FFFF','#FF00AA','green','#AA00AA','#00AAAA','#AAAA00','#999900','#555500','lime']
                    // title: 'My Daily Activities'
                    };
                 chart = new google.visualization.GeoChart(document.getElementById(gwinIdIn));
                 
           //bar chart      
         /* }else if(field1.indexOf("status")>-1 || field1.indexOf("type")>-1|| field1.indexOf("stage")>-1){
          
           options={ hAxis: {title: colName}
                ,colors:["#0000FF"]
                // title: 'My Daily Activities'
                };
                
                chart = new google.visualization.ColumnChart(document.getElementById(gwinIdIn));
          */      
          }else{
          if(isBar==null || !isBar){
              	options={chartArea:{left:0,top:10,width:"100%",height:"95%"},tooltip:{isHtml:(isIe8!="true")}
            	,colors:['blue','#CC0000','orange','#00CC00','#800080','#FFAA00','#00FFFF','#FF00AA','green','#AA00AA','#00AAAA','#AAAA00','#999900','#555500','lime']
            	// title: 'My Daily Activities'
            	//,pieHole: 0.4
            	};
             	var formatter = new google.visualization.PatternFormat(colName+": {0}  "+(amountFName==null || amountFName==""?Total_text:amountFName)+': {1}');
             	formatter.format(data, [0,1], 1); 
            	chart = new google.visualization.PieChart(document.getElementById(gwinIdIn));
            }else{
            	
            	options={legend: { position: "none" }
            	// title: 'My Daily Activities'
            	//,pieHole: 0.4
            	};
             	//var formatter = new google.visualization.PatternFormat("{0}: {1}");
             	//formatter.format(data, [0,1], 1); 
            	chart = new google.visualization.BarChart(document.getElementById(gwinIdIn));
            }
          }
          
          
           var selectHandler= function () {
            var topping="";
            try{
            var selTot=chart.getSelection();
            //alert(selTot);
            var selectedItem = selTot[0];
            if (selectedItem) {
                topping = data.getValue(selectedItem.row, 0);
                //alert('The user selected ' + topping);
                topping=new String(topping==null?"":topping);
                if(topping!=null && topping.indexOf(" (")>-1){
                    topping=topping.split(/ \(/)[0];
                }
                if(topping.indexOf(",")>-1 || topping.indexOf("'")>-1 ||topping.indexOf("\"")>-1 ||topping.indexOf("\\")>-1){
                    topping=topping.replace(/\,|'|"|\\/ig,"_");
                }
                topping=topping.replace("&quot;","_");
                topping=topping.replace("&#39;","_");
                topping=topping.replace("\\","_");

                if(topping==Blanks_txt){
                    topping=" ,";//blanko filter
                }else{
                    topping=topping+",";
                }
                 //alert('The user selected ' + topping);
            }
            }catch(e){}
            $('#'+filterIdSpan+' .'+fieldCalss1).val(topping).focusin().keyup().focusout();
            filterCol(null,50);
            };
            google.visualization.events.addListener(chart, 'select', selectHandler); 

          chart.draw(data, options);
        }
        }
    }catch(e1){
        
            if(e1!=null && (e1+"").indexOf("INVALID_FIELD")>-1){
                alert("One of the below marked fields have access right issues: \n\n"+e1);
            }else if(e1!=null && (e1+"").indexOf("INVALID_SESSION_ID")>-1){
                self.location=self.location;
            }else if(e1!=null && (e1+"").indexOf("Unable to connect")==-1){
                alert("An error has occur: "+e1);
            }
        }
  }
  
        
function togglesGraphs1(){
//  $("#graphsRusx").html("Hello").show("slide", { direction: "left" }, 3000);
}
function togglesMaps1(){
    //$("#mapRusx").html("Hello").show("slide", { direction: "left" }, 3000);
}

  var lastTextareaObj=null;
  function fixDilalogIframeHeight(){
  	var isIfrm= (top != self && parent.frames.length > 0);
       var maxHieghtIframe=750;
       if($(window).height()<maxHieghtIframe || $("html,body").height()<maxHieghtIframe){
           if(!isIfrm){
                maxHieghtIframe=$(window).height();
                //alert(maxHieghtIframe);
           }else if(isIfrm ){
                lastBodyHeight=$("html,body").height();
                //alert(lastBodyHeight);
                //$("html,body").height(maxHieghtIframe);
                $("#padBut1").height(Math.max($("#padBut1").height(),maxHieghtIframe-$(self).height()));
                fixIfmHegt();
           } 
       }
  }
  function enhanceFuncInp(obj,clsForName){
  
 	 
	
    if(obj!=null && Open_TextArea_in_a_dialog__c && $(obj).prop("tagName")!=null && $(obj).prop("tagName").toUpperCase()=="TEXTAREA"){
    fixDilalogIframeHeight();
    var formatterInt = new google.visualization.NumberFormat({
            pattern: '#,###,###.##'
        });
        lastTextareaObj=obj;
        $("#textAreaEditDialog1TA").val($(obj).val());
        $("#textAreaEditDialog1TA").attr("maxlength",$(obj).attr("maxlength"));
        if($(obj).attr("maxlength")!=null){
            $("#maxLen1").html(" / "+formatterInt.formatValue($(obj).attr("maxlength")));
            $("#currLen1").html($(obj).val().length);
            
        }else{
            $("#maxLen1").html("");
            $("#currLen1").html($(obj).val().length);
        }
        $(obj).parents("tr.dataRow:first").addClass("markedRowTA");
        
        $("#textAreaEditDialog1").dialog({
            resizable: true,
            height:500,
            width:(isSF1()?($(self).width()-20):500),
            modal: openDialogAsMod(),
            title: $("."+clsForName+":first").text(),
            buttons: [{
            text:OK_buttons,
            click: function() {
                $(obj).val($("#textAreaEditDialog1TA").val()).change();
                $( this ).dialog( "close" );
            }},{text:Cancel_button,
            click: function() {
                $( this ).dialog( "close" );
            }}]
            ,
             close: function( event, ui ) {
             	$(obj).parents("tr.dataRow:first").removeClass("markedRowTA",1000,function(){});
             	if(lastBodyHeight!=null){
                      $("#padBut1").height(0);
                      fixIfmHegt();
               }
             }
            });
        
        
    }
}

function refreshAfterSave(){
    loadingSH();
    var loc1=(self.location+"");
    var prefix="/apex/";
    if(loc1.indexOf("/servlet/")>-1){
        //prefix="/apex/"
    }else if(loc1.indexOf("/apex/")>-1){
        prefix="../apex/";
    }else if(!isSF1()){
        prefix="apex/";
    }
    //refersh();
    if(loc1.indexOf("zaapit__")>-1){
        prefix=prefix+"zaapit__";
    }

  	if(!isSF1()){
    	navigateZP(prefix+UrlEnd1+"?"+(mainID==""?"zba=1":"id="+encodeURIComponent(mainID))+(isInIframe()?"&inline=1":"")+sfdcTabNameParam+"&pw1="+escape(parentLocParam1)+"&tp="+tp_conf+"&tx111="+(new Date().getTime())+(loc1.indexOf("&isdtp=vw")>-1?"&isdtp=vw":"")+(loc1.indexOf("&isdtp=p1")>-1?"&isdtp=p1":""),self,null,1);
    }else{
    	self.location=self.location;
    }
}

function showMoreCurs(obj){
	var titd1=$(obj).attr("titd1");
	var curValDC=$(obj).attr("curValDC");
	if(titd1==null && currencyCodeSTR!=null && currencyCodeSTR!="" && curValDC!=null && curValDC!="" && $(obj).parents("td:first").hasClass("cur")){
		$(obj).attr("titd1","1");
		var allCursHTML="";
		var currencyCodeSTRArr=currencyCodeSTR.split("#");
		for(var i=0;i<currencyCodeSTRArr.length;i++){
			var curRow=currencyCodeSTRArr[i].split("~");
			if(curRow.length==4 && (i==0 || curRow[2]==currencyDefISO || currencyCodeNum==2)){
			var symbol=curRow[2];
			var decimalplaces=curRow[3];
			var decimalplacesSTR="";
			for(var j=0;j<Number(decimalplaces);j++){
				decimalplacesSTR+="#";
			}
			var formatterCurr = new google.visualization.NumberFormat({pattern: ' #,###,###'+(decimalplacesSTR!=""?"."+decimalplacesSTR:"")});
				allCursHTML+="<tr><td>"+symbol+"</td><td align='right'>"+formatterCurr.formatValue(Number(curValDC)*Number(curRow[0]))+"</td></tr>";
			}
		}
		if(allCursHTML!=null && allCursHTML!=""){
			//$(obj).attr("title","<table>"+allCursHTML+"</table>");
			$(obj).tooltip({content:("<table>"+allCursHTML+"</table>")}).tooltip( "open" );
		}
		
		//alert(allCursHTML);
	}else{
		fixTitlex1(obj);
	}
}

function getAllCurs(curValDC){
	var allCursHTML="";
	if(currencyCodeSTR!=null && currencyCodeSTR!="" && curValDC!=null && curValDC!=""){
		var currencyCodeSTRArr=currencyCodeSTR.split("#");
		var addCurs=0;
		for(var i=0;i<currencyCodeSTRArr.length && addCurs<2;i++){
			var curRow=currencyCodeSTRArr[i].split("~");
			if(curRow.length==4 && (i==0 || curRow[2]==currencyDefISO || currencyCodeNum==2)){
			
				var symbol=curRow[2];
				var decimalplaces=curRow[3];
				var decimalplacesSTR="";
				for(var j=0;j<Number(decimalplaces);j++){
					decimalplacesSTR+="#";
				}
				var formatterCurr = new google.visualization.NumberFormat({prefix:symbol,pattern: ' #,###,###'+(decimalplacesSTR!=""?"."+decimalplacesSTR:"")});
				allCursHTML+=(addCurs==1?"(":"")+"<span>"+formatterCurr.formatValue(Number(curValDC)*Number(curRow[0]))+"</span>"+(addCurs==1?")":" ");
				addCurs++;
			}
		}
	}
	//alert(allCursHTML);
	return allCursHTML;
}
var totRowsForFOUNDONQ=0;
//1.000000~true~USD~2#4.515000~false~ARS~2#1.077935~false~AUD~2#2.077000~false~BRL~2#1.047000~false~CAD~2#0.943000~false~CHF~2#505.945000~false~CLP~0#6.147000~false~CNY~2#1792.757000~false~COP~0#497.958000~false~CRC~0#19.901000~false~CZK~2#5.732500~false~DKK~2#0.768521~false~EUR~2#0.653040~false~GBP~2#7.759300~false~HKD~2#227.588250~false~HUF~0#9920.635000~false~IDR~0#3.638100~false~ILS~2#97.740000~false~JPY~0#1155.350000~false~KRW~0#7.991300~false~MOP~2#13.163500~false~MXN~2#6.109000~false~NOK~2#1.283532~false~NZD~2#2.667500~false~PEN~2#3.338300~false~PLN~2#32.945000~false~RUB~2#3.750400~false~SAR~2#6.753400~false~SEK~2#1.274400~false~SGD~2#1.934900~false~TRY~2#30.126000~false~TWD~2#10.101600~false~ZAR~2#";
var currencyCodeSTR="";
var currencyCodeNum=0;
var isLastPage=true;
 function getTotals1(){
    
       var symbol= orgDefCurrency;
       symbol=symbol.substring(0,1);
       var formatterCurr = new google.visualization.NumberFormat({prefix: symbol
        });
        var formatterInt = new google.visualization.NumberFormat({
            pattern: '#,###,###.##'
        });

  
     Visualforce.remoting.Manager.invokeAction(
            remoteTotMethod,
            queryCOunt1, 
            function(result, event){
                if (event.status && result!=null) {
                     if(NOT_hideTotalsRow){    
                        var key;
                        for (key in result) {//fetch all avil currencies
                        	if(key.indexOf('currencyCodeSTR#')>-1 && Number(result['currencyCodeNum'])>0){
                            		currencyCodeNum=Number(result['currencyCodeNum']);
	                        		//key="currencyCodeSTR#0.768521~false~EUR~2#";
	                        		//currencyCodeNum=1;
									currencyCodeSTR=key.split("CodeSTR#")[1];	
									//alert(currencyCodeSTR);                        		
	                        	}
                        }
                        for (key in result) {
                        	if(key.indexOf('currencyCode')==-1){
	                            var spanTOT=$(".TOT-"+key);
	                            var ost1X=spanTOT.find(".ost1X");
	                            if(spanTOT.size()>0){
	                            //alert(key+" "+spanTOT.hasClass("cur")+ " "+symbol);
	                              if(spanTOT.hasClass("cur") ){
	                              		ost1X.attr("curValDC",result[key]);
	                              		//alert(currencyCodeNum);
	                              		if(currencyCodeNum==0){
	                                    	ost1X.html(formatterCurr.formatValue(result[key]));
	                                    }else{
	                                    	ost1X.html(getAllCurs(result[key]));
	                                    }
	                                }else{
	                                    ost1X.html(formatterInt.formatValue(result[key]));
	                                }
	                            }
                            }else{
                            	
                            }
                        }
                    }
                    var totRows=Number(result['countRowsx1']);
                    totalCountAjx=totRows;
                    var totRowsFor=formatterInt.formatValue(totRows);
                    var foundTxt=Found_x_results.replace("{0}",totRowsFor);
                    $(".foundX").html(foundTxt);
					totRowsForFOUNDONQ=totRowsFor;
                    var Page_x_of_y=Page_x_of_y_ORIG;
                    var foundPages=Math.round(totRows/maxRowsPerPageCls+0.499);
                    var maxPageOfset=6000/maxRowsPerPageCls;
                    maxPageOfsetGlb=maxPageOfset;
                    if(foundPages==0){
                        foundPages=1;
                    }
                    var currPage=currPageCls;
                    Page_x_of_y=Page_x_of_y.replace("{0}",(currPage+1)).replace("{1}",formatterInt.formatValue(foundPages));
                    Page_x_of_y=Page_x_of_y.replace("{3}",(showEntries!=""?" <span style='color:#696969;margin-left:5px;'>["+showEntries+" "+of_entries+" "+totRows+"]</span>":""));
                    $("#Page_x_of_y").html(Page_x_of_y);
                    var tCurPgScrl=(currPage+1)+" / "+formatterInt.formatValue(foundPages);
                    $(".curPgScrl").html(tCurPgScrl);
                    $(".curPgScrlW").attr("title",tCurPgScrl);
                    isLastPage=((currPage+1)==foundPages);
                    //alert(result['countRowsx1']);
                    var numPageLinks="";
                     for(var i=Math.max(0,currPage-5);i<Math.min(foundPages,Math.max(0,currPage-5)+10);i++){
                        numPageLinks+="<a href='javascript:void(0);' onclick='jumpToClk("+i+","+maxPageOfset+");' "+(i>maxPageOfset?"style='color:#aaaaaa;'":"")+" class='"+(currPage==i?"m":"n")+"'>"+(i+1)+"</a>";
                     }

                    $("#numPageLinks").html(numPageLinks);
                    $("#srachPan2NP").show();
                    //$(".grisLastPagex1:last").html((isLastPage!=null?"+":""));
                } else if (event.type === 'exception') {
                	 if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){
                            self.location=self.location;
                     }else if(event.message!=null && (event.message+"").indexOf("Unable to conn")==-1){
                		if($("body:visible").size()>0)alert("An error has occurred: "+event.message);
                	}
                    //self.location=self.location;
                    $("#srachPan2NP").show();
                } else {
                    //self.location=self.location;
                    $("#srachPan2NP").show();
                }
                
                
                var activefilters="";
                var activefiltersTit="";
                $("input.filterinoIPT").each(function(){
                	var inpX=$(this).parents("span[inpX]:first").attr("inpX");
                	var fname=$("."+inpX).text();
                	var fval=$(this).val();
                	//alert(fname+" "+fval);
                	if($.trim(fval)!=""){
                		var mid=$(this).parents("span.filterino:first").attr("id");
                		if(fval.indexOf(" ,")==0){
                		    fval=Blanks_txt+fval.substring(1);
                		}else if(fval.match(/^R[0-9]+\,.*/)){
                			fval=fval.substring(1);
                			fval=fval.replace(/\,/ig," - ");
                		
                		}
						if(fval.lastIndexOf(",")==fval.length-1){
                			fval=fval.substring(0,fval.length-1);
                		}
                		if($(this).hasClass("filtDatex1Mnx")){
                			fval=fval.replace("~"," - ");
                		}
                		fval=fval.replace(/\,/ig,", ");
                		activefiltersTit=activefiltersTit+"<b>"+fname+":</b> "+fval+"  <a class='clearFlt2' href='javascript:void(0);' onclick='$(\"#"+mid+" .clearFlt\").click();'>"+label_clear+"</a><br/>";
                		activefilters=activefilters+"<b>"+fname+":</b> "+fval+"<br/>";
                	}
                });
                $('input.seatchInptFZP').each(function(){
                		var fname=Search_label;
                	    var fval=$(this).val();
                	    if($.trim(fval)!=""){
                		  activefiltersTit=activefiltersTit+"<b>"+fname+":</b> "+fval+"  <a class='clearFlt2' href='javascript:void(0);' onclick='$(\".seatchInptFZPW2 .filterinoIPTCS1\").click();'>"+label_clear+"</a><br/>";
                		  activefilters=activefilters+"<b>"+fname+"</b> "+fval+"<br/>";
                		}
                });
                
                if(activefilters.length>0){
                	//activefilters=activefilters.substring(1);
                	$(".activefilters").html(activefilters);
                	$(".activefilters").attr("title",activefiltersTit);
                	$(".activefiltersW").show();
                }else{
                	$(".activefiltersW").hide();
                }
                
                
                $("body").trigger("OnGetTotalDone");
            }, 
            {escape: true,buffer:true,timeout: 90000}
        );
   }
   
   function paretnAk1(){
        openPOInst=false;
        $('#postinstMsg').hide();
   }
   
    function showMsgConf(){
        var unVisH=$("body").height()-$(self).height();
        //alert(unVisH);
        if(unVisH>0 && openPOInst){
            $('#postinstMsg').show();
        }else{
            paretnAk1();
        }
   }
   
      function clearPx(str){
        if(str!=null && str.indexOf("px")>-1){
            str=str.substring(0,str.length-2);
        }
        return str;
   }
   function selAllFlt(obj){
        var checked=$(obj).prop("checked");
        if(checked==null){
            checked="";
        }
        $(obj).parents(".fltTblOfw:first").find("input[type='checkbox']").prop("checked",checked);
   }
   function selOneFlt(obj){
   		if($(obj).attr('id').indexOf('__xx')>-1 && $(obj).parents(".fltTblOfw:first").find(".xfilt1:first").prop("checked") && $(obj).parents(".fltTblOfw:first").find(".xfilt1:checked").size()>1){
   			alert(Blanks_none_black);
   		}
        $(obj).parents(".fltTblOfw:first").find(".xfilt1All").prop("checked",($(obj).parents(".fltTblOfw:first").find(".xfilt1").size()==$(obj).parents(".fltTblOfw:first").find(".xfilt1:checked").size()));
   }
   function selectFilterExCBOX(filterIdSpan,fieldCalss1){
        var selectedVals="";
        var allCBOX=$("#"+filterIdSpan+" .availVals .fltTblOfw .xfilt1All");
        if(allCBOX.size()>0){
            if(allCBOX.prop("checked")){
                selectedVals="";
            }else{
                $("#"+filterIdSpan+" .availVals .fltTblOfw input.xfilt1[type='checkbox']:checked").each(function(){
                    var curV1=$(this).val();
                    if(curV1.indexOf(",")>-1){
                        curV1=curV1.replace(/\,/ig,"_");
                    }
                    selectedVals+=curV1+",";
                });
            }
        }
        
        if(selectedVals==""){
            var hasNoneEmpty=false;
            $("#"+filterIdSpan+" .filterObjShow1").find("select,input[type!='radio']").each(function(){
                hasNoneEmpty=hasNoneEmpty||$.trim($(this).val())!="";
                selectedVals+=","+($.trim($(this).val())==""?" ":$.trim($(this).val()));
            }); 
            var isBlanksRadioMarked=$("#"+filterIdSpan+" .filterObjShow1 .b1.rangeX1Rad input[type='radio']:checked").size()>0;
            var isSearchRadioMarked=$("#"+filterIdSpan+" .filterObjShow1 .s1.rangeX1Rad input[type='radio']:checked").size()>0;
            if(!isBlanksRadioMarked &&hasNoneEmpty && selectedVals!=""){
                selectedVals="R"+selectedVals.substring(1);
            }else if(isBlanksRadioMarked){
            	selectedVals="-";
            }else{
                selectedVals="";
            }
        }else{
            $("#"+filterIdSpan+" .filterObjShow1 .inptFilter").val("");//clear range
        }
        
        if(selectedVals==""){
            selectedVals=$("."+fieldCalss1).val();
            if(selectedVals.indexOf("R")==0 && $("#"+filterIdSpan+" .filterObjShow1 input").size()>0){
                selectedVals="";
            }
        } 
        closeFilterx();
        //$("#"+filterIdSpan+" .availVals ").html("<div class='ld1'></div>");
        $("#"+filterIdSpan+" .searchTxt").hide();
        $("."+fieldCalss1).val(selectedVals);//filterinoIPT
        filterCol(null,13);//run filter now
   }
   var tempLayoutEditorResize=0;
   function fixIfmHegt(){
try{

    if(window.self != window.top){
    	
	          var currLOc=(self.location+'');
	          
	        var postURl1='https://'+currLOc.split('.')[1]+'.salesforce.com';
	
			try{
		          	var cU1=(top.location+'');
		          	if(cU1.indexOf('http')>-1){
		          		postURl1=cU1.substring(0,cU1.indexOf('/',10));
		          	}
		          }catch(e1){
		          //alert(e1); 
		          }
	        if(hasSFDCURL){
	            postURl1=Salesforce_Full_URL;
	        }
	        if(parentLocParam1!=null && parentLocParam1!="" && parentLocParam1!="null"){
	        	var t1=parentLocParam1;
	        	if(t1.indexOf('/')>-1){
	        		t1=t1.substring(0,t1.indexOf('/',10));
	        	}
	        	postURl1=t1;
	        }
	    //$(document).height()+"";
	    var maxDialogHeight=$("body").height()+10;
		$("div.ui-dialog:visible").each(function(){
			var h1=$(this).height()+20; 
			if(h1 > maxDialogHeight){
				maxDialogHeight=h1;
			}
		});
	    var maxHeight=maxDialogHeight;//$("body").height();
	    $(".srachPan2NP,.filterino:visible,.ui-tooltip:visible,.qtip-brd-gry:visible").each(function(){
	        var pos1=$(this).position();
	        var curH=pos1.top+$(this).height()+20;
	        if(curH > maxHeight){
	            maxHeight=curH;
	        }
	    });
	    maxHeight=maxHeight+1;
	    //alert(maxHeight+" "+stopResizing);
		if(turnOnscrolModeForTabsRL==0 ){
		    //parent.postMessage("postMessage('paretnAk1();','https://"+((self.location+'').split(/\/+/)[1])+");",postURl1);
        	setTimeout("parent.postMessage('var ifrm=jQuery(\"iframe[title=\\'"+UrlEnd1+tp_conf+"\\']\");ifrm.attr(\\'height\\',\\'"+(maxHeight)+"\\').attr(\\'scrolling\\',\\'yes\\');/*zaapit_tb_zbnx1*/','"+postURl1+"');",30);
        	tempLayoutEditorResize=0;
        }else if(turnOnscrolModeForTabsRL==1 && stopResizing==0 && zptabhsP==""){
        	setTimeout("parent.postMessage('var ifrm=jQuery(\"iframe[title=\\'"+UrlEnd1+tp_conf+"\\']\");var h1=Math.max(550,(jQuery(self).height()-ifrm.offset().top)-20); ifrm.attr(\\'height\\',h1).height(h1).attr(\\'scrolling\\',\\'yes\\').css({\\'overflow-y\\':\\'scroll\\'});/*zaapit_tb_zbnx1*/','"+postURl1+"');",30);
        	stopResizing=1;
        }
    }
    }catch(e){}
    	$("body").trigger("OnRenderDone");
   }
   
   var FilterReplaceLabelNameArr=null;
   function subsituteValueFilters(val){
	  	 var tempRes=val;
	  	 try{
	   		if(FilterReplaceLabelNameArr==null){
	   			FilterReplaceLabelNameArr=new Array();
	   			
		   			if(FilterReplaceLabelName.indexOf("~")>-1){
		   				var tmp=FilterReplaceLabelName.split("#");
		   				//alert(tmp.length);
		   				for(var i=0;i<tmp.length;i++){
		   					var tv=tmp[i].split("~");
		   					FilterReplaceLabelNameArr[tv[0]]=tv[1];
		   				}
		   			}
	   			
	   		}
	   		if(FilterReplaceLabelNameArr!=null){
		   		tempRes=FilterReplaceLabelNameArr[val];
		   		if(tempRes==null){
		   			tempRes=val;
		   		}
	   		}
	   		
	   		if(tempRes.indexOf("&")>-1){
	   			if(tempRes.indexOf("&lt;")>-1){
	   				tempRes=tempRes.replace(/\&lt\;/ig,"<").replace(/\&gt\;/ig,">").replace(/\<[^\>]+\>/ig,"");
	   			}	
	   			tempRes=$('<div/>').html(tempRes).text();
	   		}
		}catch(e){
				
		}
		return tempRes;
   }
   
   function preValueFiltInpt(val){
   		var tempRes=val; 
		if(tempRes.indexOf("&")>-1){
	   			if(tempRes.indexOf("&lt;")>-1){
	   				tempRes=tempRes.replace(/\&lt\;/ig,"<").replace(/\&gt\;/ig,">").replace(/\<[^\>]+\>/ig,"*");
	   			}	
	   			tempRes=$('<div/>').html(tempRes).text();
	   		}
	   	if(tempRes.indexOf("'")>-1 ||tempRes.indexOf("\"")>-1 ||tempRes.indexOf("\\")>-1||tempRes.indexOf(",")>-1){
	   		tempRes=tempRes.replace(/\,|'|"|\\/ig,"_");
	   	}
		return tempRes;
   }
   
   var stopResizing=0;
 function loadDataFilter(field1,filterIdSpan,fieldCalss1,filterObjShowType,colName,resultData,fetchCount1,objRefName){
 	var fieldOrig1=field1;
 	stopResizing=0;
   var fieldMap1=new Array();
   var maxResRows=(loadfilter_maxResRows=="" || isNaN(loadfilter_maxResRows)?250:Number(loadfilter_maxResRows));
   try{
   if(hide_multi_value_filters__c || $("#"+filterIdSpan+" .availVals .btnD").size()>0 ){
        return false;
   }
   var resultsHTML="";
   var useFormulaField=false;
   var showButtons=false;
   var showGraph=false;
   if(!(fetchCount1==null && fetchCount1!=null) &&(filterObjShowType=='1' || (filterObjShowType=='1f' && NOT_Disable_formula_fields_groupings__c )|| (filterObjShowType=='10f' && NOT_Disable_formula_fields_groupings__c )||  filterObjShowType=='4' || filterObjShowType=='2'|| filterObjShowType=='6'|| filterObjShowType=='5'|| filterObjShowType=='7' || (filterObjShowType=='7f' && NOT_Disable_formula_fields_groupings__c ) || filterObjShowType=='11' || (filterObjShowType=='x' && field1.indexOf("date")==-1 && field1.indexOf("__c")==-1&& field1.indexOf("subject")==-1))){//text,bool,date,int,reference
        showGraph=(filterObjShowType.indexOf('f')==-1 && filterObjShowType!='11'&& filterObjShowType!='x');//not formula or X;
        //loadingSH();
        var fieldSoql=field1;
        if((filterObjShowType=='7' || filterObjShowType=='7f') && field1!='id' ){
            //field1=field1.substring(0,field1.length-2)+"."+objRefName;
            if(field1.indexOf("id")==field1.length-2){
                field1=field1.substring(0,field1.length-2)+"."+objRefName;
            }
            if(field1.indexOf("__c",Math.max(0,field1.length-4))==field1.length-3){
                field1=field1.substring(0,field1.length-1)+"r."+objRefName;//'zaapit__'+
            }

            fieldSoql=field1;
        }else if(filterObjShowType=='6'){
            fieldSoql="DAY_ONLY("+field1+")";

        }
        var query1="";
        if(filterObjShowType=='1f' || filterObjShowType=='7f'){
            maxResRows=50;//50 Groups
            field1=""+field1;//zaapit__
            fieldSoql=""+fieldSoql;//zaapit__
            var limitF=limitFORIG;
            if(limitF=="" || isNaN(limitF) || Number(limitF)<=0){
                limitF="3000";
            }else{
                limitF=Math.round(Number(limitF));
            }
            useFormulaField=true;
            query1="SELECT "+fieldSoql+" "+DBsubQery+" order by "+fieldSoql+" limit "+limitF+DB_END_ALLROWS_Qery;
            //alert(limitF+ " " +isNaN(limitF) + " "+Number(limitF) );
            
            if(resultData==null && fetchCount1==null){
            
                Visualforce.remoting.Manager.invokeAction(
                remotequeryAjax2CountFL,
                query1, 
                function(result, event){
                    if (event.status && result!=null) {
    
                        loadDataFilter(fieldOrig1,filterIdSpan,fieldCalss1,filterObjShowType,colName,result,"1",objRefName);
                    
                     } else if (event.type === 'exception') {
                        //self.location=self.location;
                         if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){
                            self.location=self.location;
                        }else if(event.message!=null && (event.message+"").indexOf("Unable to conn")==-1){
                			if($("body:visible").size()>0)alert("An error has occurred: "+event.message);
                		}
                         $("#"+filterIdSpan+" .availVals").html("");
                    } else {
                        //self.location=self.location;
                       // alert(event.type+"");
                         $("#"+filterIdSpan+" .availVals").html("");
                    }
                }, 
                {escape: true,buffer:true,timeout: 90000}
            );
                return;
            }
        }else if( filterObjShowType=='11' || filterObjShowType=='10f' ){
            maxResRows=50;//50 Groups
            field1=""+field1;//zaapit__
            fieldSoql=""+fieldSoql;//zaapit__
            var limitF=limitFORIG;
            if(limitF=="" || isNaN(limitF) || Number(limitF)<=0){
                limitF="3000";
            }else{
                limitF=Math.round(Number(limitF));
            }
            useFormulaField=true;
            query1="SELECT "+fieldSoql+" "+DBsubQery+" limit "+limitF+DB_END_ALLROWS_Qery;
            //alert(limitF+ " " +isNaN(limitF) + " "+Number(limitF) );
            //alert(query1);
            if(resultData==null && fetchCount1==null){
            
                Visualforce.remoting.Manager.invokeAction(
                remotequeryAjax2CountMPLX,
                query1, 
                function(result, event){
                    if (event.status && result!=null) {
    
                        loadDataFilter(fieldOrig1,filterIdSpan,fieldCalss1,filterObjShowType,colName,result,"1",objRefName);
                    
                     } else if (event.type === 'exception') {
                        //self.location=self.location;
                         if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){
                            self.location=self.location;
                        }else if(event.message!=null && (event.message+"").indexOf("Unable to conn")==-1){
                			if($("body:visible").size()>0)alert("An error has occurred: "+event.message);
                		}
                         $("#"+filterIdSpan+" .availVals").html("");
                    } else {
                        //self.location=self.location;
                       // alert(event.type+"");
                         $("#"+filterIdSpan+" .availVals").html("");
                    }
                }, 
                {escape: true,buffer:true,timeout: 90000}
            );
                return;
            }

        }else{
        	//,max(id)
            query1="SELECT "+fieldSoql+" f1,count(id) c1 "+DBsubQery+" group by "+fieldSoql+" order by "+fieldSoql+" limit "+maxResRows+DB_END_ALLROWS_Qery;
            
            if(fieldSoql.indexOf('__xx.')>-1){
		  		var f1=fieldSoql.split("__xx.");
	            if(f1.length==3){
	            	var fieldSoqlF=fieldsetFilerXXMap[fieldSoql];
	            	//alert(fieldSoqlF);
	            	if(fieldSoqlF!=null && $.trim(fieldSoqlF)!=""){
	            		fieldSoqlF=" and ( "+$.trim(fieldSoqlF)+" )";
	            	}else{
	            		fieldSoqlF="";
	            	}
	            	//alert(".fltIC"+(field1.replace(/\./,"-"))+".fltIC");
	            	var ajxg = $(".fltIC"+(field1.replace(/\./ig,"-"))+".fltIC").attr("ajxg");
		  			query1="SELECT "+f1[2]+" f1,count(id) c1 FROM "+f1[0]+" WHERE "+f1[1]+" in (SELECT id "+DBsubQery+" ) "+(fieldSoqlF)+ (ajxg!=null && $.trim(ajxg)!=""?" and "+ajxg:"")+" group by "+f1[2]+" order by "+f1[2]+" limit "+maxResRows+DB_END_ALLROWS_Qery;
		  			//alert(query1);
	         	}
	  		}
            if(resultData==null && fetchCount1==null){
        
                Visualforce.remoting.Manager.invokeAction(
                remoteQueryAjax2,
                query1, 
                function(result, event){
                    if (event.status && result!=null) {
                        if(fieldSoql.indexOf('__xx.')>-1){
                           result.splice(0, 0, {"c1":"N/A","f1":""}).join();
                           //alert(result[1]);
                        }
                        loadDataFilter(fieldOrig1,filterIdSpan,fieldCalss1,filterObjShowType,colName,result,"1",objRefName);
                    
                     } else if (event.type === 'exception') {
                        //self.location=self.location;
                         if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){
                            self.location=self.location;
                        }else if(event.message!=null && (event.message+"").indexOf("Unable to conn")==-1){
                			if($("body:visible").size()>0)alert("An error has occurred: "+event.message);
                		}
                         $("#"+filterIdSpan+" .availVals").html("");
                    } else {
                        //self.location=self.location;
                        //alert(event.type+"");
                         $("#"+filterIdSpan+" .availVals").html("");
                    }
                }, 
                {escape: true,buffer:true,timeout: 90000}
            );
                return;
            }
        }
         //alert(query1);
        


        var lastVal=null;
        var lastCountf=0;
        var queryMore = true;
        var hasRows = true;
        var count1=0;
        resultsHTML+="<thead><tr><td><input type='checkbox' class='xfilt1All' name='selectAll' id='"+filterIdSpan+"-A' onclick='selAllFlt(this);'></td><td><label for='"+filterIdSpan+"-A'>"+Select_All+"</label></td><td >#</td></tr></thead><tbody>";
        while (queryMore && count1<maxResRows) {
            var records = resultData;//result.getArray("records");
            if(records!=null && records.length>0){
                
                for (var key in records[0]) {
                    //alert(key+" "+records[0][key]+" "+(typeof  records[0][key]));
                    fieldMap1[key.toLowerCase()]=key;
                    if(records[0][key]!=null && (typeof records[0][key]) == "object"){
                    
                        for (var key1 in records[0][key]) {
                            fieldMap1[key1.toLowerCase()]=key1;
                        }
                    }  
                }
                
            }else{
                queryMore=false;
                continue;
            }
            
            var fieldDotIdx=field1.indexOf(".");
            var field1Xnd=(fieldDotIdx>-1?field1.substring(fieldDotIdx+1):field1);
            //var expfieldsStart=(!useExpField?0:1);
            var countFname="c1";//'expr'+expfieldsStart;
            var mainFieldName="f1";//(!useFormulaField?"f1":fieldMap1[field1Xnd]);
            //alert(records[0]);
            var dateFormatPatren=dateFormatPatrenORIG;
            var defaultDateFormat=(dateFormatPatren=="-"?true:false);
            var formatter_gva = (defaultDateFormat?null:new google.visualization.DateFormat({pattern: dateFormatPatren}));
            //alert(records[0]);
                for (var i = 0; i < records.length; i++) {
                    hasRows=true;
                    var val1=records[i][mainFieldName];
                    var val1Count=records[i][countFname];
                    var objN="";
                 	var val1Label=val1;
                    if(val1!=null && val1.indexOf("T")>-1 && val1.match(/[0-9]{4}\-[0-9]{2}\-[0-9]{2}T.*/ig) ){
                        val1=val1.replace("T"," ");
                        val1=val1.replace("Z","");
                        val1=val1.replace(".000","");
                    }
                    
                     val1Label=val1;
                        try{
                        	if(!defaultDateFormat &&(filterObjShowType=='2'|| filterObjShowType=='6')){//date
	                        	var td1=val1Label.split("-");
	                        	var dto= new Date(Number(td1[0]),(Number(td1[1])-1),Number(td1[2]));
	                        	val1Label=formatter_gva.formatValue(dto);
	                        	//alert(dto+ " "+val1Label);
                        	}
                        }catch(e){}
                    
                    resultsHTML+="<tr>";
                 resultsHTML+="<td><input type='checkbox' class='xfilt1' name='xfilt1' value='"+preValueFiltInpt(val1==null || val1==""?" ":val1)+"' onclick='selOneFlt(this);' id='"+filterIdSpan+"-"+count1+"'></td><td class='v1'><div class='vl1'><label for='"+filterIdSpan+"-"+count1+"' onmouseover='fixTitlex1(this);'>"+(val1==null || val1==""?Blanks_txt:subsituteValueFilters(val1Label))+"</label></div></td><td class='gray'>"+(val1Count==null?"":val1Count)+"</td>";
                 
                resultsHTML+="</tr>";
                count1++;
                }
            
            
            queryMore = false;

        }

                    
         if(count1==maxResRows){
               resultsHTML+="<tr>";
               var bottomMSg=(Showing_first_X_rows).replace("{0}",maxResRows+"");
               resultsHTML+="<td colspan='3' align='center' style='color:#a1a1a1;font-size:8pt;'>"+bottomMSg+"</td>";
               resultsHTML+="</tr>";
         }
        //alert(resultsHTML);
        if(hasRows){
            resultsHTML=("<div class='fltTblOfw'><table class='fltTblOf'>"+resultsHTML+"</table></div>");
            showButtons=true; 
        }else{
            $("#"+filterIdSpan+" .availVals").html("");
        }
        
        }else if(filterObjShowType=='1f' && !(NOT_Disable_formula_fields_groupings__c )){
            showButtons=true;
            if(lastCountf>0){
                 resultsHTML+="<tr>";
                 resultsHTML+="<td><input type='checkbox' class='xfilt1' name='xfilt1' value='"+preValueFiltInpt(lastVal==null || lastVal==""?" ":lastVal)+"' onclick='selOneFlt(this);' id='"+filterIdSpan+"-"+count1+"'></td><td class='v1'><div class='vl1'><label for='"+filterIdSpan+"-"+count1+"' onmouseover='fixTitlex1(this);'>"+(lastVal==null || lastVal==""?Blanks_txt:subsituteValueFilters(lastVal))+"</label></div></td><td class='gray'>"+(lastCountf==null?"":lastCountf)+"+</td>";
                 
                resultsHTML+="</tr>";
                count1++;
            }
        }else if(filterObjShowType=='6'){//datetime
            //$("#"+filterIdSpan+" .availVals").html("");
            //showButtons=true;
        }else if(filterObjShowType=='8' |filterObjShowType=='3' || filterObjShowType=='35' || filterObjShowType=='3f' || filterObjShowType=='35f'){//numbers
          var formatterInt = new google.visualization.NumberFormat({
                pattern: '#,###,###.##'
            });
            var inpFieldsO=$("#"+filterIdSpan+" .filterObjShow1 .inptFilter");
            if(inpFieldsO[0]!=null && $("#"+filterIdSpan+" .availVals .btnD").size()==0){
                var query1="SELECT min("+field1+") s1,max("+field1+") s2 "+DBsubQery+" "+DB_END_ALLROWS_Qery;

                 showButtons=true;
                 showGraph=false;         
                       
                Visualforce.remoting.Manager.invokeAction(
                remoteQueryAjax2,
                query1, 
                function(result, event){
                    if (event.status && result!=null) {
    
                           var records = result;

                             if(records.length>0){
                                var min1=Math.floor(Number(records[0]["s1"])).toFixed(0);
                                var max1=Math.ceil(Number(records[0]["s2"])).toFixed(0);
                                  $(inpFieldsO[0]).attr("title",Min_title+" "+formatterInt.formatValue(min1));
                                  $(inpFieldsO[1]).attr("title",Max_Title+" "+formatterInt.formatValue(max1));
                                  //alert(records[0].s2);
                                  //inpFieldsO.tooltip();
                            }
                    
                     } else if (event.type === 'exception') {
                        if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){
                        	self.location=self.location;
                        }else if(event.message!=null && (event.message+"").indexOf("Unable to conn")==-1){
                        	if($("body:visible").size()>0)alert("An error has occurred: "+event.message);
                       	}
                         $("#"+filterIdSpan+" .availVals").html("");
                    } else {
                        //self.location=self.location;
                         $("#"+filterIdSpan+" .availVals").html("");
                    }
                }, 
                {escape: true,buffer:true,timeout: 90000}
            );
               
            }
            
        }

        if(filterObjShowType=='4'){//booleans
            resultsHTML=resultsHTML.replace('>true<','><img class="checkImg" width="21" height="16" title="Checked" alt="Checked" src="/img/checkbox_checked.gif"><');
            resultsHTML=resultsHTML.replace('>false<','><img class="checkImg" width="21" height="16" title="Not Checked" alt="Not Checked" src="/img/checkbox_unchecked.gif"><');
        }
        if(showButtons){
			$("#"+filterIdSpan+" .extBtns").html("");
            if(NOT_Hide_graph_link_on_filter__c && showGraph && count1>0){
                $("#"+filterIdSpan+" .extBtns").append("<a href='javascript:void(0);' class='menuItemFlt GraphLnk' onclick='createGarphsDataFilter(\""+field1+"\",\""+filterIdSpan+"\",\""+fieldCalss1+"\",\""+filterObjShowType+"\",\""+Amount_field_For_Graphs__c+"\",\""+amountFieldName+"\",\""+colName+"\",\""+count1+"\",\""+NOT_DisableGeoMaps__c+"\",null,null,null,null,\""+objRefName+"\");return false;'>"+Instant_Graph+"</a>");
            }
            if(isEditMode1 && $("input.iTb.inpSt_"+fieldOrig1+"[type='text']:first,textarea.iTb.inpSt_"+fieldOrig1+":first").size()>0){
                $("#"+filterIdSpan+" .extBtns").append("<a href='javascript:void(0);' class='menuItemFlt findRepLnk' onclick='searchAndReplacePopUpF(\""+fieldOrig1+"\");return false;'>"+find_Replace+"</a>");
            }
            
            $("#"+filterIdSpan+" .availVals").html(resultsHTML+"<div class='btnD'><button class='btn filterBtnExcelStl' onclick='selectFilterExCBOX(\""+filterIdSpan+"\",\""+fieldCalss1+"\");' type='button' >"+filter_ex_Btn+"</button><button class='btn' onclick='closeFilterx();' type='button' style='margin-left:5px;' >"+Cancel_filter_button+"</button></div>");
             var curObj=$("#"+filterIdSpan);
             var availVals=curObj.find(".availVals");
             availVals.width(availVals.width());
             /*calc new left!*/
             var scrollMode=isScrollMode();
              var sl1= getCUrrScollLeft();
            var fltTblOfw=curObj.find(".fltTblOfw");
            fltTblOfw.width(fltTblOfw.width());         
            var exptWidth=(fltTblOfw.size()>0 && fltTblOfw[0].scrollWidth >fltTblOfw.width()?fltTblOfw[0].scrollWidth:availVals.width());
            var bodyW=$("body").width()+(scrollMode?0:sl1);
            var curLeft=curObj.css("left");
            if(curLeft!=null && curLeft.indexOf("px")>-1){
                curLeft=Number(curLeft.substring(0,curLeft.length-2));
            }
            //alert(curLeft+ " "+exptWidth+" "+ bodyW+ " "+( curLeft+exptWidth>bodyW));
            if(curLeft!=null && curLeft+exptWidth>bodyW){
                curLeft=Math.round(bodyW-exptWidth-20);
                if(!isSF1()){
		        	curObj.css({"left":curLeft});
		        }
                //curObj.css({"left":curLeft});
                //alert("curLeft: "+curLeft);
            }
            curObj.find("input:first").width(exptWidth);
        }else{
            $("#"+filterIdSpan+" .availVals").html("");
        }
        fixIfmHegt();
        

        //fixOnload();
        }catch(e1){
		//alert(e1);
            if(e1!=null && (e1+"").indexOf("INVALID_FIELD")>-1){
                alert("One of the below marked fields have access right issues: \n\n"+e1);
            }else if(e1!=null && (e1+"").indexOf("INVALID_SESSION_ID")>-1){
                self.location=self.location;
            }else{

            }
            $("#"+filterIdSpan+" .availVals").html("");
        }
    
   }
   
   var isjumpToClk=false;
    function jumpToClk(p,m){
    if(p>m){
        alert(unavailable_page);
        return;
    }
    if(!noticeUnsave()){
    	return false;
    }else{
    	savedGroups1();
    	isjumpToClk=true;
    	loadingSH();
    	scrollTop1();
    	jumpTo(p);
    };
        
   }
   
   function nextPrev(p){
   	
  	 p=Number(p);
    if(p>maxPageOfsetGlb){
        setTimeout(function(){alert(unavailable_page);},50);
        return false;
    }else{
        if(!noticeUnsave()){
        return false;
        }else{
        loadingSH();
        return true;
        };
    }
   }
   
   function openExportWindow(){
   trackEventX('openExportWindow');
    if(totalCountAjx>maxRowToExport){
    	if($("#showLimitExport").html().indexOf("{0}")>-1){
    		$("#showLimitExport").html($("#showLimitExport").html().replace("{0}",maxRowToExport));
    	}
        $("#showLimitExport").show();
    }else{
        $("#showLimitExport").hide();
    }
    var width1=380;
    var isSF1x1=isSF1();
    var maxWidth=$(self).width()+(isSF1x1?-10:-100);
	if(width1==null){
		width1=maxWidth;
	}else if(width1>maxWidth){
		width1=maxWidth;
	}
    $("#exportDialog1").dialog({
    resizable: true,
    //height:140,
    width:380,
    modal: true,
    buttons: [{
    text:Save_File_button,
   click: function() {
   		var or1='';
   		or1=$($("#fileTypePD")[0][$("#fileTypePD")[0].selectedIndex]).attr("or1");
   		if(or1==null || or1==""){
   			or1="0";
   		}
   		//alert(or1);
        createFile($("#fileTypePD").val(),or1);
        $( this ).dialog( "close" );
    }},
	{text:Cancel_button,
    click: function() {
        $( this ).dialog( "close" );
    }
    }]
    });
   }

   function createFile(type,or1){
    var loc1=(self.location+"");
    $("#fileType").val(type);
    $("#fileq").val(fileq);
    $("#or1").val(or1);
    //alert(or1);
    $("#export_to_form #vid").val(mainViewID);
    //loadingSH();

    if(loc1.indexOf("zaapit.")==-1 || loc1.indexOf(".com/apex/")==-1 || loc1.indexOf("/servlet/")>-1 || parentLocParam1.indexOf("/servlet/")>-1){
        $("#export_to_form").attr("method","get");
    }

    var prefix="/apex/";
    if(loc1.indexOf("/servlet/")>-1){
        //prefix="/apex/"
    }else if(loc1.indexOf("/apex/")>-1){
        prefix="../apex/";
    }else{
        prefix="apex/";
    }
    if(export_to_url!="-" && export_to_url!=""){
   	 	$("#export_to_form").attr("method","post");
    	prefix=export_to_url+"/apex/";
    }
    $("#export_to_form").attr("action",prefix+"zaapit__export_to_file");
    
    $("#export_to_form")[0].submit();
    //setTimeout("fixOnload();",5000);
    //win1.focus();
}
//var lastGroupingPerGroup
function colorRowsByFieldChange(field1){
	///Enable_Sort_coloring//Enable_Sort_grouping
	field1=field1.replace(/\./ig,"-");
	var filedRows=$("#mainTBX1 td.iTd."+field1+" span, #mainTBX1 .ost1X.oSt_"+field1+"");
	var inpMode=0;
	var inpElementT=0;//span
	if(filedRows.size()>0 && $(filedRows[0]).find(".checkImg").size()>0){
	 		inpElementT=2; //checkbox
	 	
	}
	if((inpElementT==0 && isEditMode1) || filedRows.size()==0 || $(filedRows[0]).hasClass("hd1")){
	 	filedRows=$("#mainTBX1 input.inpSt_"+field1+",#mainTBX1 select.inpSt_"+field1+",#mainTBX1 textarea.inpSt_"+field1+", #mainTBX1 td.iTd."+field1+" span[id]");
	 	inpMode=1;
	 	if(filedRows.size()>0 && $(filedRows[0]).prop("tagName").toLowerCase()=="span"){
	 		inpElementT=0; 
	 	}else{
	 		inpElementT=1;
	 	}
	}
	
	//alert(inpElementT);
	var numOfCells=0;
	if( filedRows.size()>0){
		var count1=0;
		var countDiff=0;
		var currS="tcx"+(countDiff%2);
		var groupNum=countDiff;
		var lastVal=(inpMode==0 || inpElementT==0 || inpElementT==2?(inpElementT==2?$.trim($(this).find(".checkImg").attr("alt")):$.trim($(filedRows[0]).text())):$.trim($(filedRows[0]).val()));
		if(lastVal!=null && lastVal.indexOf("-"+"-"+">")>-1){
				lastVal=lastVal.substring(currVal.indexOf("-"+"-"+">")+3);
		}
		var headerName=(Enable_Sort_grouping?$.trim($("th.thw."+field1+" .thTxtzp:first").html()):"");
		var lastCountSpn=null;
		var lastCount=null;
		var isFirstInGroup=true;
		filedRows.each(function(){
			var currVal=(inpMode==0 || inpElementT==0 || inpElementT==2?(inpElementT==2?$.trim($(this).find(".checkImg").attr("alt")):$.trim($(this).text())):$.trim($(this).val()));
			if(currVal.indexOf("-"+"-"+">")>-1){
				currVal=currVal.substring(currVal.indexOf("-"+"-"+">")+3);
			}
			var mainTR=$(this).parents("tr.dataRow:first");
			if(mainTR.attr("mrk1x")==null){
				
				//alert(currVal+" "+lastVal);
				mainTR.attr("mrk1x","1");
				if(currVal!=lastVal){
					countDiff++;
					if(Enable_Sort_coloring){
						currS="tcx"+(countDiff%2);
					}
					groupNum=countDiff;
					isFirstInGroup=true;
				}
				if(Enable_Sort_grouping && (currVal!=lastVal || count1==0)){
					if(numOfCells==0){
						numOfCells=mainTR.find(">td").size();
						//alert(numOfCells);
					}    //<a href='javascript:void(0);' onclick='filterColgroup(this,\""+field1+"\");' title='Click to Filter' onmouseover='fixTitlex2(this);'></a>
					mainTR.before("<tr><td colspan='"+numOfCells+"' class='rowGrouping1 "+field1+"'><span class='ui-icon ui-icon-triangle-1-s uiColps' onclick='collapseExp(this);' grp='"+count1+"'></span>"+headerName+":<span class='ml5'>"+(currVal==null || currVal==''?Blanks_txt:currVal)+"</span><span class='count1'/></td></tr>");
					
					if(lastCount!=null )lastCountSpn.html("("+lastCount+(false && count1==viewRowCount?"<span class=\"grisLastPagex1\"/>":"")+")");//
					lastCount=0;
					lastCountSpn=mainTR.prev().find(".count1");
					
					
				}
				count1++;
				if(lastCount!=null && mainTR.hasClass("dataRow"))lastCount++;
				mainTR.addClass(currS).attr("gnz",groupNum);//groupnumzaapit
				if(hasMassMerge=="true" && isFirstInGroup){
					//mainTR.addClass("gnzMSR");
				}
				//alert(currS);
				lastVal=currVal;
				isFirstInGroup=false;
			}
		});
		if(lastCount!=null )lastCountSpn.html("("+(lastCount)+")");
		if(Enable_Sort_grouping){
			//$(".headerRow .CBL").html("<span class='ui-icon ui-icon-triangle-1-s uiColps' onclick='collapseExpAll(this);'></span>"+$(".headerRow .CBL").html());
			if(isjumpToClk || returnFocus!="")reloadLastSavedGroups();
			fixIfmHegt();
			
		}
		
	}

}

function filterColgroup(obj,fieldName){
	var val1=$.trim($(obj).text());
	val1=val1.replace(/^\$|\%$|USD$|EUR$|ILS$|AUD$|BRL$|CAD$|CHF$|CNY$|GBP$|HKD$|JPY$|MXN$|NZD$|RUB$|SGD$/g,"");
	
	val1=val1.replace(/\,/,"");
	$(".filterinoIPT.inpf"+fieldName).click().val(val1);
	selectFilterExCBOX("fl"+fieldName,"inpf"+fieldName);
}
var oldAddRowMarkings=null;
function preAddRow(){
	trackEventX('preAddRow');
	if(isNaN(NumberOfNewRows)){
		NumberOfNewRows="1";
	}else{
		NumberOfNewRows=Math.round(NumberOfNewRows)+"";
	}
	//alert(NumberOfNewRows);
	var res=true;
	oldAddRowMarkings=new Array();
	var checkedRows=$("#mainTBX1 tbody tr .lcbX input:checked");
	checkedRows.each(function(){
		oldAddRowMarkings.push($(this).parents(".lcbX:first").attr("rid"));
	});
	//alert(checkedRows.length+" "+oldAddRowMarkings);
	totChanged=checkedRows.size();
	if(true || totChanged==0){
		loadingSH();
		addNewRowAF(NumberOfNewRows);
		res= true;
	}else{
		alert(saveWorkBeforeNewRow);
		res= false;
	}
	return true;
}

//** m o b i l e **
var windDestGlobal=window;
var winpramsGlobal=null;
function editRowZP(recordId,url,win1){
	if(isSF1()){
		try{
			sforce.one.editRecord(recordId);
			//alert("edit");
		}catch(e){}
	}else{
		navigateZP('../'+recordId+'/e?retURL='+url,win1);
	}
}
function newObjZP(tbName,url,win1){
	if(isSF1()){
		try{
			sforce.one.createRecord(tbName);
			//alert("edit");
		}catch(e){}
	}else{
		navigateZP(url,win1);
	}
}
function navigateZP(url,windDest,winprams,lightRD){//windDestetination (send parent if needed), winprams for new window
//alert(url.length);
try{
if(windDest!=null){
	windDestGlobal=windDest;
}else{
	windDestGlobal=window;
}
if(winprams!=null){
	winpramsGlobal=winprams;
}else{
	winpramsGlobal=null;
}
try{
if(!isSF1()){
	var domain1=(Urlx1.indexOf("zaapit__")>-1 || Urlx1.indexOf("zaapit.")>-1?"zaapit__":"c__");
	var loc1=(self.location+"");
	var locX1=loc1.split("?")[0];
	var urlxxx=(locX1)+"?viewId="+(mainViewIDTemp!=""?mainViewIDTemp:mainViewID)+sfdcTabNameParam+"&retFoc="+escape(url)+(mainID!=""?"&id="+mainID:"")+(loc1.indexOf("isdtp=vw")>-1?"&isdtp=vw":"")+(loc1.indexOf("&isdtp=p1")>-1?"&isdtp=p1":"")+"&pw1="+escape(parentLocParam1)+"&tp="+escape(tp_conf);
	//var bookie="lastlist="+urlxxx;
	if(url.indexOf("retURL")==-1){
		var top_loc=null;
		try{
			top_loc=""+top.location.src;
			//alert(top_loc);
		}catch(e3){}
		if(url.length<2000)url=url+(url.indexOf("?")==-1?"?":"&")+"retURL="+escape((top_loc==null && mainID!=""?"/"+mainID:urlxxx));
	}
	try{
	var stragePref2="subtab~"+UrlEnd1+"~"+mainID;

		localStorage.setItem(stragePref2, urlxxx); 
	//alert(stragePref2+" "+"/apex/"+domain1+urlxxx );
	}catch(e){}
	//document.cookie=bookie;
	//alert(isInIframe());
	if(!isInIframe()){
		history.pushState({}, $(".curSelectedView").val(), urlxxx);
	}
}else{
	//document.cookie="lastlist=";
}
}catch(e1){}
//alert((url.split("?")[0]));
//alert(url.match(/^[\.]{0,2}\/[a-z0-9]+$/ig));
//alert(sforce.console!=null);
	if(isSF1() && (url.split("?")[0]).match(/^[\.]{0,2}\/[a-z0-9]+$/ig)){//redirect to single ID: "/safdsgsdf036"
		navigateZPObjID((url.split("?")[0]).substring(url.indexOf('/')+1));
	}else{
		if(isSF1()){
			NavMobZP(url,false);//isredirect
//		}else if(sforce.console!=null){
	//		alert("console");//
//			     sforce.console.getEnclosingPrimaryTabId(openSubtab);
        
      //  var openSubtab = function openSubtab(result) {
            //Now that we have the primary tab ID, we can open a new subtab in it
        //    var primaryTabId = result.id;
         //   sforce.console.openSubtab(primaryTabId , url, true, 
         //       null, null, null, 'zp_salesforceSubtab');
        //};
        }else if(isSFLight1XV){
        	
        	//if((url.split("?")[0]).match(/^[\.]{0,2}\/[a-z0-9]+$/ig)){
        		
        	//}
        	//alert(lightRD + " " +(lightRD!=null));
        	if(lightRD==null){
        		//winpramsGlobal="width=1200,height=800";
        		//window.open(url,"_blank",winpramsGlobal);
        		redirectNormal1(url);
        	}else{//for edit layout and spcial UC
        		redirectNormal1(url);
        	}
		}else{
			redirectNormal1(url);
		}
	}
	}catch(e){
		redirectNormal1(url);
	}
	
}
function NavMobZP(url,isredirect){
	try{
	if(url.indexOf("/back.jsp")>-1){
		sforce.one.back(true);
	}else{
		sforce.one.navigateToURL(url,isredirect);//isredirect
	}
	}catch(e){
	}
}

function navigateZPObjID(recordId){
try{
	if(sforce!=null && sforce.one!=null){
		sforce.one.navigateToSObject(recordId,"detail");
	}else{
		redirectNormal1("/"+recordId);
	}
	}catch(e){
		redirectNormal1("/"+recordId);
	}
}
function redirectNormal1(url){
	if(winpramsGlobal==null){
		windDestGlobal.location=url;
	}else{
		windDestGlobal.open(url,"popup1",winpramsGlobal);
	}
}
function isSF1(){
var res=false;
try{
	res=isSF1XV;//(typeof sforce != 'undefined') && sforce!=null && sforce.one!=null;
}catch(e){
}
return res;
}
function addnewRow(){
	try{
		//alert(oldAddRowMarkings.length);
		if(oldAddRowMarkings!=null && oldAddRowMarkings.length>0){
			var strxx1="";
			for(var irx=0;irx<oldAddRowMarkings.length;irx++){
				if(oldAddRowMarkings[irx]!=null){
					$(".RID"+oldAddRowMarkings[irx]).attr("checked","checked").each(function(){
					markCheckedRows=true;
					//markCheckedRow($(this).parents("tr:first"));//each for new rows
					});
				}
			}
			oldAddRowMarkings=null;
		}
	}catch(e){}
	fixOnload();
	scrollBottom1();
	
	$("#mainTBX1 table.list tbody tr.dataRow:last").addClass("markedRowTA");
	$("#mainTBX1 table.list tbody tr.dataRow:last").removeClass("markedRowTA",5000,function(){});
}
function openGenWindow1(src1,title1,width1,height1,buttons,closeFunc){
	var isSF1x1=isSF1();
	var maxWidth=$(self).width()+(isSF1x1?-10:-100);
	if(width1==null){
		width1=maxWidth;
	}else if(width1>maxWidth){
		width1=maxWidth;
	}
	$("#generalWinIframe1IDIframe")[0].src="about:blank";
	$("#generalWinIframe1IDIframe").attr("src",src1);

	var iframeH=(height1==null?($(self).height()+(isSF1x1?-10:-150)):(height1-100))-3;
	//alert(iframeH);
	$("#generalWinIframe1IDIframe").height(iframeH);
	$("#generalWinIframe1").dialog({
            resizable: true,
            height:(height1==null?($(self).height()+(isSF1x1?0:-100)):(height1)),
            width:width1,
            modal: true,
            title: title1,
            buttons: buttons,
             close: closeFunc
            });
            
	//generalWinIframe1Name
}

function closeGenWindow1(){
	$("#generalWinIframe1").dialog("close");
}
function chtrflnx1(obj){
	$(obj).find(".zen-mediaExt").each(function(){
		if($(this).attr("data-chatter-subscribe")==null	){
			$(this).attr("data-chatter-subscribe","0");
		}
		//alert($(this).css("display"));
		if($(this).css("display")=="inline"){
			$(this).css("display","inline-block");
		}
	});
	
}

function chtrinos1(id1,obj){
try{
	
	var idURL=id1;
	if(idURL!=null && idURL.length==18){
		idURL=idURL.substring(0,15);
	}
	var action="new";
	if($(obj).hasClass("chtrW1true")){
		action="delete";
	}

	if(action=="new"){
		
 Visualforce.remoting.Manager.invokeAction(
                remotesetFollowChatterSts,
                id1,true, 
                function(result, event){
                	//alert(result + " "+event);
                    if (event.status && result!=null) {
				    		$(obj).addClass("chtrW1true");
						$(obj).removeClass("chtrW1false");
                     } else if (event.type === 'exception') {
                        //self.location=self.location;
  
                    } else {
      
                    }
                }, 
                {escape: true,buffer:true,timeout: 90000}
            );

		
		
	}else{

			 Visualforce.remoting.Manager.invokeAction(
                remotesetFollowChatterSts,
                id1,false, 
                function(result, event){
                //alert(result + " "+event);
                    if (event.status && result!=null) {
		    			$(obj).addClass("chtrW1false");
						$(obj).removeClass("chtrW1true");
                     } else if (event.type === 'exception') {
                        //self.location=self.location;
  
                    } else {
      
                    }
                }, 
                {escape: true,buffer:true,timeout: 90000}
            );
            

	}
	
	}catch(e){
		alert(e);
	}
}


function octrF1(id1){
	var obj="input.RID"+id1+"";
	fixDilalogIframeHeight();
	$(obj).parents("tr.dataRow:first").addClass("markedRowTA");
	var pw1=(parentLocParam1==""?self.location:parentLocParam1)+"";
	if(pw1.indexOf("servlet.Integration")>-1){
		pw1="/"+mainIDForURL;
	}
	setTimeout(function(){openGenWindow1("../apex/chatterPreview?id="+id1+"&isdtp=vw&pw1="+escape(pw1),chatter_feed_title,850,null,null,function(){
	$("#generalWinIframe1IDIframe")[0].src="about:blank";
		$(obj).parents("tr.dataRow:first").removeClass("markedRowTA",1000,function(){});
     	if(lastBodyHeight!=null){
              $("#padBut1").height(0);
              fixIfmHegt();
      	}
	});
	},200);
}

var lastHoverCount1=1;
function octrF1O(obj,show){
	var OF1=$(obj).parents(".chtr1:first").find(".OF1");
	//var titd1=$(obj).attr("titd1");
	//alert(titd1);
	$(obj).removeAttr("mouseover","").removeAttr("mouseout","")
	openQtip1(obj,OF1.html());
	OF1.remove()
/*
	lastHoverCount1++;
	var curlastHoverCount1=lastHoverCount1;
	
	if(show){
		setTimeout(function(){if(curlastHoverCount1==lastHoverCount1){$(".ui-tooltip:visible").hide();$(".OF1:visible").hide();OF1.show().addClass("db");}},500);
	}else{
		setTimeout(function(){OF1.hide().removeClass("db");},5500);
	}
	*/
	
}
function closeOctrF1O(){
	lastHoverCount1++;
	$(".OF1:visible").hide();
}
function omActF1(id1,obj){
	fixDilalogIframeHeight();
	$(obj).parents("tr.dataRow:first").addClass("markedRowTA");
	var moreAction_Linkx=moreAction_Link.replace("{0}",id1);
	var pw1=(parentLocParam1==""?self.location:parentLocParam1)+"";
	if(pw1.indexOf("servlet.Integration")>-1){
		pw1="/"+mainIDForURL;
	}
	setTimeout(function(){openGenWindow1(moreAction_Linkx+(moreAction_Linkx.indexOf("?")==-1?"?":"&")+"pw1="+escape(pw1),moreAction_title,moreAction_windowWidth,null,null,function(){
	$("#generalWinIframe1IDIframe")[0].src="about:blank";
		$(obj).parents("tr.dataRow:first").removeClass("markedRowTA",1000,function(){});
     	if(lastBodyHeight!=null){
              $("#padBut1").height(0);
              fixIfmHegt();
      	}
	});
	},200);
}
var StratResize=false;
var StratResizeObj=null;
var StratResizeLWI=null;
function resizeColSr(obj,e){
	if(!isScrollMode() & !isSF1()){
		stopProp1(e);
		StratResize=true;
		StratResizeObj=obj;
		$("body").addClass("noselect1");
		var height=$("#mainTBX1").height();
		$(".resizex1,.resizex2").height(height).show();
		var ph1=$(StratResizeObj).parents("th:first");
		var ph1O=ph1.position();
		
		//alert(ph1.width());
		$(".resizex1").css({left:(ph1O.left),top:ph1O.top});
		$(".resizex2").css({left:(ph1O.left+ph1.width()),top:ph1O.top});
		//alert("resizeColSr");
		StratResizeLWI=ph1.width();
	}
}
function resizeColSt(){
//alert("resizeColSt "+StratResizeLWI);
	if(StratResize){
	StratResize=false;
	var col=$(StratResizeObj).attr("fld");
	var p1=$(StratResizeObj).parents(".thw:first");
	var ph1=$(StratResizeObj).parents("th:first");
	ph1.css({"width":StratResizeLWI}).find(".thTxtzp").css({"width":(StratResizeLWI-17)+"px"});
	p1.css({"min-width":StratResizeLWI+"px"});
	$(".oSt_"+col+",span.inpSt_"+col).width(StratResizeLWI);  
	//ph1.find("a:first,.thTxtzp").css({"width":(StratResizeLWI-17)});
	//ph1.css({"width":StratResizeLWI});
	$(".resizex1,.resizex2").hide();
	
	$("body").removeClass("noselect1");
	Visualforce.remoting.Manager.invokeAction(
                remotesetColumnWidth1,
                col,p1.width(),currConf_name, mainViewID, 
                function(result, event){
                	//alert(result + " "+event);
                    if (event.status && result!=null) {
				    		//alert(result + 'Saved');
				    		$(".columnsWidthXZ").val(result);
                     } else if (event.type === 'exception') {
  
                    } else {
      
                    }
                }, 
                {escape: true,buffer:true,timeout: 90000}
            );
            
            //p1.css({"min-width":StratResizeLWI});
	//alert("2");
	}
}
function getCUrrScollLeft(considerInsideScroll){
	//return $(self).scrollLeft(); 
	return (EnableHorizontalScroll==1?(considerInsideScroll!=null && considerInsideScroll?$("#mainTBX1").scrollLeft():0):$(self).scrollLeft());
}
function resizeColOv(e){
	if(StratResize){
		var p1=$(StratResizeObj).parents(".thw:first");
		var ph1=$(StratResizeObj).parents("th:first");
		var pl=ph1.offset().left;
		var mp=e.clientX+ getCUrrScollLeft(false); 
		//alert(getCUrrScollLeft(true));
		if(mp>pl+10 ){
			StratResizeLWI=mp-pl;
			
			//p1.css({"min-width":StratResizeLWI});
			$(".resizex2").css({left:(mp-7)});
		}else{
			//p1.css({"min-width":ph1.width()});
			$(".resizex2").css({left:(pl+10)});
		}
		//alert(mp + " "+pl);
	}
}
function openActionsMob(obj){
	if($(obj).hasClass("clk")){
		$(obj).removeClass("clk");
	}else{
		$(obj).addClass("clk");
	}
}
function btnMenuSF1(obj){
	//$("body").height(650);
    if($(obj).hasClass("clk")){
		$(obj).removeClass("clk");
	}else{
		$(obj).addClass("clk");
	}
}
	//https://www.salesforce.com/us/developer/docs/ajax/Content/sforce_api_ajax_queryresultiterator.htm
	
	
	function saveIgnoreErrors(){
    
        if(confirm("Do you want to skip the marked error-rows & save?")){
            if(currePlacex1RedErrors!=""){
                $(currePlacex1RedErrors.substring(1)).each(function(){
                    $(this).find("input:checked").prop("checked",false);
                });
            }
            loadingSH();
            saveFunc();
        }
}
var onloadbodayColSwOn=false;
var lastColx1=3;
function columnSwitch(addCol){
	if(!onloadbodayColSwOn){
		onloadbodayColSwOn=true;
		$("body").bind("OnLoadDone",function(){
		    //alert(lastColx1);
			var lastCol=lastColx1;
			lastColx1=3;
			var dif=lastCol-lastColx1;
			//alert(lastCol+" 1 "+lastColx1);
			for(var i=0;i < dif;i++){
				columnSwitch(1);
			}
		});
	}
	var headers=$("#mainTBX1 table .headerRow th");
	var headersLen=headers.size();
	var visCol=lastColx1+addCol+1;
	//alert(HideCol+" "+visCol);
	if(visCol>3 && headersLen>=visCol){ 
		$("body.sf1 .Zstbl1 .apexp table.list>thead>tr>th:nth-child("+visCol+"), body.sf1 .Zstbl1 .apexp table.list>tbody>tr>td:nth-child("+visCol+"), body.sf1.Zstbl1 .apexp table.list>tfoot>tr>td:nth-child("+visCol+")").removeClass("columnHDMOB").addClass("columnVISMOB");
		//"+
		 //",body.sf1 .Zstbl1 .apexp table.list>thead>tr>th:nth-child("+(visCol+1)+"), body.sf1 .Zstbl1 .apexp table.list>tbody>tr>td:nth-child("+(visCol+1)+"), body.sf1.Zstbl1 .apexp table.list>tfoot>tr>td:nth-child("+(visCol+1)+")
		
		if(visCol+1<=headersLen){
			$("body.sf1 .Zstbl1 .apexp table.list>thead>tr>th:nth-child("+(visCol+1)+"), body.sf1 .Zstbl1 .apexp table.list>tbody>tr>td:nth-child("+(visCol+1)+"), body.sf1 .Zstbl1 .apexp table.list>tfoot>tr>td:nth-child("+(visCol+1)+")").removeClass("columnHDMOB").addClass("columnVISMOB");
		}
		if(3<visCol-1){
			$("body.sf1 .Zstbl1 .apexp table.list>thead>tr>th:nth-child("+(visCol-1)+"), body.sf1 .Zstbl1 .apexp table.list>tbody>tr>td:nth-child("+(visCol-1)+"), body.sf1 .Zstbl1 .apexp table.list>tfoot>tr>td:nth-child("+(visCol-1)+")").addClass("columnHDMOB").removeClass("columnVISMOB");
		}
		if(headersLen>=visCol+1){
			$("body.sf1 .Zstbl1 .apexp table.list>thead>tr>th:nth-child("+(visCol+1)+"), body.sf1 .Zstbl1 .apexp table.list>tbody>tr>td:nth-child("+(visCol+1)+"), body.sf1 .Zstbl1 .apexp table.list>tooft>tr>td:nth-child("+(visCol+1)+")").addClass("columnHDMOB").removeClass("columnVISMOB");
		}
	
		lastColx1+=addCol;
	}
	$("#columnScrollW1 .l").fadeTo("fast",(visCol>4?1.0:0.5));
	$("#columnScrollW1 .r").fadeTo("fast",(headersLen>=visCol+1?1.0:0.5));
	setTimeout(function(){closeAllTooltips();},2500);
}


function openMassCreate(configName,fieldAPI,windowTitle,selectRowRequired,clearTabCache,params){
	var checked1=$(".lcbX input:checked"); 
	if(selectRowRequired!=null && selectRowRequired==1 && checked1.size()==0){
		alert("Please select at least one row");
	}else{
		var ids=""; 
		if(checked1.size()>0){
			checked1.each(function(){
			    ids+="~"+$(this).parents(".lcbX:first").attr("rid");
			});
			ids=ids.substring(1);
			
		}
		openGenWindow1("../apex/zaapit__masscreate?tp="+configName+"&fld="+fieldAPI+"&ids="+ids+"&isdtp=vw"+(params!=null?"&params="+escape(params):""),windowTitle,600,650,null,clearcheckBoxes);
		//openWindowZP("../apex/zaapit__masscreate?tp="+configName+"&fld="+fieldAPI+"ids="+ids+"&isdtp=vw",windowTitle);
	}
	fixIfmHegt();
	if(clearTabCache!=null){
		try{
		    if(window.self != window.top){
		          var currLOc=(self.location+'');
		          var postURl1='https://'+currLOc.split('.')[1]+'.salesforce.com';
		          try{
		            var cU1=(top.location+'');
		            postURl1=cU1.substring(0,cU1.indexOf('/',10));
		          }catch(e1){
		          //alert(e1); 
		          }
		        //alert(postURl1); 
		
		        if(hasSFDCURL){
		            postURl1=Salesforce_Full_URL;
		        }
		        if(parentLocParam1!=null && parentLocParam1!="" && parentLocParam1!="null"){
		            var t1=parentLocParam1;
		            if(t1.indexOf('/')>-1){
		                t1=t1.substring(0,t1.indexOf('/',10));
		            }
		            postURl1=t1;
		        }
				setTimeout("parent.postMessage('$(\"iframe[name=\\'"+clearTabCache+"\\']\").attr(\\'src\\',\\'about:blank\\').height(99);/*zaapit_tb_zbnx1*/','"+postURl1+"');",100);
			}
		}catch(e1){
			alert(e1);
		}
		
	}
}

function clearcheckBoxes(){
	$(".lcbXAll:checked").prop("checked","");
	$(".lcbX input:checked").prop("checked",""); 
}

/*********** zp lookup zintext*****************/

var lastOpenParamsZP=null;
function openWindowZP(url,windowTitle,onload1){
	if($("#ZPdialogSR").size()>0){
		$("#ZPdialogSR").remove();
	}
    if($("#ZPdialogSR").size()==0){
        $("body").append("<div id='ZPdialogSR' style='display:none;overflow:"+(isSF1()?"scroll":"none")+";'><div style='-webkit-overflow-scrolling:touch;'><iframe src='about:blank' width='100%' height='100%' name='ZPdialogSRIF' id='ZPdialogSRIF' frameborder='0' style='margin:0px;' "+(isSF1()?"scrolling='yes'":"")+" /></div></div>");
    }
    lastOpenParamsZP=[url,windowTitle];
    //$("html,body").height($(self).height());
    $("#padBut1").height(Math.max($("#padBut1").height(),($(self).height()-$(".Zstbl1WS").height())));
    
    var height1=$(self).height()-200;
    
    var width1=$(self).width()-100;
    $("#ZPdialogSRIF").height(height1-50);
    
    $("#ZPdialogSRIF").attr("src",url);
  
	if(onload1!=null)onload1();
    $( "#ZPdialogSR" ).dialog({
      height: height1,
      width: width1,
      title:windowTitle,
      modal: true
    });
	
}
function closeWindowZP(){
    lastOpenParamsZP=null;
    $( "#ZPdialogSR" ).dialog("close");
}


function fixContent1(){
	try{
	if($("#ZPdialogSRIF")[0].document==null){
		//alert("0");
		self.setTimeout(fixContent1,1000);
	}else{
		//alert("1");
	}
	}catch(e){
		//alert(e);
	}
}   
latInputLU1keyUpCount=0;
var latInputLU1=null; 
function openSearchLUDL(windowTitle,inputConnect,lnk1){
	latInputLU1Link=lnk1;
	latInputLU1=$(inputConnect).data('inp');
	$("#autoSearchLU").show();
	$("#autoSearchLU").unbind( "keyup", false )
	$("#autoSearchLU").keyup(function(){latInputLU1keyUpCount++; var latInputLU1keyUpCountT=latInputLU1keyUpCount;setTimeout(function(){if(latInputLU1keyUpCount==latInputLU1keyUpCountT)lookUpSearchx1();},250);});
	$("#autoSearchLU").val($(latInputLU1).val());
	$("#OptionResult").hide();
	
    var height1=$(window).height()/2;
    if(height1>800){
    	height1="800";
    }else if(height1<350){
    	height1="350";
    }
    var width1=$(window).width()-100;
    if(width1>500){
    	width1="500";
    }
	$("#ZPdialogLU").dialog({
	  position: { my: "center top", at: "center top"},
      height: height1,
      width: width1,
      title:windowTitle,
      modal: true
    });
    lookUpSearchx1();
} 
var latInputLU1Link=null; 
function lookUpSearchx1(){
	//alert($(latInputLU1).val());
	//latInputLU1Link=lnk1;
	var lnk1=latInputLU1Link.replace("LookupPage","LookupResultsFrame");
	if($.trim($("#autoSearchLU").val())==""){//show recent
		//lnk1=
		$("#searchResult").hide();
		$("#recentItems1").show();
	}else{
		$("#searchResult").show();
		$("#recentItems1").hide();
		lnk1=lnk1+"&lksrch="+escape($("#autoSearchLU").val())+"&go=+Go%21+&lkenhmd=SEARCH_NAME";
	}
	$("#itemRes1").html("Loading...");
	//$("#itemRes1").load(lnk1);
	$.ajax({
		url: lnk1,
		success: function(  data, textStatus,  jqXHR ){
			var resultHTML="";
			var tbData=(data+"");
			//alert(tbData);
			var f1=tbData.indexOf("class=\"list\"");
			var t1=tbData.indexOf("</table>",f1);
			if(f1>-1 ){
				tbData="<table"+tbData.substring(f1,t1+8);
				var i1=0;
				
				$(tbData+"").find("a.dataCell").each(function( ) {
					var txt=$(this).text();
					resultHTML+="<a href=\"javascript:void(0);\" onclick=\"lookUpSearchx1Sel(this)\" class=\"sel l"+(i1%2)+"\">"+txt+"</a>";
					i1++;
				});
				$("#itemRes1").html(resultHTML);
			}else{
			//alert(f1+"  "+t1);
			$("#itemRes1").html("<b style=\"color:red;\">Please enter a search string at least 2 characters long.</b><br>");//+(data+"")
			}
			
			
		}
		});
}
function lookUpSearchx1Sel(obj){
	disableNotice1=true;
	$(latInputLU1).val($(obj).text()).change();
	var mu_afchange=$(latInputLU1).attr("mu_afchange");
	if(mu_afchange!=null && mu_afchange!=""){
		mu_afchange=mu_afchange.replace(/\\'/ig,"'");
		$.globalEval("try{"+mu_afchange+"}catch(e1){}");
	}
	$("#ZPdialogLU").dialog("close");
	setTimeout(function(){disableNotice1=false;},500);
}




function openSearchLUDL2(windowTitle,inputConnect,lnk1){
	latInputLU1Link=lnk1;
	latInputLU1=$(inputConnect).data('inp');
	$("#autoSearchLU").hide();
	
	$("#OptionResult").show();
	$("#searchResult").hide();
	$("#recentItems1").hide();
		
    var height1=$(window).height()/2;
    if(height1>800){
    	height1="800";
    }
    var width1=$(window).width()-100;
    if(width1>500){
    	width1="500";
    }
	$("#ZPdialogLU").dialog({
	  position: { my: "center top", at: "center top"},
      height: height1,
      width: width1,
      title:windowTitle,
      modal: true
    });
    lookUpSearchx2();
} 

function lookUpSearchx2(){
	//alert($(latInputLU1).val());
	//latInputLU1Link=lnk1;
	var lnk1=latInputLU1Link;
	lnk1=lnk1.replace(/:/ig,"_");
	var resultHTML="";
	try{
	$.globalEval("globalLInkTrans2=cb_"+lnk1+";");
	var arr1=globalLInkTrans2;
	if(arr1!=null && arr1.length>0){
		for(var x1=0;x1<arr1.length;x1++){
			resultHTML+="<a href=\"javascript:void(0);\" onclick=\"lookUpSearchx1Sel(this)\" class=\"sel l"+(x1%2)+"\">"+arr1[x1]+"</a>";
		}
		$("#itemRes1").html(resultHTML);
	}else{
		$("#itemRes1").html("<b style=\"color:red;\">Data Not Found.</b><br>");
	}
	}catch(e){
		$("#itemRes1").html("<b style=\"color:red;\">Data Not Found.</b><br>");
	}
}


function isIERLModeLUOV(){
	var t1=false;
	try{
		
        t1=!disableLUOv&& isInIframe();
        t1=t1&navigator.userAgent.indexOf("Chrome")==-1 && navigator.userAgent.indexOf("Safari")==-1 && navigator.userAgent.indexOf("Firefox")==-1;
    }catch(e1){}
	return t1;
}

var disableLUOv=false;
var globalLInkTrans1="";
var globalLInkTrans2="";
function readyFixLKPX(){

if(isIERLModeLUOV() || isSF1()){
try{
$( window ).on( "orientationchange", function( event ) {
//$( "#orientation" ).text( "This device is in " + event.orientation + " mode!" );
    //var t1=lastOpenParamsZP;
    //closeWindowZP();
    //openWindowZP(t1[0],t1[1]);
    if(lastOpenParamsZP!=null){
        var height1=$(window).height()-200;
        
        var width1=$(window).width()-100;
        $("#ZPdialogSRIF").height(height1-50);
        $( "#ZPdialogSR" ).dialog({height: height1, width: width1});
    }
	
	if($("#ZPdialogLU").size()>0){
		var height1=$(window).height()/2;
		if(height1>800){
			height1="800";
		}
		if(height1<300){
			height1="800";
		}
		var width1=$(window).width()-100;
		if(width1>500){
			width1="500";
		}
		$("#ZPdialogLU").dialog({height: height1, width: width1});
    }
});
}catch(e1){}

//top.window.opener=window;
		
		if($("#ZPdialogLU").size()==0){
			$("body").append("<div id=\"ZPdialogLU\" style=\"display:none;overflow:"+(isSF1()?"scroll":"none")+";\"><style>#ZPdialogLU .sel{width:100%;display:block;padding:5px;}#ZPdialogLU .sel.l1{background:#efefef;} #recentItems1{background:#e5e5e5;font-weight:bold;margin-top:5px;padding:5px;}#OptionResult,#searchResult{background:#e5e5e5;font-weight:bold;padding:5px;margin-top:5px;}.searchCLR1{display:none;z-index:1500;right:10px;}</style><div ><input type=\"search\" id=\"autoSearchLU\" autocorrect=\"off\" name=\"autoSearchLU\" style=\"width:100%;-webkit-appearance:searchfield;-webkit-appearance:searchfield;\"><span class=\"searchCLR1\" onclick=\"$(\\\"#autoSearchLU\\\").val(\\\"#autoSearchLU\\\").focus();\"></span></div><div id=\"searchResult\" style=\"display:none;\">Search Results</div><div id=\"OptionResult\" style=\"display:none;\">Options</div><div id=\"recentItems1\">Recent Items</div><div id=\"itemRes1\"></div> </div>");
		}

	$(".lookupIcon").each(function(){
		try{
		var firstA=$(this).parents("a:first");
		var h1=firstA.attr("href"); 
		h1=$.trim(unescape(h1));
		//alert(h1);
		if(h1.length>25 && h1.indexOf("javascript: openLookup(")>-1){ 
			var lnk=h1.substring(23,h1.length-1);
			$.globalEval("globalLInkTrans1="+lnk+";");
			var lnk1=globalLInkTrans1;//.replace("LookupPage","LookupResultsFrame");
			//latInputLU1Link=lnk1;
			//var newOnclick="openWindowZP('"+lnk1+"','"+firstA.attr("title").replace("(New Window)","")+"');return false;";
			var inp1=firstA.parents(".lookupInput:first").find("input:first");
			var newOnclick="openSearchLUDL('"+(firstA.attr("title").replace("(New Window)",""))+"',this,'"+lnk1+"');return false;";
			
			
			//alert(globalLInkTrans1);
			firstA.attr("href","javascript:void(0);");
			firstA.data("inp",inp1);
			
			firstA.attr("onclick",newOnclick);
			
			inp1.data("inp",inp1);
			
			
			//firstA.remove();
			
			inp1.attr("onclick",newOnclick);

		}
	}catch(e){
	//alert(e);
	}
	});
	
	
	
	$("a>.comboboxIcon").each(function(){
		try{
		var firstA=$(this).parents("a:first");
		var h1=firstA.attr("href"); 
		h1=$.trim(unescape(h1));
		//alert(h1);
		if(h1.length>27 && h1.indexOf("javascript:openPopupFocus(")>-1){ 
			var lnk=h1.substring(27,h1.length-1);
			lnk=lnk.substring(0,lnk.indexOf("'"));
			$.globalEval("globalLInkTrans2='"+lnk+"';");
			var lnk1=globalLInkTrans1;
			lnk1=(firstA.attr("id")==null  || firstA.attr("id")==""?firstA.attr("name"):firstA.attr("id"))
			var inp1=firstA.parents("td:first").find("input:first");
			var newOnclick="openSearchLUDL2('"+($(this).attr("title").replace("(New Window)",""))+"',this,'"+lnk1+"');return false;";
			
			
			//alert(globalLInkTrans1);
			firstA.attr("href","javascript:void(0);");
			firstA.data("inp",inp1);
			firstA.attr("onclick",newOnclick);
			
			inp1.data("inp",inp1);
			
			inp1.attr("onclick",newOnclick);

		}
	}catch(e){
	alert(e);
	}
	});
	
	
	}
	
}

/*********** zp lookup zintext*****************/


var lastIDClicked=null;
var lastFieldClicked=null;
var massInlineERowClick=false;
function inlineEdiZP(obj,e){
	//
	//alert(noticeUnsaveCancelWork());
	if(NOT_hideEditButton=="true"){
	
		if(e!=null && e.target!=null){
			try{
				var o1=$(e.target);
				//alert(e.target.tagName);
				var td=(e.target.tagName.toLowerCase()=="td"?$(e.target):o1.parents("td:first"))
				lastFieldClicked=td.attr("fld");
				lastIDClicked=$(obj).find(".lcbX:first").attr("rid");
				//alert(lastFieldClicked+" "+lastIDClicked);	
				
				disableTextSel1();
        
			}catch(e){
			//alert(e);
			}
		}
		
		loadingSH();filpEditModeJS();
	}
	
	/*
	massInlineERowClick=true;
	if(noticeUnsaveCancelWork()){
	
	
	
		$(".lcbX input:checked").prop("checked","");

		var markedTR=$("#mainTBX1 tr.markedRowTA");//edit mode
		if(markedTR.size()>0){
			markedTR.removeClass("markedRowTA");
		}
		var tr1=$(obj).addClass("markedRowTA");//.parents("tr:first")
		tr1.find(".lcbX input").click();
		
		openMassUpdate("3");
	}
	*/
}

function disableTextSel1(){
			if (window.getSelection)
		        window.getSelection().removeAllRanges();
		    else if (document.selection)
		        document.selection.empty()
}

    var allCheckedMassUpdate=false;
    var openMassUpdate_lastopMode=null;
    
  function openMassUpdate(opMode){
  	trackEventX('openMassUpdate');
   	openMassUpdate_lastopMode=opMode;
    var massDups=(opMode!=null && opMode=="2");
    var massInlineERow=(opMode!=null && opMode=="3");
    
   if($(".lcbX input:checked").size()==0 ){
            cbAll($("input.lcbXAll").prop("checked","checked")[0]);
            allCheckedMassUpdate=true;
            /*if(confirm("No rows were selected, do you want to use them all?")){
                
            }else{
                return;
            }*/
        }
        
        //alert($( "#massUpdate" ).height());
        var massUpdateHeight=$( "#massUpdate" ).height()+50;
        if(massUpdateHeight<100){
            massUpdateHeight=massUpdateFieldToUpdate_size*26+300;
        }

        //alert($(self).height()+" "+$(window).height()+" "+$( "#massUpdate" ).height()+ "+++"+massUpdateHeight);
        lastHeightBodyMU=$("html,body").height();
         if($("html,body").height()<massUpdateHeight){
              //$("html,body").height(massUpdateHeight);
              $("#padBut1").height(Math.max($("#padBut1").height(),massUpdateHeight-$("html,body").height()));
                        //fixIfmHegt();
         }
        
        if(massUpdateHeight>$(self).height()){
            lastHeightBMU=$(self).height();
            //$(self).height(massUpdateHeight); 
            $("#padBut1").height(Math.max($("#padBut1").height(),massUpdateHeight-$(self).height()));
            //fixIfmHegt();
        }
        var scrollTopx=$(self).scrollTop();
        var top1=scrollTopx +($(self).height()-massUpdateHeight)/2;
        var chartst=$("#topGraphs").position().top+$("#topGraphs").height();
        if(chartst!=null  && top1<chartst){
        	top1=chartst+50;
        }
        if(top1<0 || top1 < scrollTopx+(scrollTopx>0?75:0)){
            top1=scrollTopx+(scrollTopx>0?75:0);
        }
        var left1= getCUrrScollLeft()+($(self).width()-$( "#massUpdate" ).width())/2;
        if(left1<0){
            left1=0;
        }
        
        if(massDups){
            
            $(".massUp1").hide();
            $(".massEdit1").hide();
            $(".massDup1").show();
            
        }else if(massInlineERow){
        	 $(".massDup1").hide();
            $(".massUp1").hide();
            $(".massEdit1").show();
        }else{
            $(".massDup1").hide();
            $(".massEdit1").hide();
            $(".massUp1").show();
        }
        
        $( "#massUpdate" ).css({top:top1+"px",left:left1+"px"});
        $( "#massUpdate" ).show();
        
        fixIfmHegt();
        

        // $( "#massUpdate")[0].scrollIntoView(true);
    $( "#massUpdate .dateFormat a" ).each(function(){
        if($(this).attr("href")!=null && $(this).attr("href").indexOf("DatePicker.")>=0){
        //  $(this).attr("onfocus","");
        //  $(this).css("width","auto");
        $(this).click(function(){
            $(this).parents("tr:first").find("input[type=text]").click();;//datepicker
            });
        }
    });
    
   
    }
              
function isOneMUOptSelected(){
    var res1=$(".CBMU1:checked").size()>0;
    if(!res1){
        alert("Please select at least one field to update.");
    }
    return res1;
}

function btnMassUodate(update,hideAlert){

    var res1=isOneMUOptSelected();
    if(res1){
    	var checkedLength=$(".lcbX input:checked").length;
    		if(licenseStatus!='Active' && checkedLength>50){ 
				alert("During the free trial the mass-update options are limited to 50 rows per shot.\n\nUse our website http://www.zaapit.com/page/pricing or contact sales@zaapit.com to activate your license!"); 
				return; 
			} 
            if(!update || (hideAlert!=null && checkedLength==1 )|| confirm("Are you sure you want to update "+checkedLength+" selected row(s)?")){
        	if(hideAlert==null){
        		lastMassFunctionBtnCall='openMassUpdate()';
        	}else if(hideAlert!=null && checkedLength==1 && update ){//in edit row mode
            	lastMassFunctionBtnCall='inlineEdiZP($(".lcbX input:checked").parents("tr:first"))';
            }
            
            loadingSH();
            if(update){
                massUpdateRowsNSave(update);
            }else{
                massUpdateRows(update);
            }
            $("#massUpdate").hide();
            mucloseFix();
        }
    }
    return res1;
}

function btnMassDuplicate(shallow,obj){
    lastMassFunctionBtnCall='openMassUpdate(2)';

    var res1=true;//isOneMUOptSelected();
    if(res1){
        if(confirm("Are you sure you want to duplicate "+$(".lcbX input:checked").length+" selected row(s)?")){
         
             if(obj!=null){
                $(obj).tooltip('close');
            }   
            loadingSH();
            if(shallow){
                massDuplicateRows();
            }else{
                massDuplicateRowsRegular();
            }
            $("#massUpdate").hide();
            mucloseFix();
        }else{
             if(obj!=null){
                $(obj).tooltip('close');
            }
        }
        
    }
    return res1;
}


function searchChanged(milisWait){
        isSearchFocus1=true;
        searchTBX1(milisWait);
}

function revertOldValsMU(){
	    	$("#massUpdatein1 .muf1 input[oldVal],#massUpdatein1 .muf1 select[oldVal],#massUpdatein1 .muf1 textarea[oldVal]").each(function(){
	    				var oldVal=$(this).attr("oldVal");
	    				if(this.tagName.toLowerCase()=="input" && $(this).attr("type").toLowerCase()=="checkbox"){
	    					$(this).prop("checked",oldVal);
	    				}else{
	    					$(this).val(oldVal);
	    				}
                 		
                 		$(this).removeAttr("oldVal");
                 	});
}
   function massUpdateAllRows(){
   
  	 if(licenseStatus!='Active' && totalCountAjx>50){ 
				alert("During the free trial the mass-update options are limited to 50 rows per shot.\n\nUse our website http://www.zaapit.com/page/pricing or contact sales@zaapit.com to activate your license!"); 
				return; 
		} 
			
   		markCheckedRows=false;
     	//lastMassFunctionBtnCall='openMassUpdate()';
        var res1=isOneMUOptSelected();
        if(massUpdateProgTextsArr==null){
			massUpdateProgTextsArr=massUpdateProgTexts.split("#");
		}else if(totalCountAjx<=0){
         	alert(mass_update_0_rows);
         }
        				//Are you sure you want to update all the rows
         if(totalCountAjx>0 && res1 && confirm(massUpdateProgTextsArr[6]+" ("+totRowsForFOUNDONQ+")?")){
			 clearcheckBoxes();
             loadingSH();
             $("#massUpdate").hide();
             mucloseFix();
             openAllMassUpdate();
         }
     }
     function closeMassupdate(){
	     if(allCheckedMassUpdate){cbAll($('input.lcbXAll').prop('checked','')[0]); allCheckedMassUpdate=false;}
	     $('#massUpdate').hide();
	     if($("#massUpdatein1").find(".errorMsg:first").size()>0){//remove validations error
	        $("#massUpdatein1").find("input[type='text']").val("");
	     }
	     revertOldValsMU();
	     
	     mucloseFix();
	     fixIfmHegt();
	     var markedTR=$("#mainTBX1 tr.markedRowTA");//edit mode
	     if(markedTR.size()>0){
	         markedTR.find(".lcbX input:checked").prop("checked","");
	         markedTR.removeClass("markedRowTA",1500,function(){});
	     }
     }
     function mucloseFix(){
	     if(lastHeightBMU!=null){
	        //$(self).height(lastHeightBMU);
	        //$("html,body").height(lastHeightBodyMU);
	         $("#padBut1").height(0);
	        lastHeightBMU=null;
	        lastHeightBodyMU=null;
	     }
     }
     var handelAdds1count=0;
  function handelAdds1(html1){//charts are us
  	if( !isSF1()){
  		handelAdds1count++;
  		var currhandelAdds1count=handelAdds1count;
  		//google-visualization-tooltip
			var tooltipOrig=html1.replace("  ","<br/>");//$(this).html();
			var markedSection=null;
			var i1=0;
			$(".graphs svg>g path[stroke-width='6.5']").each(function(){
				if( markedSection==null){
					markedSection=this;
				}
				i1++;
			});
			if( markedSection==null){
				markedSection=$(".graphs svg>g ellipse[stroke-width='1']");
			}
			
			if($(markedSection).size()>0 ){
			
				
				var path1=$(markedSection);//$(markedSection).find("path:last");
				var d1=(path1.attr("d")+"").split(/[a-z\,\ ]+/ig);
				//alert(d1+"\n"+(path1.attr("d")+""));
				var my1='bottom',at1='top';
				if(Number(d1[2])<Number(d1[4])){//bottom
					my1="top";
					at1="bottom";
				}
				my1="center";
					at1="center";
				//alert(Number(d1[3])+" "+(Number(d1[8])-Number(d1[3]))+" "+path1.attr("d"));
				if(Number(d1[3])>Number(d1[8])-Number(d1[3])){//right side
					my1="right "+my1;
					at1="left "+at1;
				}else{
					my1="left "+my1;
					at1="right "+at1;
				}
				path1.qtip({
				    content: {
				        text: tooltipOrig,
				        button:true
				    },
				    show: {
				        ready: true,
				        solo: $(".Zstbl1WS"),
				        delay: 100
				        //event: 'mouseenter mouseover'
				    },
				    style: {
				        classes: 'qtip-light qtip-shadow qtip-rounded qtip-brd-gry',   
				         tip: {
				            corner: true,
				            width: 15,
				            height:15
				        }
				    },
				    position: {
				        viewport: $(self),//$(self),
				        container:$(".mZPForm1"),
				       my: my1,
	        		   at: at1,
				      
				    },
				    hide: {
				        fixed: true,
				        delay: 100,
				        event: (!isSF1()?'click ':'')+'mouseleave'
				    },
				    events:{
				       show:function(event, api){
				       	if(currhandelAdds1count!=handelAdds1count || path1.parents(".graphs:first").size()==0){
				       		 event.preventDefault();
				       	}
				       }
				    }
				       
				    
				});
			}
  	}
  }               
function tooltipFix(){
if( !isSF1()){


$( "body" ).delegate(".btt1[alnk]", "mouseover", function() {
 
		closeOctrF1O();
        $(".lookupHoverDetail:visible").hide();
        var result="";
        var alnk=$(this).attr("alnk");
        var afld=$(this).attr("afld");
        var objk=$(this).attr("objk");
        var href=$(this).attr("href");
        var textFld=$(this).text();
        if(textFld==null){
        	textFld="";
        }
        if(alnk==null || alnk==undefined){
            alnk="";
        } 

        if(afld=="href" && href!=null && href!="" &&( (href.indexOf("/")>-1 && href.indexOf("http")==0) || href.indexOf("javascript:srcUp(")==0)){
            var href1=href;
            if(href1.indexOf("javascript:srcUp(")>-1){
                    var h2=href1;
                    h2=unescape(h2);
                    h2=h2.split("'")[1];
                    if(h2.indexOf("?isdtp=vw")>-1){
                        h2=h2.substring(0,h2.indexOf("?isdtp=vw"));
                    }
                    if(h2.indexOf("?isdtp=p1")>-1){
                        h2=h2.substring(0,h2.indexOf("?isdtp=p1"));
                    }
                    //alert(href1);
                    href1=h2;
                    
                    $(this).attr("href",href1);
					$(this).attr("onclick",href);
            }
            afld=href1.substring(href1.indexOf("/",9)+1);
            //alert(afld);
        }
        if(alnk.indexOf("{0}")>-1){
            alnk=alnk.replace(/\{0\}/ig,afld);//replace all params
        }
        if(alnk!=null && alnk!=undefined && alnk!="" && alnk.indexOf("retURL")==-1 && alnk.indexOf("?")>-1){
            alnk=alnk+"&retURL="+escape((window.location+''));
            //alert(alnk);
        }
        //alnk=alnk.replace(/&amp;/ig,'&');
        //alert(alnk);
        var id1=$(this).attr("id");
        if(id1=='' || id1==undefined){
            id1='bbt1X'+curBbt1ID;
            curBbt1ID++;
            $(this).attr("id",id1);
        }
        if(this==LastOpenToolTipObj){
            return $("#"+id1+"D").parent().html();
        }
        try{
          //$(".ui-tooltip:visible").hide();
        }catch(e){}
        LastOpenToolTipObj=this;
        var title=$(this).attr("title");
        //alert(alnk+ " "+ objk);
        if( alnk!='' && alnk!='undefined' && objk=='1'  && alnk!=undefined){
            
            //result="<div id='"+id1+"D' class='bbt1XD' ><div class='bbt1Loading'><"+"script"+">$('.bbt1XD:visible').load('"+alnk+"',fixIfmHegt);<"+"/script"+"></div></div>";
            openQtip1Ajax(this,alnk);
        }else if( alnk!='' && alnk!='undefined' && objk=='0' && alnk!=undefined){
           result="<div id='"+id1+"D' class='bbt1XD'><div class='ir'><img width='280' src='"+alnk+"' onload='$(\".bbt1Loading:visible\").hide();' alt='"+Preview_not_Available+"'/></div><div class='h'><a href='"+alnk+"' target='_blank' class='btn'>"+View_Download+"</a></div></div>";
            setTimeout("$(\".bbt1Loading:visible\").hide();",2000);
            //result="<div id='"+id1+"D' class='bbt1XD'><div class='bbt1Loading'></div><object width='300' data='"+alnk+"' standby='Loading...' onload='$(\".bbt1Loading:visible\").hide();'> <div class='fnspt1'>Preview not Available</div><"+"script"+">setTimeout(\"$('#"+id1+"D').find('.bbt1Loading:first').hide()\",500);<"+"/"+"script"+"></object>";
            openQtip1(this,result);
        }else{
            result=title;
            openQtip1(this,result);
        }


});

/*
$(document).tooltip({ 
   position: { my: "left top", at: "right bottom", collision: "none"},//flipfit
   items:".btt1[alnk]",
    content: function() {
    	closeOctrF1O();
        $(".lookupHoverDetail:visible").hide();
        var result="";
        var alnk=$(this).attr("alnk");
        var afld=$(this).attr("afld");
        var objk=$(this).attr("objk");
        var href=$(this).attr("href");
        var textFld=$(this).text();
        if(textFld==null){
        	textFld="";
        }
        if(alnk==null || alnk==undefined){
            alnk="";
        } 

        if(afld=="href" && href!=null && href!="" &&( (href.indexOf("/")>-1 && href.indexOf("http")==0) || href.indexOf("javascript:srcUp(")==0)){
            var href1=href;
            if(href1.indexOf("javascript:srcUp(")>-1){
                    var h2=href1;
                    h2=unescape(h2);
                    h2=h2.split("'")[1];
                    if(h2.indexOf("?isdtp=vw")>-1){
                        h2=h2.substring(0,h2.indexOf("?isdtp=vw"));
                    }
                    //alert(href1);
                    href1=h2;
            }
            afld=href1.substring(href1.indexOf("/",9)+1);
            //alert(afld);
        }
        if(alnk.indexOf("{0}")>-1){
            alnk=alnk.replace(/\{0\}/ig,afld);//replace all params
        }
        if(alnk!=null && alnk!=undefined && alnk!="" && alnk.indexOf("retURL")==-1 && alnk.indexOf("?")>-1){
            alnk=alnk+"&retURL="+escape((window.location+''));
            //alert(alnk);
        }
        //alnk=alnk.replace(/&amp;/ig,'&');
        //alert(alnk);
        var id1=$(this).attr("id");
        if(id1=='' || id1==undefined){
            id1='bbt1X'+curBbt1ID;
            curBbt1ID++;
            $(this).attr("id",id1);
        }
        if(this==LastOpenToolTipObj){
            return $("#"+id1+"D").parent().html();
        }
        try{
          $(".ui-tooltip:visible").hide();
        }catch(e){}
        LastOpenToolTipObj=this;
        var title=$(this).attr("title");
        //alert(alnk+ " "+ objk);
        if( alnk!='' && alnk!='undefined' && objk=='1'  && alnk!=undefined){
            
            result="<div id='"+id1+"D' class='bbt1XD' ><div class='bbt1Loading'><"+"script"+">$('.bbt1XD:visible').load('"+alnk+"',fixIfmHegt);<"+"/script"+"></div></div>";
        }else if( alnk!='' && alnk!='undefined' && objk=='0' && alnk!=undefined){
           result="<div id='"+id1+"D' class='bbt1XD'><div class='ir'><img width='280' src='"+alnk+"' onload='$(\".bbt1Loading:visible\").hide();' alt='"+Preview_not_Available+"'/></div><div class='h'><a href='"+alnk+"' target='_blank' class='btn'>"+View_Download+"</a></div></div>";
            setTimeout("$(\".bbt1Loading:visible\").hide();",2000);
            //result="<div id='"+id1+"D' class='bbt1XD'><div class='bbt1Loading'></div><object width='300' data='"+alnk+"' standby='Loading...' onload='$(\".bbt1Loading:visible\").hide();'> <div class='fnspt1'>Preview not Available</div><"+"script"+">setTimeout(\"$('#"+id1+"D').find('.bbt1Loading:first').hide()\",500);<"+"/"+"script"+"></object>";
        }else{
            result=title;
        }
        //alert(result);
        
        return result;
    },
    tooltipClass: "alnk-tooltip-styling",
    hide: { effect: "fadeOut",delay:3000, duration: 300 }
    ,open:function(event, ui){
        fixIfmHegt();
    }
    ,close:function(event, ui){
        fixIfmHegt();
    }
   });
   
   */
   }
}                 


function saveView(){
if(!noticeUnsave()){return false;}else{
    if($.trim($(".curSelectedView").val())==""){
        openSaveView();
    }else{
        loadingSH();
        saveViewAF($(".curSelectedView").val(),$(".curSelectedView option:selected").text()); 
    }
    }
}

function openSaveView(){
if(!noticeUnsave()){return false;}else{
    
    $("#newViewForm").dialog({
     //    height: (maxHieghtIframe-40),
     //   width: 750,
         modal: openDialogAsMod()
		//,appendTo: ".mZPForm1"
         ,close: function( event, ui ) {
           
            if(lastBodyHeight!=null){
                   //$("html,body").height(lastBodyHeight);
                    $("#padBut1").height(0);
                   fixIfmHegt();
            }
         },
    buttons: [{
    text:Save_File_button,
   click: function() {
        loadingSH();
        saveViewAF('',$("#newViewName:visible").val());
        //$("#topSaved1").show();
        //setTimeout('$("#topSaved1").hide(500);',1500);
        $( this ).dialog( "close" );
        $("#newViewForm").dialog("destroy");
        $(".searchSelMainOut").remove();
    }},
    {text:Cancel_button,
    click: function() {
        $( this ).dialog( "close" );
        $("#newViewForm").dialog("destroy");
    }
    }]
                                      });
                                      
        }                              
}
function deleteView(){
if(!noticeUnsave()){return false;}else{

if(confirm(Delete_this_view)){
    loadingSH();
    deleteView1x($(".curSelectedView").val());
}
}
}
function showEditAlert1(){
$(".EditAlert1").show();
setTimeout(function(){$(".EditAlert1").hide(1000);},15000);
//$("#save1").css({background:"yellow"});
}

function showSaveAlert(){
$(".SaveAlert1").show().fadeIn();
setTimeout(function(){$(".SaveAlert1").fadeOut();},5500);
$("#save1").css({background:"yellow"});
}


function copyValuesX1(){
	try{
	var checked1=$(".lcbX input:checked"); 
	if(!isEditMode1){ 
	alert("Please switch to edit mode before using this button"); 
	}else if(checked1.size()==0){ 
	alert("Please select at least one row"); 
	}else{ 
	var ix1=1; 
	if($(".topCNum").size()==0){ 
	$("th.thw").each(function(){ 
	if(ix1>0){ 
	$(this).append("<div style='position:relative;' class='topCNum'><div style='position:absolute;top:-50px;border:1px solid #333333;background:#efefef;padding:5px;'>"+ix1+"</div></div>"); 
	} 
	ix1++; 
	}); 
	}else{ 
	$(".topCNum").show(); 
	} 
	var col2= prompt("Copy Column #:", 2); 
	if(col2!=null){ 
	var col1= prompt("Copy Column #"+col2+" into column #:", 1); 
	col1=new Number(col1)+2; 
	col2=new Number(col2)+2; 
	//alert(col1); 
	$(".lcbX input:checked").each(function(){ 
	var firstTr=$(this).parents("tr:first"); 
	var cVal=""; 
	var cFrom=firstTr.find("td:nth-child("+col2+")").find("input:visible, textarea:visible, select:visible"); 
	if(cFrom.size()==0){ 
	cVal=firstTr.find("td:nth-child("+col2+")").text();
	 //alert(cVal+"_1");
	}else{ 
	cVal=cFrom.val(); 
	//alert(cVal+"_2");
	} 
	firstTr.find("td:nth-child("+col1+")").find("input:visible ,textarea:visible, select:visible").val(cVal).focus().click(); 
	
	//alert(cVal); 
	}); 
	} 
	} 
	}catch(e){}
	$(".topCNum").hide();
}
  
//var massUpdateProgTexts="Starting Mass Update...#Stop#Stopping...#Current Progress: #Complete!#Close#Are you sure you want to update all the rows";
var massUpdateProgTextsArr=null;
var openAllMassUpdateLastID='';
 var progressbarMU = null,
      progressLabel = null;
var stopMassUpdateAll=false;
var stopMassUpdateAllError=false; 
     
function openAllMassUpdate(){ 
	progressbarMU=null;
	progressLabel=null;
	openAllMassUpdateLastID='';
	lastBtachSizeDone=0;
	stopMassUpdateAll=false;
	stopMassUpdateAllError=false;
	$("#massUpdateAllDialog").remove();											//Starting Mass Update...
	$("body").append("<div id='massUpdateAllDialog'><div class='progress-label'>"+massUpdateProgTextsArr[0]+"</div><div id='progressbarMU' style='margin-top:15px;'></div></div>");
	progressLabel = $( ".progress-label" );
	progressbarMU = $( "#progressbarMU" );
	var massUpdateAllDialog=$("#massUpdateAllDialog").dialog({
            resizable: true,
            //height:500,
            width:(isSF1()?($(self).width()-20):500),
            modal: openDialogAsMod(),
            title: Mass_Update_all_items,
            buttons: [{
            text:massUpdateProgTextsArr[1], //stop
            click: function() {
               stopMassUpdateAll=true;
                massUpdateAllDialog.dialog( {"buttons":[{
			          text: massUpdateProgTextsArr[2], //Stopping...#
			          click: function(){
			          //$( this ).dialog( "close" );
			          }
			        }]});
            }}]
            ,
            open: function() {
         		 //progressTimer = setTimeout( progress, 2000 );
         		 progressbarMU.progressbar({
			      value: false,
			      max:totalCountAjx,
			      change: function() {
			      	var val1=progressbarMU.progressbar( "value" );
			      	if(val1==null){val1=0;}
			      						//"Current Progress: " 
			        progressLabel.html( massUpdateProgTextsArr[3] + Math.round((val1/totalCountAjx)*100.0) + "% ("+val1+" / "+totalCountAjx+")" );
			      },
			      complete: function() {
			        progressLabel.text( massUpdateProgTextsArr[4] );//"Complete!"
			        stopMassUpdateAll=true;
			        changeMUBtns();
			        //$(".ui-dialog button:visible").last().focus();
			        lastMassFunctionBtnCall=null;
			        
                     searchChanged(1);
			      }
			    });
 				if(!stopMassUpdateAll)doAllMassUpdate();
       		},
             close: function( event, ui ) {
             	$( this ).dialog( "close" );
             }
            });
            
}
function changeMUBtns(){
	$("#massUpdateAllDialog").dialog( {"buttons":[{
			          text: massUpdateProgTextsArr[5], //"Close"
			          click: function(){
			          $( this ).dialog( "close" );
			          } 
			        }]});
}
var msgMassUpdateAllRows="";
var messageCell="";;
var lastBtachSizeDone=0;
function doAllMassUpdate(done){

	msgMassUpdateAllRows=$.trim($(".msgMassUpdateAllRowsID").html());
	//alert($(".messageCell").size() + " "+done);
	messageCell=($(".messageCell").size()>0?$.trim($(".messageCell").text()):"");
	if(done!=null){
		if((msgMassUpdateAllRows!=null && msgMassUpdateAllRows!="") || (messageCell!=null && messageCell!="")){
			//alert(messageCell);
			if(messageCell!=null ){
				//alert(messageCell);
				$("#massUpdateAllDialog").remove();
				fixOnload();
				openMassUpdate();
				stopMassUpdateAllError=true;
				
			}else{
				//fixMultiDependancefield();
				alert(msgMassUpdateAllRows);
			}
			
		}else{
		
			//stopMassUpdateAll=true;
			var val = progressbarMU.progressbar( "value" );
			if(val==null || val==false){
				val=0;
			}
			//alert(val+" "+lastBtachSizeDone+" "+totalCountAjx);
 			progressbarMU.progressbar( "value", (val + lastBtachSizeDone) );
 			if((val + lastBtachSizeDone) >= totalCountAjx){
 				stopMassUpdateAll=true;
 				//alert(1);
 			}
 			
 		}
	}
	if(stopMassUpdateAllError){
		return;
	}
	if(stopMassUpdateAll){
		changeMUBtns();
		//massUpdateAllDialog.dialog("close"); 
		 searchChanged(1);
		return;
	}
	lastBtachSizeDone=0;
	//alert("openAllMassUpdateLastID: "+openAllMassUpdateLastID);
	Visualforce.remoting.Manager.invokeAction(
                remotequeryAjax2GetIDS,
                DBsubQery,
                openAllMassUpdateLastID, 
                200, 
                function(result, event){
                	//alert(event.type+"\n "+event.status +" \n"+result+"\n");
                    if (event.status && result!=null) {
    					if(result!=null && result.length>0 && !stopMassUpdateAll){
                        	openAllMassUpdateLastID=result[result.length-1];
                        	var toUpdate=result.join(";");
                        	//alert((result+'').length+' ' +openAllMassUpdateLastID);
                        	lastBtachSizeDone=result.length;
                        	
 							massUpdateALLRowsAF(toUpdate);//doAllMassUpdate('1'); 
                        }else{
                        	//lastBtachSizeDone=0;
                        	//openAllMassUpdateLastID='';
                        	//doAllMassUpdate('1');
                        	if(stopMassUpdateAll){
                        		changeMUBtns();
                        	}
                        }
                    
                     } else if (event.type === 'exception') {
                        if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){
                            self.location=self.location;
                        }else if(event.message!=null && (event.message+"").indexOf("Unable to connect")==-1){
                            if($("body:visible").size()>0)alert("An error has occurred: "+event.message);
                        }
                    } else {
                        //self.location=self.location;
                        // $("#"+filterIdSpan+" .availVals").html("");
                        //lastMassFunctionBtnCall=null;
                        	//searchChanged(1);
                    }
                }, 
                {escape: true,buffer:true,timeout: 90000}
            );
            
}
function closeAllTooltips(){
	//$(".ui-tooltip:visible").hide();
	//if(lastQtip1!=null){
	//	lastQtip1.qtip("hide");
	//	lastQtip1=null;
	//}
}
function getLabel(str,func1){
	Visualforce.remoting.Manager.invokeAction(
            remoteGetCustomLabel,
            str, 
            function(result, event){
                if (event.status && result!=null) {
                	//alert("XXX"+result+"XXX");
                	func1(result);
                	
                } else if (event.type === 'exception') {
                	 if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){
                            self.location=self.location;
                     }else if(event.message!=null && (event.message+"").indexOf("Unable to conn")==-1){
                		if($("body:visible").size()>0)alert("An error has occurred: "+event.message);
                	}

                } else {
 
                }

            }, 
            {escape: false,buffer:true,timeout: 90000}
        );
}
var guideInAction=0;
var guideMeLabel=null;
var guideMeStr=null;//JQ selector~~~title~~~text/html to display~~~prev button name~~~next button name###next guide...
var lastGuidesel1=null;
function guideMe(str,startPos){

if($(window).width()<700){
		alert("This guide is not available on mobile devices");
			return;
}
	guideInAction=1;
	try{
	if(str!=null){
		//guideMeStr=str;
			guideMeLabel=str;
		    getLabel(str,function(result){
		    	guideMeStr=result;
				   guideMe(null,startPos); 
		    });
	}else{
		var guides=guideMeStr.split("###");
		var guide1=guides[Math.min(Math.max(0,startPos),guides.length-1)].split("~~~");
		var sel1=guide1[0],title1=guide1[1], html1=guide1[2],prevTxt=guide1[3],nextBTxt=guide1[4];
		if(startPos>=0 && guides.length-1>=startPos && $(sel1).size()==0){
		// element not found
			guideInAction=0;
			getLabel("follow_instruction_guide",function(result){
		    	alert(result);
		    });
		}else if(startPos>=0 && guides.length-1>=startPos){
			lastGuidesel1=sel1;
			//if($.trim(guide1[0])!=""){
			//	$(guide1[0]).click();
			//}
			var nextSec=html1+"<br/>"+"<span style='float:left;margin-top:10px;margin-right:10px;'>"+$(".powerByX").html()+"</span><span style='float:right;'>"+
			(startPos==0 && guideMeLabel=="welcome_guide_me"?"<button onclick='rmLS1(\"welcome_guide_me\");guideMe(null,-1);' class='btn' type='button'>"+Later_label+"</button>":"")+
			($.trim(prevTxt)!="-"?"<button onclick='guideMe(null,"+(-1)+")' class='btn' type='button'>"+prevTxt+"</button>":"")+
			($.trim(nextBTxt)!="-"?"<button onclick='guideMe(null,"+(startPos+1)+")' class='btn' type='button'>"+nextBTxt+"</button>":"")+"</span>";
			//openQtip1(sel1,nextSec,"top center","bottom center",null,"1",false);
			
			var pos1=(sel1=="body"?{"top":0,"left":0}:$(sel1).position());
			var bodyx=$("body,html");
			var bw=bodyx.width();
			var bh=bodyx.width();
			var at1=(Number(pos1.left)<Number(bw)/2?"right top":"left top")+" "+(Number(pos1.top)<Number(bh)/2?"top":"bottom");
			var my1=(Number(pos1.left)>=Number(bw)/2?"right bottom":"left bottom")+" "+(Number(pos1.top)>=Number(bh)/2?"top":"bottom");
			 $("html, body").animate({ scrollTop: Math.max(0,Number(pos1.top)-bh/3),scrollLeft: Math.max(0,Number(pos1.left) -bw/3)}, "fast",function(){
			 
			 $(sel1).qtip({
				zindex:20005,
			    content: {
			        text: nextSec,
			        title:title1,
			        button: true
			    },
			    show: {
			        ready: true,
			        solo: $("#guideHolders1"),
			        modal:false
			    },
			    style: {
			        classes: 'qtip-cream qtip-shadow qtip-rounded qtip-brd-guide',   
			         tip: {
			            corner: (sel1!="body"),
			            width: 15,
			            height:15
			        }
			    },
			    position: {
			        viewport: $(self),//$(self),
			        container:$("#guideHolders1"),
			        my: (sel1!="body"?my1:"center"),  // Position my top left...
			        at: (sel1!="body"?at1:"center"), // at the bottom right of...
			        target: (sel1!="body"?$(sel1):$(".btnBox")) // my target
			    },
			    hide: {
			        fixed: true,
			        delay: 500,
			        event: false
			    },events:{
					hide: function(event, api) {
			            guideInAction=0;
			        },
			    	show:function(event, api){
			    		if(guideInAction!=1){
			    			stopProp1(event);
			    		}
			    	}
			    }
	
			});
			 
			 });
			

		}else{
			$(sel1).qtip().hide();
			if(lastGuidesel1!=null){
				$(lastGuidesel1).qtip().hide();
			}
			guideInAction=0;
		}
	}
	}catch(e){alert(e);}
}

function collapseExpAll(obj){
	reCloseGroups=1;
	var collapse1=$(obj).hasClass("ui-icon-triangle-1-s");
	if(collapse1){//to collpas
		$(obj).removeClass("ui-icon-triangle-1-s");
		$(obj).addClass("ui-icon-triangle-1-e");
		$(".uiColps.ui-icon-triangle-1-s[grp]").click();
	}else{
		$(obj).addClass("ui-icon-triangle-1-s");
		$(obj).removeClass("ui-icon-triangle-1-e");
		$(".uiColps.ui-icon-triangle-1-e[grp]").click();
	}
	reCloseGroups=0;
	savedGroups1();
}
function collapseExp(obj){
	$(obj).disableSelection();
	var collapse1=$(obj).hasClass("ui-icon-triangle-1-s");
	var tr1=$(obj).parents("tr:first");//rowGrouping1
	var next1=tr1.next();
	var count1=0;
	if(collapse1){//to collpase
		$(obj).removeClass("ui-icon-triangle-1-s");
		$(obj).addClass("ui-icon-triangle-1-e");
		while(next1!=null && next1.hasClass("dataRow")){
			count1++;
			next1.hide();
			next1=next1.next();
		}
		
	}else{
		$(obj).addClass("ui-icon-triangle-1-s");
		$(obj).removeClass("ui-icon-triangle-1-e");
		while(next1!=null && next1.hasClass("dataRow")){
			count1++;
			next1.show();
			next1=next1.next();
		}
	}
	//tr1.find(".count1").html("("+count1+")");
	
	savedGroups1();
}

function collapseFilterSF1(obj){
	$(obj).disableSelection();
	var collapse1=$(obj).hasClass("ui-icon-triangle-1-s");
	var th1=$(obj).parents("th:first");//rowGrouping1
	var next1=th1.next().next();
	var count1=0;
	if(collapse1){//to collpase
		$(obj).removeClass("ui-icon-triangle-1-s");
		$(obj).addClass("ui-icon-triangle-1-e");
		while(next1!=null && next1.attr("gnz")!=null){
			count1++;
			next1.hide();
			next1=next1.next();
		}
		
	}else{
		$(obj).addClass("ui-icon-triangle-1-s");
		$(obj).removeClass("ui-icon-triangle-1-e");
		while(next1!=null && next1.attr("gnz")!=null){
			count1++;
			next1.css({"display":"block"});
			next1=next1.next();
		}
	}
	//tr1.find(".count1").html("("+count1+")");
	
}

function rmLS1(str){
	try{
		localStorage.removeItem(str); 
	}catch(e){}
}

function getLS1(str){
	var val="X";
	try{
		val=localStorage.getItem(str); 
	}catch(e){}
	return val;
}
function setLS1(str,val){
	try{
		val=localStorage.setItem(str,val); 
	}catch(e){}
}
function getLastSavedGroupsName(){
	return UrlEnd1+tp_conf+"~"+(mainViewIDTemp!=""?mainViewIDTemp:mainViewID)+"~"+sortByFieldforColor+"~"+currPageCls+new Date().toLocaleDateString(); 
}
var reCloseGroups=0;
function savedGroups1(){
   	if(reCloseGroups==0){
   		var saveGroups="";
   		$(".uiColps.ui-icon-triangle-1-e").each(function(){//closed
   			var grp=$(this).attr("grp");
   			saveGroups+="~"+grp;
   		});
   		if(saveGroups!=""){
   			setLS1(getLastSavedGroupsName(),saveGroups.substring(1));
   		}else{
   			rmLS1(getLastSavedGroupsName());
   		}
   		
   	}
}
function reloadLastSavedGroups(){
   		var groups=getLS1(getLastSavedGroupsName());
   		//alert(groups);
   		if(groups!=null && groups!="" && groups!="X"){
   		   	reCloseGroups=1;
   			var sel1=".uiColps.ui-icon-triangle-1-s[grp='"+(groups.replace(/~/ig,"'],.uiColps.ui-icon-triangle-1-s[grp='"))+"']";
   			//alert(sel1);
   			$(sel1).click();		
   			reCloseGroups=0;
   			rmLS1(getLastSavedGroupsName());
   		}
}
function onSave1(){
	
	//remove shorot hadashot bli bedika
	var okToSave=true;
	var count1=0;
	var error_enter_valueX=error_enter_value.split("#");
	var errorMessage='<div class="errorMsg errorMsgX"><strong>'+error_enter_valueX[0]+'</strong>'+error_enter_valueX[1]+'</div>';
	var errorMessageG='<div class="message errorM3" role="alert"><table border="0" cellpadding="0" cellspacing="0" class="messageTable" style="padding:0px;margin:0px;"><tbody><tr valign="top"><td><img alt="ERROR" class="msgIcon" src="/s.gif" title="ERROR"></td><td class="messageCell"><div class="messageText"><span  style="color:#cc0000"><h4>'+error_enter_valueX[0]+'</h4></span>'+error_enter_valueX[1]+'<br></div></td></tr><tr><td></td><td></td></tr></tbody></table></div>';
	$(".requiredInput .errorMsg").remove();
	$(".lcbX").each(function(){
		//alert($(this).find(".lcbXRow").is(":checked"));
		if($(this).find(".lcbXRow")!=null && $(this).find(".lcbXRow").is(":checked")){
			var row=$(this).parents("tr.dataRow:first");//.remove();
			row.find(".requiredInput select").each(function(){
				if($(this).val()==""){
					$(this).parents(".requiredInput:first").append(errorMessage);
					okToSave=false;
				}else{
					$(this).parents(".requiredInput:first").find(".errorMsgX").remove();
				
				}
			});
			row.find(".requiredInput input[type='text']").each(function(){
				if($(this).val()==""){
					$(this).parents(".requiredInput:first").append(errorMessage);
					okToSave=false;
				}else{
					$(this).parents(".requiredInput:first").find(".errorMsgX").remove();
				
				}
			});
			
			row.find(".requiredInput textarea").each(function(){
				if($(this).val()==""){
					$(this).parents(".requiredInput:first").append(errorMessage);
					okToSave=false;
				}else{
					$(this).parents(".requiredInput:first").find(".errorMsgX").remove();
				
				}
			});

			count1++;
		}
	});
	
	if(okToSave){
		 loadingSH();
		 saveNow();
	}else{
		$("span[id*='mainTB1Err']:first").html(errorMessageG);
		fixIfmHegt();
	}
	
	//return okToSave;
	//alert(count1);
	
} 


var copyCellfirstCell=null;
var copyCellFld=null;
var copyCellStarted1=false;
function copyCellStart(obj,e1){
//alert(1);
	$(".copyCellMark").removeClass("copyCellMark");
	copyCellfirstCell=obj;
	$(obj).attr('unselectable', 'on').css('user-select', 'none').on('selectstart', false);
	copyCellStarted1=true;
	copyCellFld=$(obj).attr("fld");
	
	copyCellHOVER($(obj).parents("td.iTd:first,td.CBL:first"),e1);
	stopProp1(e1);
}
function copyCellHOVER(obj,e1){
	//
	//alert(copyCellStarted1+" "+$(obj).hasClass("copyCellMark") +" "+$(obj).hasClass(copyCellFld)+" "+copyCellFld);
	if(copyCellStarted1 && !$(obj).hasClass("copyCellMark") && $(obj).hasClass(copyCellFld)){
		$(obj).addClass("copyCellMark");
	}
	
}
function copyCellEnd(obj,e1){
	//alert(3)
	if(copyCellStarted1){
	
	copyCellStarted1=false;
	var cells=$(".copyCellMark");
	var p1=$(copyCellfirstCell).parents("td.copyCellMark:first");
	var inp=p1.find("input[type='checkbox']:visible");
	if(inp!=null && inp.size()==1){
		cells.find("input[type='checkbox']:visible").prop("checked",inp.prop("checked")).change();
	}else{
		inp=p1.find("input:visible");
		try{
		if(inp!=null && inp.size()==1){
			cells.find("input:visible").val(inp.val()).change();
		}
		inp=p1.find("select:visible");
		if(inp!=null && inp.size()==1){
			cells.find("select:visible").val(inp.val()).change();
		}
		
		inp=p1.find("textarea:visible");
		if(inp!=null && inp.size()==1){
			cells.find("textarea:visible").val(inp.val()).change();
		}
		}catch(e1){}
		
	}
	cells.removeClass("copyCellMark");
	}
	
}


function searchAndReplacePopUpF(field){
	//$(".fltIC"+field+":first").click();//close filter
	closeFilterx(); 
	//$("#searchAndReplacePopUp").remove();
	//$("body").append("");
	$("#mainTBX1 tbody td."+field).addClass("marked");
		 $("#searchAndReplacePopUp").dialog({
         modal: false
		//,appendTo: ".mZPForm1"
         ,close: function( event, ui ) {
           $("#mainTBX1 tbody td."+field).removeClass("marked");
         },
    buttons: [{
    text:"Replace",
   click: function() {
   		var spop=$("#searchAndReplacePopUp");
   		if(spop.find(".searchAndReplaceSEL").val()=="replace"){
        	searchAndReplace(field,spop.find('.f').val(),spop.find('.r').val(),spop.find('.regex').is(":checked"),spop.find('.Match').is(":checked"),0);
        	  $( this ).dialog( "close" );
 		}else{
 		//alert(spop.find('.searchAndReplaceOp').val()+" "+spop.find('.searchAndReplaceCalcVal').val());
 			var val1=spop.find('.searchAndReplaceCalcVal').val();
 			if(val1=="" || isNaN(val1)){
				alert("Please enter a valid number!");
				$(".searchAndReplaceCalcVal").focus();
			}else{
 				searchAndReplaceCalculate(field,spop.find('.searchAndReplaceAction').val(),spop.find('.searchAndReplaceCalcVal').val(),0);
 				  $( this ).dialog( "close" );
 			}
 		}
      
  
    }},
    {text:Cancel_button,
    click: function() {
        $( this ).dialog( "close" );
    
    }
    }]
                                      });
}
function searchAndReplace(field,find,replace1,regex,match,all){
	try{
	if(!regex){
		find=find.replace(/\./ig,"\\.").replace(/\,/ig,"\\,").replace(/\|/ig,"\\|").replace(/\-/ig,"\\-").replace(/\$/ig,"\\$").replace(/\^/ig,"\\^");
	}
	//alert(find);
	var patt = new RegExp(find,(!match?"i":"")+"g");
	//var pattSearch = new RegExp(".*"+find+".*",(!match?"i":"")+"");
	var rows=$("#mainTBX1 .dataRow .lcbXRow"+(all==1?"":":checked"));
	if(rows.size()==0){
		rows=$("#mainTBX1 .dataRow .lcbXRow");
	}
	rows.each(function(){
	$(this).parents("tr.dataRow:first").find("input[type='text'].iTb.inpSt_"+field+":visible, textarea.iTb.inpSt_"+field+":visible").each(function(){
		
	   if($(this).val().match(patt)){
	   	 $(this).val($(this).val().replace(patt,replace1)).change();
	   }
		
	});
	
	});
	}catch(e){
		alert("Error: "+e);
	}
}
var searchAndReplaceCalculateEval1=0;
function searchAndReplaceCalculate(field,Op1,val1,all){
	try{
	//alert(Op1.match(/\*|\/|\-|\+/)+ " "+!isNaN(val1));
	if(Op1.match(/\*|\/|\-|\+/) && val1!="" && !isNaN(val1)){
	var rows=$("#mainTBX1 .dataRow .lcbXRow"+(all==1?"":":checked"));
	if(rows.size()==0){
		rows=$("#mainTBX1 .dataRow .lcbXRow");
	}
	rows.each(function(){
	$(this).parents("tr.dataRow:first").find("input[type='text'].iTb.inpSt_"+field+":visible, textarea.iTb.inpSt_"+field+":visible").each(function(){
		
	   if($(this).val()!="" && !isNaN($(this).val().replace(/\,/ig,""))){
	   	searchAndReplaceCalculateEval1="";
	   	jQuery.globalEval("try{searchAndReplaceCalculateEval1=("+($(this).val().replace(/\,/ig,""))+""+Op1+val1+");}catch(e){}");
	   	if(searchAndReplaceCalculateEval1!="" && !isNaN(searchAndReplaceCalculateEval1) && (searchAndReplaceCalculateEval1+"").indexOf(".")>-1){
	   		searchAndReplaceCalculateEval1=searchAndReplaceCalculateEval1.toFixed(2);
	   	}
	   	 $(this).val(searchAndReplaceCalculateEval1).change();
	   }
		
	});
	
	});
	}else{
		
	}
	}catch(e){
		alert("Error: "+e);
	}
}

function massTransData(object1, o1f1Name,o1f2Nameid, object2, o2f1Name){
	$.ajax({url:'/soap/ajax/35.0/connection.js',dataType: "script", success:function() {
	try{
	var objX1Arr=new Array();
	// query the record
	var checkedIds=new Array();;
	$(".lcbX input:checked").each(function(){
		checkedIds.push($(this).parents(".lcbX:first").attr("rid"));
	});
	if(checkedIds.length==0){
		alert("Please select at least row!");
	}else if(confirm("Are you sure you want to update "+checkedIds.length+" "+object2+"."+o2f1Name+"(s)"+" based on data taken from  the selected "+object1+"."+o1f1Name+"(s)")){
		var qr = sforce.connection.query("SELECT "+o1f1Name+", "+o1f2Nameid+" FROM "+object1+" where Id in('" +checkedIds.join("','")+ "')");
		var records = qr.getArray("records");
		for (var i=0; i< records.length; i++) {
			var record = records[i];
			var objX1 = new sforce.SObject(object2);
			objX1[o2f1Name]=record[o1f1Name];
			objX1.Id=record[o1f2Nameid];
			objX1Arr.push(objX1);
		}
		 var result = sforce.connection.update(objX1Arr);
		 if (result!=null && result[0].getBoolean("success")) {
			alert(objX1Arr.length+" "+object2+(objX1Arr.length>1?"s were":" was")+" updated successully.");//\n\n\n more info: "+result
		 }else{
			alert("Error during update: "+result);
		 }
		 jumpToClk(currPageCls,600); 
	 }
	 }catch(e){
		alert("Error: "+e);
	 }
	 }});
}


/**  mass merge**/


var lastmainObjToMerge="";
function massMergeX(mainObjToMerge){//var mainObjToMerge="Lead"; 
trackEventX('massMergeX');

lastmainObjToMerge=mainObjToMerge;
var checkedLength=$("#mainTBX1 .list .dataRow .lcbXRow:checked").size();
if(licenseStatus!='Active' && checkedLength>5){ 
		alert("During the free trial the mass-merge option is limited to 5 rows per shot.\n\nUse our website http://www.zaapit.com/page/pricing or contact sales@zaapit.com to activate your license!"); 
		return; 
} 
if(isEditMode1){
	alert("Mass Merge only works in view-mode, Save / Cancel your changes first."); 
	return;
}
if(checkedLength<2){ 
alert("Please select the rows you want to merge.\nYou must select at least 2 rows in each color-based-row-group that you want to merge."); 
}else{ 
var groupCount=0; 
var allGroupsok=true; 
var ix=1; 
var arrToMerge=new Array(); 
$("#mainTBX1 .list .dataRow").each(function(){ 
if(!$(this).hasClass("tcx"+ix)){ 
ix=1-ix; 

if(arrToMerge.length==1){ 
allGroupsok=false; 
} 
if(arrToMerge.length>0){ 
groupCount++; 
} 
arrToMerge=new Array(); 

}else{ 

} 
if($(this).find(".lcbXRow").prop("checked")){ 
var idX=$(this).find(".lcbXRow").parents(".lcbX").attr("rid"); 
arrToMerge.push(idX); 
} 
}); 
if(arrToMerge.length==1){ 
allGroupsok=false; 
} 
if(arrToMerge.length>0){ 
groupCount++; 
} 

if(!allGroupsok){ 
alert("One of the selected groups has 1 selected row to merge - please select more than 2 rows for each gourp."); 
}else{ 
if(confirm("Mass Merge process overview: \n1) The first selected row in each color-based-row-group will be the master i.e. unless you mark the master (in purple) by hovering the row's checkbox & click the mark as master link.\n\n2) Click on a field to copy it's content to the master-row during the merge process.\n\n3) Use the checkboxes to restrict the rows you want to merge.\n\n\n Do you want to start the mass merge process on the below selected color-based-row-groups (only the current page will be merged)?") 
&& confirm("\n\nAre you sure you want to merge the selected groups ("+groupCount+")? \n\n ") 
){ 
loadingSH(); 
//start merge

arrToMergeRequests=new Array(); 
totalMerged=0;
continueToNextGroup=true; 
startMerge1();

} 
} 

}
}//end mass merge


var arrToMergeRequests=new Array(); 
var totalMerged=0;
var continueToNextGroup=true; 
function startMerge1(){

var ix=1; 

var arrToMerge=new Array(); 
var overwriteFields={};
$("#mainTBX1 .list .dataRow").each(function(){ 
if(!$(this).hasClass("tcx"+ix)){ 
ix=1-ix; 
if(continueToNextGroup && arrToMerge.length>1){ 
var arrToMergeT=arrToMerge.slice(1,arrToMerge.length); 
while(arrToMergeT.length>0){ 
var masterRecord=arrToMerge[0];
var recordToMergeIds=arrToMergeT.slice(0,Math.min(2,arrToMergeT.length)); 
var tempArr=new Array();
tempArr[0]=masterRecord;
tempArr[1]=recordToMergeIds;
tempArr[2]=JSON.stringify(overwriteFields);
arrToMergeRequests.push(tempArr);

//alert(Res); 
//arrToMergeRequests.push(masterRecord); 
if(arrToMergeT.length>2){ 
arrToMergeT=arrToMergeT.slice(2,arrToMergeT.length); 
}else{ 
arrToMergeT=new Array(); 
} 
} 
} 
arrToMerge=new Array(); 
overwriteFields={};
}else{ 

} 
if($(this).find(".lcbXRow").prop("checked")){ 
	var idX=$(this).find(".lcbXRow").parents(".lcbX:first").attr("rid");
	var tr1=$(this); 
	
	if(tr1.hasClass("gnzMSR")){//master
		arrToMerge.unshift(idX);//place first
	}else{
		arrToMerge.push(idX);
		//overwrite fields
		tr1.find("td.copyCellMark[fld]").each(function(){
			overwriteFields[$(this).attr("fld")]=idX;
		}); 
	}
} 

}); 

if(continueToNextGroup && arrToMerge.length>1){
 
var arrToMergeT=arrToMerge.slice(1,arrToMerge.length); 
while(arrToMergeT.length>0){ 
var masterRecord=arrToMerge[0]; 
var recordToMergeIds=arrToMergeT.slice(0,Math.min(2,arrToMergeT.length)); 
var tempArr=new Array();
tempArr[0]=masterRecord;
tempArr[1]=recordToMergeIds;
tempArr[2]=JSON.stringify(overwriteFields);
arrToMergeRequests.push(tempArr);

//alert(Res); 
//arrToMergeRequests.push(masterRecord); 
if(arrToMergeT.length>2){ 
arrToMergeT=arrToMergeT.slice(2,arrToMergeT.length); 
}else{ 
arrToMergeT=new Array(); 
}
} 
} 

startMerge2(0);

//end merge
}

var hadError=false;
function startMerge2(idx){
	
		if(continueToNextGroup&& arrToMergeRequests.length>idx){
			
		var tempArr=arrToMergeRequests[idx]
	Visualforce.remoting.Manager.invokeAction(
                remoteMassMerge,
                 lastmainObjToMerge,
                tempArr[0],
				tempArr[1].join("~"),
				tempArr[2],				
                function(result, event){
                    if (event.status && result!=null) {

						if(result[0]=='OK'){ 
							for(var x1=0;x1<tempArr[1].length;x1++){ 
							var tempID=tempArr[1][x1]; 
							$(".lcbX[rid='"+tempID+"']").parents("tr:first").css({"background":"#CCCCCC"}); 
							} 
						}else{ 
						$(".lcbX[rid='"+tempArr[0]+"']").parents("tr:first").css({"background":"#FFCCCC"}); 
						alert("Error during merge: "+result[1]+" \n\n Master Record Id: "+tempArr[0]+" \n\n"); 
						continueToNextGroup=confirm("Do you want to continue the merge process (skip the current group & continue)?\n\n");
						hadError=true; 
						var foundZ1=false;
						for(var i=idx+1;i<arrToMergeRequests.length && !foundZ1;i++){
							if(arrToMergeRequests[i][0] !=arrToMergeRequests[idx][0]){
								foundZ1=true;
								idx=i-1;
							}
						} 
                        }
                        totalMerged++;
						startMerge2(idx+1);
                     } else if (event.type === 'exception') {
                        if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){
                            self.location=self.location;
                        }else if(event.message!=null && (event.message+"").indexOf("Unable to connect")==-1){
                            if($("body:visible").size()>0)alert("An error has occurred: "+event.message);
                        }
                    } 
                }, 
                {escape: true,buffer:true,timeout: 90000}
            );
			}else{
		
		
			$("#loadingx1").hide(); 
			if(!continueToNextGroup && totalMerged>0 && confirm("The following Grayed out rows were merged successfully.\n\n Do you want to refresh the table?")){ 
			jumpToClk(currPageCls,600); 
			}else if(continueToNextGroup && totalMerged>0){ 
			 
			// alert(Res); 
			tempLayerMessage("Mass Merge has finished "+(!hadError?" successfully ":"<br/>"),!hadError);
			jumpToClk(currPageCls,600); 
			} 

			}
	
    }
    function markAsMaster(idx){
    	var obj=$(".lcbX[rid='"+idx+"']");
    	if(!obj.find(".lcbXRow").is(":checked")){
    		obj.find(".lcbXRow").click();
    	}	
    	var tr1=(obj).parents("tr:first");
    	var gnz=tr1.attr("gnz");
    	$("#mainTBX1 tbody tr[gnz='"+gnz+"']").removeClass("gnzMSR");
    	tr1.addClass("gnzMSR");
    }
    var MassMergefieldsToAvilOv=new Array();
    
    function drillDown(confName){
	    var checkedIds=""; 
		$(".lcbX input:checked").each(function(){ 
			checkedIds+="~"+$(this).parents(".lcbX:first").attr("rid"); 
		}); 
		if(checkedIds==""){ 
			alert(Please_select_at_least_one_row); 
		}else{ 
			window.open("/apex/zaapit_tb_GeneralWL?tp="+confName+"&viewid=&id="+escape(checkedIds.substring(1)),"_blank"); 
		
		} 
		return false;
	}



	/****mass convert***remotemassConvert*/
	
	function openMassConvert(){
		trackEventX('openMassConvert');
		var checkedLength=$(".lcbX input:checked").size();
		if(licenseStatus!='Active' && checkedLength>5){ 
			alert("During the free trial the mass-convert option is limited to 5 rows per shot.\n\nUse our website http://www.zaapit.com/page/pricing or contact sales@zaapit.com to activate your license!"); 
			return; 
 
		} 
				var checkedIds=""; 
				var checkedIdsArr=new Array(); 
				var currentLeadIdx=0;
		var checkedId1=""; 
		var leadCount=0; 
		$(".lcbX input:checked").each(function(){ 
		checkedId1=$(this).parents(".lcbX:first").attr("rid"); 
		//alert(checkedId1.length); 
		if(checkedId1!=null && checkedId1.length==18){ 
		//checkedId1=checkedId1.substring(0,15); 
		} 
		checkedIds+=","+checkedId1; 
		checkedIdsArr.push(checkedId1);
		leadCount++; 
		}); 
		if(leadCount<1){ 
		alert("Please select at least one row"); 
		}else{ 


		function appendTags(){ 
		$('#dialog-mass-convert').remove(); 

		$('body').append( 
		'<div id="dialog-mass-convert" title="Mass Convert">' + 
		'<div style="margin:10px;font-weight:bold;">Mass convert Options:'+ 
		'</div>'+
		'<input type="checkbox" name="contactFind" id="contactFind" checked/> Find Contact <div style="color:#696969">Try to find existing contact by using lead\'s email (before you create a new Contact & Account)</div><br>' + 
		'<input type="checkbox" name="accountFind" id="accountFind" checked/> Find Account <div style="color:#696969">Try to find existing account by using lead\'s company (before you create a new account)</div><br>' + 
 
		'<span style="display:inline-block;width:95px;">Opportunities:</span> <select name="createOpp" id="createOpp"><option value="0">Don\'t create any opportunities </option><option value="1">Create for each converted lead</option><option value="2">Create for the first converted lead</option></select>  <div style="color:#696969;margin-top:3px;">Create an opportunity for each/first converted lead</div><br>' +

		'<span style="display:inline-block;width:95px;">Owner:</span> <span id="ownerSelLC"></span> <div style="color:#696969;margin-top:3px;">An owner for the new contacts / Accounts / Opportunities</div><br>'+
		'<span style="display:inline-block;width:95px;">Lead Status:</span> <span id="LeadStatusSelLC"></span></br> '+ 
		//'Mass Email Name <input type="text" name="descriptionME" id="descriptionME" />' + 


		'' + 
		'' 

		); 

		} 

		function createPopupWindow(){ 

		$( "#dialog-mass-convert" ).dialog({ 
		resizable: false, 
		width: 400, 
		height:450, 
		//modal: true, 
		buttons: { 
		"Start Mass Convert": 
		function() { 
		startMassConvert(); 
		jQuery( this ).dialog( "close" ); 
		}, 

		Cancel: 
		function() { 
		jQuery( this ).dialog( "close" ); 
		} 
		} 
		}); 
			fixIfmHegt();
		} 

		function messagePopupWindow(message){ 
		$( "#dialog-mass-convert" ).html(message).dialog({ 
		resizable: false, 
		width: 400, 
		height:250, 
		//modal: true, 
		buttons: { 

		Close: 
		function() { 
		$( this ).dialog( "close" ); 
		} 
		},close:function(){ 
		$(".lcbX input:checked").click(); 
		} 
		}); 
		} 

		function fetchData(){ 

		//lead ownerid
		var queryZZZ="SELECT Id,Name FROM user order by name asc"; 
		Visualforce.remoting.Manager.invokeAction( 
		remoteQueryAjax2, 
		queryZZZ, 
		function(result, event){ 

		if (event.status && result!=null) { 

		var innerHtml = ''; 
		var records=result; 
		for(var i=0; i<records.length; i++) 
		innerHtml += 
		'<option value="' + records[i].Id + '">'+records[i].Name +	'</option>'; 

		$('#ownerSelLC').html('<select name="ownerSelLCID" id="ownerSelLCID"><option value="">Lead Owner</option>'+innerHtml+'</select>'); 
		} else if (event.type === 'exception') { 
		if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){ 
		self.location=self.location; 
		}else if(event.message!=null && (event.message+"").indexOf("Unable to connect")==-1){ 
		if($("body:visible").size()>0)alert("An error has occurred: "+event.message); 
		} 
		} else { 
		//self.location=self.location; 
		// $("#"+filterIdSpan+" .availVals").html(""); 
		//alert(1); 
		} 

		}, 
		{escape: true,buffer:true,timeout: 90000} 
		); 
		
		//lead status
		var queryZZZ2="SELECT Id,MasterLabel FROM LeadStatus WHERE IsConverted=true order by MasterLabel asc"; 
		Visualforce.remoting.Manager.invokeAction( 
		remoteQueryAjax2, 
		queryZZZ2, 
		function(result, event){ 

		if (event.status && result!=null) { 

		var innerHtml = ''; 
		var records=result; 
		for(var i=0; i<records.length; i++) 
			innerHtml += 
				'<option value="' + records[i].MasterLabel + '">'+records[i].MasterLabel +'</option>'; 

			$('#LeadStatusSelLC').html('<select name="LeadStatusSelLCID" id="LeadStatusSelLCID">'+innerHtml+'</select>'); 
		} else if (event.type === 'exception') { 
		if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){ 
		self.location=self.location; 
		}else if(event.message!=null && (event.message+"").indexOf("Unable to connect")==-1){ 
		if($("body:visible").size()>0)alert("An error has occurred: "+event.message); 
		} 
		} else { 
		//self.location=self.location; 
		// $("#"+filterIdSpan+" .availVals").html(""); 
		//alert(1); 
		} 

		}, 
		{escape: true,buffer:true,timeout: 90000} 
		); 
		
		
		
		} 

		function startMassConvert(){ 
			loadingSH();
			//alert(checkedIdsArr[currentLeadIdx]);
			//lead_MasterLabel~find account 0/1~find contact 0/1~owenrid~create opportunity 0/1
			var options=$("#LeadStatusSelLCID").val()+"~"+($("#accountFind").prop("checked")?1:0)+"~"+($("#contactFind").prop("checked")?1:0)+"~"+$("#ownerSelLCID").val()+"~"+($("#createOpp").val()==1 || ($("#createOpp").val()==2&& currentLeadIdx==0)?1:0);
		Visualforce.remoting.Manager.invokeAction( 
		remotemassConvert, 
		checkedIdsArr[currentLeadIdx], //id
		options, 
		function(result, event){ 
		var continueMerge=true;
		
		if (event.status && result!=null) { 
		
		if((result+"").indexOf("OK")==0){ 
			$(".lcbX[rid='"+checkedIdsArr[currentLeadIdx]+"']").parents("tr:first").css({"background":"#CCCCCC"}); 
			//messagePopupWindow('<br><span class="ui-icon ui-icon-check" style="float:left;margin-right:10px;display:inline-block;"></span><b>Your email(s) have been submitted for processing.</b><br><br>The Mass-Mailer result will be sent to you via email.'); 

		}else{ 
			$(".lcbX[rid='"+checkedIdsArr[currentLeadIdx]+"']").parents("tr:first").css({"background":"#FFCCCC"}); 
			continueMerge=confirm('Error while converting lead: '+result+'\n\nDo you want to continue the merge process?'); 
			hadError=true;
		} 
			currentLeadIdx++;
			if(continueMerge&& currentLeadIdx<=checkedIdsArr.length-1){
				startMassConvert();
			}else{
				tempLayerMessage("Mass Convert has finished "+(!hadError?" successfully ":"<br/>"),!hadError);
				jumpToClk(currPageCls,600); 
			}
		} else if (event.type === 'exception') { 
		if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){ 
		self.location=self.location; 
		}else if(event.message!=null && (event.message+"").indexOf("Unable to connect")==-1 ){ 
		if($("body:visible").size()>0)alert("An error has occurred: "+event.message); 
		} 
		} else { 
		//self.location=self.location; 
		// $("#"+filterIdSpan+" .availVals").html(""); 
		//alert(1); 
		} 

		}, 
		{escape: true,buffer:true,timeout: 90000} 
		); 

		
		} 

		appendTags(); 
		fetchData(); 
		createPopupWindow(); 


		} 
	}
	
	
	function tempLayerMessage(text,ok){
		$(".msgOKgGLCont").remove();
		if(ok){
			text="<div class='msgOKGL'>"+text+"</div>";
		}else{
			text=text+" <br/><a href=\"javascript:void(0);\" onclick=\"$('.msgOKgGLCont').hide();\" style=\"margin-left:45%;font-size:12px;\">Close</a>";
		}
		$("html,body").append($("<div class='msgOKgGLCont'>"+text+"</div>"));
		if(ok){
			setTimeout(function(){
				$(".msgOKgGLCont").hide();
			},3500);
		}else{
			setTimeout(function(){
				$(".msgOKgGLCont").hide();
			},30000);
		}
		hadError=false;
	}
	function openCondWin(){
		openGenWindow1("../apex/zaapit__zaapit_tb_viewstyle?id="+escape(currConf_name+"~"+$.trim($(".curSelectedView").val()))+"&tbname="+tableX1+"&isdtp=vw",Conditional_Formatting,1350,Math.max($(self).height()-50,550),null,function(){
		loadingSH();
		//self.location.reload();//jumpToClk(currPageCls,600);
		//alert(self.location.href);
		self.location.href=self.location.href;
		});
		fixIfmHegt();
	}
	
	
	function markRowsLedg(tablex1,conditionEnc,pageIDS,cssName){
		if(pageIDS!=null && pageIDS!=''){
			var queryZZZ="SELECT Id FROM "+tablex1+" where ("+decodeURIComponent(conditionEnc).replace(/\+/ig,' ')+") and id in ('"+(decodeURIComponent(pageIDS).replace(/\~/ig,"','"))+"')";
			//alert(queryZZZ); 
			Visualforce.remoting.Manager.invokeAction( 
			remoteQueryAjax2, 
			queryZZZ, 
			function(result, event){ 
	
			if (event.status && result!=null) { 
	
				var markRows = ''; 
				var records=result; //alert(result);
				for(var i=0; i<records.length; i++){ 
					markRows+=",tr.dataRow[rowid='"+(records[i].Id)+"']";
				} 
				//alert(markRows);
				if(markRows!=","){
					$((markRows.substring(1))).addClass(cssName);
				}//alert(markRows);
			} else if (event.type === 'exception') { 
				if(event.message!=null && ((event.message+"").indexOf("Logged in")>-1 || (event.message+"").indexOf("Refresh page")>-1)){ 
					self.location=self.location; 
				}else if(event.message!=null && (event.message+"").indexOf("Unable to connect")==-1){ 
				if($("body:visible").size()>0)alert("An error has occurred: "+event.message); 
				} 
			} else { 
			//self.location=self.location; 
			// $("#"+filterIdSpan+" .availVals").html(""); 
			//alert(1); 
			} 
	
			}, 
			{escape: true,buffer:true,timeout: 90000} 
			); 
		}
		
	}
	

	function checkColumnFreeze(resize){
				if(numColumnsFreezeCols>0 && !isSF1() ){//(navigator.userAgent.indexOf("Chrome")>-1 || navigator.userAgent.indexOf("Firefox")>-1)
				if(resize!=null){
					$(".secTB1").remove();
				}
				var minusLeft=0;
				var minusTop=-15;
				if(navigator.userAgent.indexOf("Chrome")==-1 && navigator.userAgent.indexOf("Firefox")==-1){//IE
						minusTop=-5;
					}
				
				if(!isInIframe()){
					minusLeft=10;
					minusTop=93;
					if(navigator.userAgent.indexOf("Firefox")>-1){
						minusTop=103;
					}
					if(navigator.userAgent.indexOf("Chrome")==-1 && navigator.userAgent.indexOf("Firefox")==-1){//IE
						minusTop=103;
					}
				}
			var mainTB1=$(".mainTB1");
			var p1 = mainTB1.position();
			if($(".secTB1").size()==0){
			
			
			var keepCols=numColumnsFreezeCols;
			//$(".secTB1").remove();
			$(".mainTB1 table.list tbody td[fld],.mainTB1 table.list tbody td.iTd,.mainTB1 table.list thead th.thw").each(function(){
			//	$(this).width($(this).width());
				$(this).height($(this).height());
			});
			p1 = mainTB1.position();
			
			var tb1=$(".mainTB1 table.list:first").clone();
			tb1.find("tbody tr.dataRow,thead tr").each(function(){
				var thwNum=0;
				$(this).find("th,td").each(function(){
					
					if($(this).hasClass("thw") || $(this).attr("fld")!=null ||$(this).hasClass("iTd")){
						thwNum++;
					}
					if(thwNum==0 || thwNum>keepCols){
						$(this).remove();
					}else{
						$(this).css({"padding":"4px 2px 4px 5px"});
						if($(this).find("input").size()>0){
							$(this).find("input").attr("readonly","readonly").attr("id","").attr("name","");
							$(this).find("input").css({"background":"#eeeeee","border":"1px solid #aaaaaa"});
			
						}
					}
				});
			});
			tb1.find("tfoot").remove();
			tb1.find(".fltIC,wd1").remove();
			tb1.width("auto");
			//tb1.find("th.thw").width("auto");
			var thw1=tb1.find("th.thw").clone();
			var colWidth=thw1.width();
			thw1.css({"display":"block","height":"23px","border-right":"1px solid #e0e0e0","padding-right":"0px"});
			thw1.find(".fltIC").remove();

			var secTHW1=$("<span class='secTHW1'/>").append(thw1);
			var secTB1=$("<span class='secTB1'/>").append(tb1);
			
			//secTB1.css({"position":"absolute","top":p1.top+"px","left":Math.max(p1.left,$(self).scrollLeft())+"px","z-index":"3"});

			 secTB1.find(".rowGrouping1").html("");//.css({"white-space":"nowrap","overflow":"hidden"}).width(colWidth-75);
			$(".mainTB1").append(secTB1);
			$(".mainTB1").append(secTHW1);
			
			}
			//alert(p1.left+" "+$(self).scrollLeft());
			if(p1.left<$(self).scrollLeft()){
				
				//$(".secTB1").css({"position":"fixed","top":-1*($(self).scrollTop()-p1.top)+"px","left":"0px","z-index":"3"}).show();
				$(".secTB1").css({"position":"absolute","top":p1.top+"px","left":Math.max(p1.left,$(self).scrollLeft()-minusLeft)+"px","z-index":"3"}).show();
				var floatTopHead=$(".btnicofltTBTOP:first");
				
				if(floatTopHead.is(":visible")){
					$(".secTHW1 th").width($(".secTB1").width()-6);
					$(".secTHW1").css({"background":"rgb(242, 243, 243)","display":"inline-block","height":"23px","position":"absolute","top":($(self).scrollTop()-minusTop+floatTopHead.height())+"px","left":Math.max(p1.left,$(self).scrollLeft()-minusLeft)+"px","z-index":"5"}).show();
				}else{
					$(".secTHW1").hide();
				}
			}else{
				$(".secTB1").hide();
				$(".secTHW1").hide();
			}
			if($(self).scrollTop()<90 && $(".secTHW1").is(":visible")){
				$(".secTHW1").hide();
			}
			
			//$(".secTB1").css({"position":"absolute","top":p1.top+"px","left":Math.max(p1.left,$(self).scrollLeft()-5)+"px","z-index":"3"}).show();
			
			}
			
			}

	var startColPos_last=null;
	var startColPos_lastTXT=null;
	var startColPos_origCOl=null;
	var lastCOLMouseXY=null;
function startColPos(obj,e){
	startColPos_last=null;
	moveColPos_started=0;
	moveColPos_post=0;
	var isLeftClick=false;
	//alert(e.which)
   switch (e.which) {
        case 1:
            //alert('Left Mouse button pressed.');
            isLeftClick=true;
            break;
        case 2:
           // alert('Middle Mouse button pressed.');
            break;
        case 3:
        	
           // alert('Right Mouse button pressed.');
            break;
        default:
           // alert('You have a strange Mouse!');
    }
	if(isLeftClick && !isScrollMode()&& !isSF1()){
			lastCOLMouseXY=e.pageY+" "+e.pageX;
		$(obj).disableSelection().attr('unselectable', 'on')
                 .css('user-select', 'none')
                 .on('selectstart', false);
		$("body").disableSelection();
		startColPos_last=obj;
		startColPos_lastTXT=$(startColPos_last).text();
		$(".colPosMov,.colMarker").remove();
		$("body").append("<div class='colPosMov'><span class='ico'></span><div class='in'>"+startColPos_lastTXT+"</div></div><div class='colMarker'></div>");
		
		var cols=0;
			var origCOl=0;
			$(".mainTB1 .list th").each(function(){
				if($(this).attr("class")==$(startColPos_last).attr("class")){
					origCOl=cols;
				}
				cols++;
			});
			startColPos_origCOl=origCOl;
	}
}	

jQuery.fn.tagName = function() {
  return this.prop("tagName");
};

var moveColPos_started=0;
var moveColPos_post=0;
function moveColPos(e,finalSet){
	var obj=e.target;
	var curCOLMouseXY=e.pageY+" "+e.pageX;
	if(obj!=null && startColPos_last!=null && curCOLMouseXY!=lastCOLMouseXY){
		moveColPos_started=1;
			moveColPos_post=0;
			var cols=0;
			var currCOl=0;
		var thisTD=obj;
		//alert($(thisTD).prop("tagName"))
		if($(thisTD).tagName()!=null && $(thisTD).tagName()!="TD" && $(thisTD).tagName()!="TH"){
			thisTD=$(thisTD).parents("td:first,th:first")[0];
		}
		if($(obj).parents(".mainTB1:first").size()==1){ //on table
			$(obj).parents("tr:first").find("th,td").each(function(){
				if($(this).attr("class")==$(thisTD).attr("class")){
					currCOl=cols;
				}
				cols++;
			});
			
			//if(finalSet!=null)alert($(thisTD).tagName()+" " +currCOl+" "+$(obj).parents(".mainTB1:first").size() + " "+$(obj).parents("tr:first").find("th,td").size());
		}else{//not on table
			
		}
		if(currCOl>1){//position marker
			moveColPos_post=currCOl;
		}
		if(finalSet==null){
			$(".colPosMov").css({             
	            top: (e.pageY + 20) + "px",             
	            left: (e.pageX + 20) + "px",     
	            display:"block"
	        });   
	        if(currCOl>1){
		        var currTH=$(".mainTB1 .list thead tr th:eq("+moveColPos_post+")");
		        var currTHPOS=currTH.offset();
		        $(".colMarker").css({             
		            top: (currTHPOS.top-8) + "px",             
		            left: (currTHPOS.left-3) + "px",     
		            display:"block"
		        });
		        if(startColPos_origCOl!=currCOl){
		        	$(".colPosMov").find(".ico").removeClass("no").addClass("ok");
		        }else{
		        	$(".colPosMov").find(".ico").removeClass("ok").addClass("no");
		        }   
	        }else{
	        	$(".colPosMov").find(".ico").removeClass("ok").addClass("no");
	        }
        }
	}
}
function stopColPos(e){
	
	if(startColPos_last!=null){
		if(moveColPos_post==0){
			moveColPos(e,1);
		}
		
		var cols=0;
		var origCOl=0;
		$(".mainTB1 .list th").each(function(){
			if($(this).attr("class")==$(startColPos_last).attr("class")){
				origCOl=cols;
			}
			cols++;
		});
		if(moveColPos_post>0 && moveColPos_post!=origCOl){
			 $(".mainTB1 .list tr").each(function() { 
	            $(this).children(":eq("+moveColPos_post+")").before($(this).children(":eq("+origCOl+")"));
	        });
	       $(".colPosMov,.colMarker").remove();
	       //$(".filterino").remove();
	       reorderColumns(origCOl,moveColPos_post);
	       setTimeout(showSaveAlert,500);
        }else if( moveColPos_post==0 || moveColPos_post==origCOl){
        	var currTH=$(".mainTB1 .list thead tr th:eq("+origCOl+")");
		        var currTHPOS=currTH.offset();
		        $(".colMarker").animate({             
		            top: (currTHPOS.top-8) + "px",             
		            left: (currTHPOS.left-3) + "px"
		        },function(){$(".colMarker").remove();});  
		        $(".colPosMov").animate({             
		            top: (currTHPOS.top) + "px",             
		            left: (currTHPOS.left) + "px"
		        },function(){$(".colPosMov").remove();}); 
        }
		startColPos_last=null;
		stopProp1(e);
		$("body").enableSelection();
		setTimeout(function(){moveColPos_started=0;},500);
		return false;
	 }
	 setTimeout(function(){moveColPos_started=0;},500);
}
function clearColPos(){
	$(".colPosMov,.colMarker").remove();
	startColPos_last=null;
}

function massDeleteSelected(){
	trackEventX('massDeleteSelected');
var c1=$('.lcbX input:checked').size();
if(c1==0){
   alert('Please select at least one row.');
   return false;
}else if(licenseStatus!='Active' && c1>50){ 
		alert("During the free trial mass-delete is limited to 50 rows per shot.\n\nUse our website http://www.zaapit.com/page/pricing or contact sales@zaapit.com to activate your license!"); 
		return false; 
}else if(!confirm('Are you sure you want to delete the selected rows ('+c1+')?')){ 
	return false;
}else{
	loadingSH();
	return true;
}

}

function massDeleteAll(){

	if(licenseStatus!='Active' && totRowsForFOUNDONQ>50){ 
			alert("During the free trial mass-delete is limited to 50 rows per shot.\n\nUse our website http://www.zaapit.com/page/pricing or contact sales@zaapit.com to activate your license!"); 
			return false; 
	}else if(!confirm('Are you sure you want to DELETE ALL the rows ('+totRowsForFOUNDONQ+')?\n\nPlease note that the filters and search will remain the same after the deletion is completed.\nMeaning, you will see 0 results on this page.')|| !confirm('Are you sure?\n\nThis is the second and last confirm for Delete ALL!')){
		return false;
	}else{
		loadingSH();
		return true;
	}
}
function trackEventX(str){
	try{
	var orgid_subscr_pg=orgID+"~"+EntitySubscription_SubscriberId+"~"+confName+"";
	ga('send', 'event', str, ''+orgid_subscr_pg, {'campaignName':'zp-app','eventLabel':str,
	  'campaignSource':orgID,
	  'campaignMedium': 'app',
	  'utm_content' :"main"});
	  }catch(e3){}
}
function filpEditModeJS(){
	trackEventX('filpEditModeJS1');
	filpEditModeJS1();
}
function trackgaX(){
	try{
	var language = window.navigator.userLanguage || window.navigator.language;
	if(language==null){
		language="-";
	}
	language=escape(language);
	var availHeight=window.screen.availHeight;
	var availWidth=window.screen.availWidth;
	var colorDepth=escape(screen.colorDepth);
	var loc5=(self.location.href+"");
	var loc5Rel=escape(loc5.substring(loc5.indexOf(".com")+4));
	loc5=escape(loc5);
	var orgid_subscr_pg=orgID+"~"+EntitySubscription_SubscriberId+"~"+confName;
	//var ga1="https://www.google-analytics.com/__utm.gif?utm_campaign=zp-app&utmwv=4&utmn="+new Date().getTime()+"&utmhn=zaapit.com&utmcs=-&utmsr="+availWidth+"x"+availHeight+"&utmsc="+colorDepth+"&utmul="+language+"&utmje=1&utmcn=1&utmdt=title&utmhid=20160915553&utm_source=zp-app&utm_content="+orgID+"&utme="+EntitySubscription_SubscriberId+"&utm_medium=app&utmac=UA-25982415-1&utmp="+loc5Rel+"&utmr="+(loc5)+"";
	//if($("#imageTRKga").size()>0){
	//	$("#imageTRKga").attr("src",ga1);
	//}
	
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-25982415-3', {'campaignName':'zp-app',
	  'campaignSource':orgID,
	  'campaignMedium': 'app',
	  'utm_content' :"main"});
	  ga('send', 'pageview');
	  trackEventX('enterPage');
	  /*ga('send', 'event', 'enterPage', ''+orgid_subscr_pg, {'campaignName':'zp-app',
	  'campaignSource':'zp-app',
	  'campaignMedium': 'app',
	  'utm_content' :"main"});
	  */
	  //alert("+++");
	  }catch(e3){}
}
var searchSelMainObj=null;
function openSearchSel(obj,event){
	if(!isSF1()){
		searchSelMainObj=obj;
		if($(".searchSelMainOut:visible").size()==1){
			$(".searchSelMainOut:visible").hide();
		}else{	
			//$(".searchSelMainOut").remove();
			if($(".searchSelMainOut").size()==0){
				$("body").append("<span class='searchSelMainOut'><input type='search' placeholder='"+Search_label+"' class='searchSelMainIn' value='' onkeyup='searchSelX(this);' onsearch='searchSelX(this);' onmouseup='searchSelX(this);' onkeydown='searchSelUPDWX(event);'/><div class='searchSelMainOpts'/></span>");
				var ObjPos=$(obj).offset();
				$(".searchSelMainOut").css({"position":"absolute","top":(ObjPos.top+$(obj).height()+3)+"px","left":ObjPos.left+"px","z-index":1005,"width":($(obj).width()+20)+"px"});
			}else{
				$(".searchSelMainOut").show();
			}
			var html11=$(obj).html();
			//alert(html11);
			html11=html11.replace(/\<option/ig,"<span class='opt' ");
			html11=html11.replace(/\/option\>/ig,"/span>");
			$(".searchSelMainOpts").html(html11);
			$(".searchSelMainOut .searchSelMainOpts .opt[selected]").addClass("sel");
			$(".searchSelMainIn").focus();
		}
			$(".searchSelMainOut .searchSelMainOpts .opt").click(function(){
			$(".searchSelMainOut .opt.sel").removeClass("sel");
			$(this).addClass("sel");
			$(searchSelMainObj).val($(this).attr("value")).change();
			$(".searchSelMainOut:visible").hide();
		});
		searchSelX($(".searchSelMainIn")[0]);
		return false;
	}else{
		return true;
	}

}
function openSelXDP(obj,e){ 

	if (!isSF1() && e.keyCode == '40') {// down arrow
		openSearchSel(obj,e);
		return false;
	}
	return isSF1();
}
function searchSelX(obj){
	var valToSearch=$(obj).val().toLowerCase();
	$(".searchSelMainOpts .opt").each(function(){
		if(valToSearch=="" || $(this).text().toLowerCase().indexOf(valToSearch)>-1){
			$(this).show();
		}else{
			$(this).hide();
		}
	});
}
function searchSelUPDWX(e){

	var curSel=$(".searchSelMainOut .opt.HOV");
	var newSel=null;
	var posHOVChanged=false;
    e = e || window.event;

    if (e.keyCode == '38') {// up arrow
    	posHOVChanged=true;
    	if(curSel.size()>0){
    		var prev1=curSel.prev();
    		while(prev1!=null && prev1.hasClass("opt")&& !prev1.is(":visible")){
    			prev1=prev1.prev();
    		}
    		if(prev1!=null){
    			newSel=prev1;
    		}
    	}else{
    		newSel=$(".searchSelMainOut .opt:visible:last");
    	}
        
    }
    else if (e.keyCode == '40') {// down arrow
        posHOVChanged=true;
        if(curSel.size()>0){
    		var next1=curSel.next();
    		while(next1!=null && next1.hasClass("opt") && !next1.is(":visible")){
    			next1=next1.next();
    		}
    		if(next1!=null){
    			newSel=next1;
    		}
    	}else{
    		newSel=$(".searchSelMainOut .opt:visible:first");
    	}
    }
    else if (e.keyCode == '13' || e.keyCode == '9') {//enter or tab
       if(curSel.size()>0) curSel.click();
    }
    else if (e.keyCode == '37') {
       // left arrow
    }
    else if (e.keyCode == '39') {
       // right arrow
    }else{
    	
    }
    if(posHOVChanged){
	    if(curSel.size()>0) curSel.removeClass("HOV");
	    if(newSel!=null && newSel.size()>0){
	    	newSel.addClass("HOV");
	    	$(".searchSelMainOpts").animate({ scrollTop: newSel.position().top-20}, 10);
	    }
    }
    return 

}