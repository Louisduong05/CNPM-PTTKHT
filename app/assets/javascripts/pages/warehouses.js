CNPMPttkht.warehouses = {
  index: {
    init: function() {
      fetch("//localhost:3000/api/warehouses")
        .then(res => res.json())
        .then(warehouses => {
          var ctx = document.getElementById('myChart').getContext('2d');
            var names = []
            var values = []
            $.each(warehouses, function(i, v) {
              names.push(v.name)
              values.push(v.current)
            });
            var myChart = new Chart(ctx, {
              type: 'pie',
              data: {
              labels: names,
              datasets: [{
                label: '# of Votes',
                data: values,
                backgroundColor: palette('tol', values.length).map(function(hex) {
                  return '#' + hex;
                }),
                borderWidth: 1
                }]
              },
              options: {
                scales: {
                  yAxes: [{
                    ticks: {
                      beginAtZero: true
                    }
                  }]
                },
              }
          });
        });
    }
  }
}