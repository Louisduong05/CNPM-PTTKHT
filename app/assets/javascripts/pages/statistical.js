CNPMPttkht.statistical = {
  index: {
    init: function() {
      $( "#submit_search" ).click(function() {
        var toDate = $('#toDate').val();
        var fromDate = $('#fromDate').val();
        if (toDate.length == 0 || fromDate.length == 0) {
          alert('Xin nhập đầy đủ nội dung')
          return true;
        }
        var data = {
          to_date: toDate,
          from_date: fromDate
        }
        if (data !== {}) {
            $.ajax({
                type:    "GET",
                url:     "api/statistical",
                data:    data,
                success: function(result){
                  callAPIGet(result);
                },
                error:   function(get){ console.log(this) }
              });
        }
      });

      const callAPIGet = (result) => {
        $("#suppliers").empty();
        $("#customers").empty();
        suppliers = result.suppliers
        customers = result.customers
        console.log(result)
        $.each(suppliers, function(index, supplier) {
          if (supplier.imported_items.lenght !== 0) {
            $( "#suppliers" ).append( "<h2> Import </h2>" );
            $( "#suppliers" ).append( "<h3 class='supplier supplier_name'>" + supplier.supplier_name +"</h2>" );
            $.each(supplier.imported_items, function(index, imported_item) {
              $( "#suppliers" ).append( "<p class='item product_name'> Product name:  </p>" );
              $( "#suppliers" ).append( "<p class='item product_name'>" + imported_item.product_name +"</p>" );
              $( "#suppliers" ).append( "<p class='item quantity'> Quantity: </p>" );
              $( "#suppliers" ).append( "<p class='item quantity'>" + imported_item.quantity +"</p>" );
              $( "#suppliers" ).append( "<p class='item total'> Total: </p>" );
              $( "#suppliers" ).append( "<p class='item total'>" + imported_item.total +"</p>" );
            });
          }
        });

        $.each(customers, function(index, customer) {
          if (customer.exported_items.lenght == 0) {
            return true;
          }
          $( "#customers" ).append( "<h2> Export </h2>" );
          $( "#customers" ).append( "<h3 class='customer customer_name'>" + customer.customer_name +"</h2>" );
          $.each(customer.exported_items, function(index, exported_item) {
            $( "#customers" ).append( "<div class='items exported_item'>");
            $( "#customers" ).append( "<p class='item product_name'> Product name:  </p>" );
            $( "#customers" ).append( "<p class='item product_name'>" + exported_item.product_name +"</p>" );
            $( "#customers" ).append( "<p class='item quantity'> Quantity: </p>" );
            $( "#customers" ).append( "<p class='item quantity'>" + exported_item.quantity +"</p>" );
            $( "#customers" ).append( "<p class='item total'> Total: </p>" );
            $( "#customers" ).append( "<p class='item total'>" + exported_item.total +"</p>" );
            $( "#customers" ).append( "</div>");
          });
        });
      }
    }
  }
}