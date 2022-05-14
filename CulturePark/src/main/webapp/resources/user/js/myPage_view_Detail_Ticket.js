function viewDetail() {
    window.open("/viewDetail.do", "myPage_viewDetail", "width=500, height=600, left=100, top=50");
}

/* viewDetail 입장안내*/
$( document ).ready( function() {
    $( 'button.booking_admission_btn' ).click( function() {
        $( '.booking_admission_content_toggle' ).slideToggle();
    } );
} );

function viewTicket() {
    window.open("/viewTicket.do", "myPage_viewTicket", "width=400, height=600, left=50, top=100");
}

function bookingCancel(){
    window.open("myPage_viewCancel", "myPage_viewCancel","width=400, height=600, left=50, top=100");
}

