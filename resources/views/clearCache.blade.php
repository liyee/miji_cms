<li><a href="javascript:;"><span class="glyphicon glyphicon-trash clear-cache" aria-hidden="true"></span></a></li>
<script>
    $(function () {
        $('.clear-cache').click(function () {
            $.get("{{env('APP_URL')}}/admin/clearCache", function (data) {
                $.admin.toastr.success('Clear Cache succeeded', '', {positionClass: "toast-top-center"});
            });
        });
    });
</script>
