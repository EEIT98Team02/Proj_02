$(function() {
	$("#header").load("../commons/header.jsp"); 
	$("#footer").load("../commons/footer.jsp"); 
	var allevent=[];
	var email=Cookies.get('user');
//	$.getJSON('findEventtype.controller', {'selectType':'影視' }, function (data) {
	$.getJSON('getFavorites.controller', {'email':email }, function (data) {
		$.each(data, function (i, event01) {
			var eventallow={
			 		id: 'available'+event01.eventID,
			 	    start: moment(event01.dtStart).format('YYYY-MM-DD HH:mm:ss'),
			 	    end: moment(event01.durationEnd+86400000).format('YYYY-MM-DD HH:mm:ss'),
			 	    allDay:false,
			 	    rendering: 'background'
			 	};
			//alert(event01.targetDate)
			if(event01.targetDate!=0){
			var event= {
		 		id:event01.eventID,
		 		title: event01.eventName,
			    start: moment(event01.targetDate).format('YYYY-MM-DD HH:mm:ss'),
			    constraint: 'available'+event01.eventID,
			 	url:"../_04_EventPage/eventSelf.jsp?eventID="+event01.EventID,
			    allDay:true,
			 	stick: true,
			};allevent.push(event);
		 	}else{
			$('#external-events-listing').append('<div class="fc-event" value='+event01.eventID+
			'>'+event01.eventName+'</div>')
			//'><a href=../_04_EventPage/eventSelf.jsp?eventID='+event01.eventID+</a>
		 	}
		
		allevent.push(eventallow)
		});
		//console.log(allevent)
	var isEventOverDiv = function(x, y) {
			var external_events = $( '#external-events' );
            var offset = external_events.offset();
            offset.right = external_events.width() + offset.left;
            offset.bottom = external_events.height() + offset.top;

            // Compare
            if (x >= offset.left
                && y >= offset.top
                && x <= offset.right
                && y <= offset .bottom) { return true; }
            return false;

        }
		
	/* initialize the external events
	-----------------------------------------------------------------*/

	$('#external-events .fc-event').each(function() {
		// store data so the calendar knows to render an event upon drop
		$(this).data('event', {
			id:$(this).attr('value'),
			title: $.trim($(this).text()), // use the element's text as the event title
			constraint: 'available'+($(this).attr('value')),
			url:"../_04_EventPage/eventSelf.jsp?eventID="+$(this).attr('value'),
			stick: true // maintain when user navigates (see docs on the renderEvent method)
		});
		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});
	});
	/* initialize the calendar
	-----------------------------------------------------------------*/
	$('#calendar').fullCalendar({
		events:allevent,
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		defaultDate: moment(),
		editable: true,
		droppable: true, // this allows things to be dropped onto the calendar
		drop: function() {
			// is the "remove after drop" checkbox checked?
			if ($('#drop-remove').is(':checked')) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			}
		},
		eventDragStart:function(event){
			//alert(event.title+"id:"+event.id);
			var allowplace='available'+event.id;
			//$(#allowplace).rendering= 'background2';
		},
		/*eventDrop: function(event, delta, revertFunc) {
            //alert(event.title + " was dropped on " + event.start.format());
            if (!confirm("Are you sure about this change?")) {
                revertFunc();
            }
        },
        */
        eventDragStop: function( event, jsEvent, ui, view ) {
            if(isEventOverDiv(jsEvent.clientX, jsEvent.clientY)) {
                $('#calendar').fullCalendar('removeEvents', event.id);
                var el = $( '<div class="fc-event">' ).appendTo('#external-events-listing').text( event.title );
                el.draggable({
                  zIndex: 999,
                  revert: true, 
                  revertDuration: 0 
                });
                el.data('event', { title: event.title, id :event.id, stick: true });
            }
        },
        /*eventClick: function(event, element) { 
             
            alert(event.id+event.title);
            $('#calendar').fullCalendar('updateEvent', event); 
        },*/
    	navLinks: true, // can click day/week names to navigate views
		eventLimit: true // allow "more" link when too many events
		});
	});
	

	$('#GGG').click(function(){
		var getallevent=$('#calendar').fullCalendar('clientEvents');
		var data0=[];
		var data1=[];
		$.each(getallevent, function (i, event01) {
			if((event01.id).length<9){
				var id=event01.id
				var date=moment(event01.start).format('YYYY-MM-DD HH:mm:ss')
				data0=('eventid='+id+' '+'targetdate='+date+' email='+email);
				data1.push(data0);
			}
		});
		var getallevent=data1.join();
		$.post('savecalendar.controller',{'getallevent':getallevent,'email':email},function(){
			alert("更新行事曆成功");	
		});
	});
	$('#YYY').click(function(){
		var getallevent=$('#calendar').fullCalendar('clientEvents');
		$.each(getallevent, function (i, event) {
			event.id=(event.id).toString()
			if((event.id).length< 9){
				$('#calendar').fullCalendar('removeEvents', event.id);
				var el = $( "<div class='fc-event'>" ).appendTo('#external-events-listing').text( event.title );
                el.draggable({
                  zIndex: 999,
                  revert: true, 
                  revertDuration: 0 
                });
                el.data('event', { title: event.title, id :event.id, stick: true });
			}
		});
		
		
		
	});

});

