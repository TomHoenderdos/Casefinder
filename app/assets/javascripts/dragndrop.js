$(document).ready(function() {
    $("#table-devices").tableDnD({
    	onDrop: function(table, row){
        $.ajax({
  				type: 'PUT',
  				url: '/devices',
				dataType: 'json',
				data: { devices: { row_order_position: row.id } },  // or whatever your new position is
			});
    	}
    });
});