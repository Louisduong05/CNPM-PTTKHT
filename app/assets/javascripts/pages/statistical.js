CNPMPttkht.statistical = {
  index: {
    init: function() {
      $( "#submit_search" ).on('click', function() {
        let toDate = $('#to').val();
        let fromDate = $('#from').val();
        let searchType = $('#type').val();
        let productId = $('#product').val();
        let data = {
          to_date: toDate,
          from_date: fromDate,
          type: searchType,
          product_id: productId
        }
        if (data !== {}) {
          $.ajax({
              type:    "GET",
              url:     "api/statistical",
              data:    data,
              success: (res) => {
                let data_form = formatData(res.result);
                addLabel(searchType)
                console.log(data_form);
                getTable(data_form);
              },
              error:   function(get){ console.log(this) }
            });
        }
      });

      const getTable = (data) => {
        $("#table-stastic").empty();
        let tabledata = data;
        console.log(tabledata)
        //initialize table
        let table = new Tabulator("#table-stastic", {
            data:tabledata,
            dataTree:true, //assign data to table
            layout:"fitDataStretch",
            dataTreeStartExpanded:true,
            columns:[  
              {title:"Id", field:"id"},
              {title:"Tên sản phẩm", field:"product_name"},
              {title:"Số lượng", field:"quantity"},
              {title:"Giá", field:"price"},
              {title: "Thời gian", field:"time"},
              {title: "Người nhập", field: "users"}
          ],
        });
        
        return table
      }

      const addLabel = (type) => {
        $('#label-stastic').empty();
        if (type == 'Import') {
          $('#label-stastic').append("<h1> Thống kê nhập hàng </h1>")
        } else {
          $('#label-stastic').append("<h1> Thống kê xuất hàng </h1>")
        }

      }

      const formatData = (result) => {
        let data = [];
        result.forEach(rs => {
          const price_product = rs.price_range_max == rs.price_range_min ? rs.price_range_max : rs.price_range_min + ' ~ ' + rs.price_range_max
          const user_map = rs.details.map(detail => detail.user)
          const users = [...new Set(user_map)].join(', ')
          const time = rs.from + ' ~ ' + rs.to
          const quantity_product = rs.details.map(detail => detail.quantity).reduce((a, b) => parseInt(a) + parseInt(b), 0)
          let temporary = {
            product_name: rs.product_name,
            id: rs.product_id,
            price: price_product,
            time: time,
            users:  users,
            quantity: quantity_product
          }
          if (rs.details.length > 1) {
            temporary._children = formatChild(rs.details, rs.product_name)
          }
          data.push(temporary)
        });

        return data;
      }

      const formatChild = (child, name) => {
        data = []
        child.forEach( chi => {
          data.push({
            time: chi.created_at,
            quantity: chi.quantity,
            price: chi.unit_price,
            users: chi.user,
            product_name: name,
            id: chi.imported_id
          })
        })
        
        return data;
      }
    }
  }
}