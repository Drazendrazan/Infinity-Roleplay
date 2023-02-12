function SetupFaturasPage() {

    setTimeout(function () {

        let faturas = GetData('faturas');

        if (faturas == null) {
            faturas = new Array();
        }

        faturas.sort(DateSortOldest);

        $('.fatura-list').html('');

        $.each(faturas, function (index, fatura) {
            $('.fatura-list').prepend(`
                <div class="fatura">
                    <div class="fatura-title"><b>${fatura.label}</b></div>
                    <div class="fatura-title-sender"><b>Por:</b> ${fatura.sender} </div>
                    <div class="fatura-title-sender"><b>Valor:</b> ${fatura.amount} €</div>
                    <div class="fatura-actions" bId="${fatura.id}" amount="${fatura.amount}" index="${index}"><i class="waves-effect waves-light btn green">Pagar</i></div>
                </div>`
            );
        });
    }, 350);
}

$('.fatura-list').on('click', '.fatura-actions', function (e) {
    $elem = $(this)
    let id = $elem.attr('bId');
    let amount = $elem.attr('amount');
    let index = $elem.attr('index');

    faturas = GetData('faturas');
    $.post(ROOT_ADDRESS + '/PayBill', JSON.stringify({
        id: id,
        amount: amount
    }), function (status) {
        if (status == true) {
            $elem.parent().fadeOut('normal', function () {
                $elem.parent().remove();
            });

            faturas.splice(index, 1);
            StoreData('faturas', faturas);

            $.post(ROOT_ADDRESS + '/sendNotification', JSON.stringify({
                message: 'Pagaste uma fatura!',
                type: 'success'
            }));
        }
        else if (status == -1) {
            $.post(ROOT_ADDRESS + '/sendNotification', JSON.stringify({
                message: 'Dinheiro insuficiente',
                type: 'error'
            }));
        }
        else if (status == -2) {
            $.post(ROOT_ADDRESS + '/sendNotification', JSON.stringify({
                message: 'O destinatário não está na cidade',
                type: 'error'
            }));
        }
        else if (status == -3) {
            $.post(ROOT_ADDRESS + '/sendNotification', JSON.stringify({
                message: 'Ocorreu um erro',
                type: 'error'
            }));
        }
    })
})