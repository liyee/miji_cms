<?php
namespace App\Admin\Extensions;

use Encore\Admin\Admin;
use Encore\Admin\Grid\Displayers\AbstractDisplayer;

class Popover extends AbstractDisplayer
{
    public function display($placement = 'left')
    {
        if (strlen($this->value) <= 51) return $this->value;
        Admin::script("$('[data-toggle=\"popover\"]').popover()");
        $con = substr($this->value, 0, 51) . '...';
        return <<<EOT
<button type="button"
    class="btn btn-secondary"
    data-container="body"
    data-toggle="popover"
    data-placement="$placement"
    data-trigger="focus"
    data-content="{$this->value}"
    >
  $con
</button>
EOT;
    }
}

?>
