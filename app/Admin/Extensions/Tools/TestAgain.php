<?php


namespace App\Admin\Extensions\Tools;


class TestAgain extends \Encore\Admin\Grid\Tools\BatchAction
{

    protected $action;

    /**
     * TestAgain constructor.
     * @param $action
     */
    public function __construct($action = 1)
    {
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
        url: '{$this->resource}/test_again',
        data: {
            _token:LA.token,
            ids: $.admin.grid.selected().join(),
            action: {$this->action}
        },
        success: function () {
            $.pjax.reload('#pjax-container');
            toastr.success('操作成功');
        }
    });
});

EOT;
    }
}
