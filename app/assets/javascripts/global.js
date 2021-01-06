const CNPMPttkht = {
  init: function() {
    Utils.init();
    const $from = $("#from")
    const $to = $("#to")

    const validDate = ($sel) => {
      let isEmpty = !$to.val() || !$from.val()
      if(!isEmpty && moment($to.val(), 'DD/MM/YYYY').isBefore($from.val())) {
        $sel.val("")
      }
    }
    
    $from.datepicker().on('changeDate', function(e) {
      $from.val(e.target.value);
      validDate($to)
    });

    $to.datepicker().on('changeDate', function(e) {
      $to.val(e.target.value);
      validDate($from)
    });
  }
}