CNPMPttkht.warehouses = {
  index: {
    init: function() {
      fetch("//localhost:3002/api/warehouses")
        .then(res => res.json())
        .then(warehouses => {
          var ctx = document.getElementById('myChart').getContext('2d');
          $.each(warehouses, function( index, value ) {
            var current = value.current
            var excess_capacity = value.capacity - current
            var name = value.name
            var myChart = new Chart(ctx, {
              type: 'pie',
              data: {
              labels: ["current", "excess capacity"],
              datasets: [{
                label: '# of Votes',
                data: [current, excess_capacity],
                backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)'
                ],
                borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)'
                ],
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
                title: {
                  display: true,
                  position: 'bottom',
                  text: name
                },
              }
          });
          });
        });
    }
  }
}