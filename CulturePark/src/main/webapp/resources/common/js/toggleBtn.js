$('.switch input').click(function () {
    var this_switch = $(this);
    var this_row = this_switch.parent().parent();
    this_row.children('.toggle_p').toggle();
});