<li><a href="javascript:;"><span class="glyphicon glyphicon-trash clear-cache" aria-hidden="true"></span></a></li>
<script>
    $(function (){
       $('.clear-cache').click(function (){
           $.get("admin/clearCache", function(data){
               $.admin.toastr.success('Clear succeeded', '', {positionClass:"toast-top-center"});
               // alert("CLEAR SUCCESS");
           });
       });
    });
</script>
