({ doInit : function(component, event, helper){
         
        if (typeof require !== "undefined") {
            //var evt = $A.get("e.forcelogic2:BlogRequireJSEvent");
            //evt.fire();
        } else {
            var head = document.getElementsByTagName('head')[0];
            var script = document.createElement('script');
             
            script.src = "/resource/zaapit_actions_lightning"; 
            script.type = 'text/javascript';
            script.key = "/resource/zaapit_actions_lightning"; 
            script.helper = this;
            script.id = "script_" + component.getGlobalId();
            var hlp = helper;
           // script.onload = function scriptLoaded(){
           //     var evt = $A.get("e.forcelogic2:BlogRequireJSEvent");
           //     evt.fire();
           // };
            head.appendChild(script);
        }
    },
	myAction : function(component, event, helper) {
		
	}
})