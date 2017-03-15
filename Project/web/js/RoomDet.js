var addCount = 0;
var delCount = 0;
var no = 0;

$('.add').click(function() {
    arguments.callee.count = ++arguments.callee.count || 1;
    addCount = arguments.callee.count;
    no = addCount - delCount;

    var start = '<div class="row row' + String(no) + '"><div class="col-md-3"></div>';
    var room_id = '<div class="col-md-2 col-xs-4"><input name="Room_Id' + String(no) + '" required placeholder="Room ID" /></div>';
    var room_name = '<div class="col-md-2 col-xs-4"><input name="Room_name' + String(no) + '" required placeholder="Room Name" /></div>';
    var capacity = '<div class="col-md-2 col-xs-4"><input name="Capacity' + String(no) + '" required placeholder="Capacity" /></div>';
    var end = '<div class="col-md-3"></div></div>';
    var html = start + room_id + room_name + capacity + end;
    $('.rooms').append(html);
    $('input[name="no"]').val(no);

    if (no > 0) {
        $('.delete').prop('disabled', false);
    }
});

$('.delete').click(function() {
    arguments.callee.count = ++arguments.callee.count || 1;
    delCount = arguments.callee.count;
    no = addCount - delCount;

    $('.row' + String(no + 1)).remove();
    $('input[name="no"]').val(no);

    if (no <= 0) {
        $('.delete').prop('disabled', true);
    }
});
