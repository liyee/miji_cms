<?php


namespace App\Admin\Extensions\Tools;


class TestAgain extends \Encore\Admin\Grid\Tools\BatchAction
{

    protected $from;
    protected $action;

    /**
     * TestAgain constructor.
     * @param $action
     */
    public function __construct($from = 2, $action = 4)
    {
        $this->from = $from;
        $this->action = $action;
    }


    /**
     * @inheritDoc
     */
    public function script()
    {
        // TODO: Implement script() method.
        return <<<EOT

$('{$this->getElementClass()}').on('click', function() {

    $.ajax({
        method: 'post',
        url: '{$this->resource}/re_status',
        data: {
            _token:LA.token,
            ids: $.admin.grid.selected().join(),
            from: {$this->from},
            action: {$this->action}
        },
        success: function () {
            $.pjax.reload('#pjax-container');
            toastr.success('Succeed');
        }
    });
});

EOT;
    }
}
