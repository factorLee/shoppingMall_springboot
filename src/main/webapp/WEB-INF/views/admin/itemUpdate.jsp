<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script	src="/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/assets/vendors/mdi/css/materialdesignicons.min.css" />
    <link rel="stylesheet" href="/assets/vendors/flag-icon-css/css/flag-icon.min.css" />
    <link rel="stylesheet" href="/assets/vendors/css/vendor.bundle.base.css" />
    <link rel="stylesheet" href="/css/adminStyle.css" />
    <link rel="stylesheet" href="/assets/css/custom.css" />
    <link rel="shortcut icon" href="/assets/images/favicon.png" />
    
<!-- ckeditor -->
<script src="/js/ckeditor/ckeditor.js"></script>
</head>
  <body>
    <div class="container-scroller">
      <%@ include file="../common/sidebar.jsp" %>
      
      <div class="container-fluid page-body-wrapper">

        <nav class="navbar col-lg-12 col-12 p-lg-0 fixed-top d-flex flex-row">
          <div class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
            <a class="navbar-brand brand-logo-mini align-self-center d-lg-none" href="#"><img src="/assets/images/logo-mini.svg" alt="logo" /></a>
            <button class="navbar-toggler navbar-toggler align-self-center mr-2" type="button" data-toggle="minimize">
              <i class="mdi mdi-menu"></i>
            </button>

            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
              <span class="mdi mdi-menu"></span>
            </button>
          </div>
        </nav>
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h1 class="page-title"><b>?????? ??????</b></h3>
            </div>
            
            <!-- ???????????? form -->
			<div class="col-md-12">
				<div class="contact-form form-center">
					<form id="form" name="form" method="post" enctype="multipart/form-data"> <!--  action="/web/register.do" method="post"> -->
						<div class="col-md-12">
							<div class="form-group">
			            		<label class="label-control">?????? ?????????</label>
				            	<div id="image_preview">
									<img src="/image/150150.png" alt="????????????"  style="width:150px; height:150px;">
								</div>
								<div class="f_box">
									<label for="img">????????????</label>
									<input type="file" id="img" name="file1">
								</div>	
							    <script>
	                            // ????????? ?????????
	                            $('#img').on('change', function() {
	                            ext = $(this).val().split('.').pop().toLowerCase(); //?????????
	                            //????????? ????????? ???????????? ??????????????? ??????
	                            if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	                                resetFormElement($(this)); //??? ?????????
	                                window.alert('????????? ????????? ????????????! (gif, png, jpg, jpeg ??? ????????? ??????)');
	                            } else {
	                                file = $('#img').prop("files")[0];
	                                blobURL = window.URL.createObjectURL(file);
	                                $('#image_preview img').attr('src', blobURL);
	                                $('#image_preview').slideDown(); //???????????? ????????? ???????????? 
	                                /* $(this).hide(); //?????? ?????? ?????? */
	                                
	                        /*         //?????? ?????????
	                                $(document).ready(function(){
	                                	var form = new FormData();
		                                form.append( "file1", $("#img")[0].files[0] );
		                                
		                                 jQuery.ajax({
		                                     url : "/web/thumbnailUpload.do"
		                                   , type : "POST"
		                                   , processData : false
		                                   , contentType : false
		                                   , data : form
		                                   , success:function(form) {
		                                	   console.log("form ???:",form);
		                                   }
		                                   ,error: function (jqXHR) 
		                                   { 
		                                       alert("??????"); 
		                                   }
		                               });
	                               		
	                                }); */
	                            }
	                            
	                         
	                            
	                            });
	 							</script>
							</div>
						</div>
						<hr style="margin: 20px; height: 0;">
						<div class="col-md-12">
						  <div class="form-row align-items-center">
								<div class="col-auto my-1">
								  <label class="label-control">?????? ??????</label>
								  <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="pr_category">
								    <option selected>-??????-</option>
								    <option value="1">??????</option>
								    <option value="2">??????</option>
								    <option value="3">??????</option>
								    <option value="4">??????</option>
								  </select>
								</div>
							</div>
						</div>
						<hr style="margin: 20px; height: 0;">
						<div class="col-md-12">
							<div class="form-group">
								<label class="mr-sm-2" for="inlineFormCustomSelect">?????????</label>
								<input type="text" class="form-control" id="inputEmail" required placeholder="" name="pr_title">
							</div>
						</div>
						<hr style="margin: 20px; height: 0;">
						
						<div class="col-md-12">
							<textarea class="form-control " name="pr_contents" id="ckeditor"></textarea>
							 <script>
								CKEDITOR.replace( 'ckeditor', {//?????? ???????????? ??? textarea??? ???????????? ??????
									filebrowserUploadUrl: 'fileupload.do'
									/* filebrowserImageUploadUrl: '/upload.do', */
								
								});
							 </script>
						</div>
						<hr style="margin: 20px; height: 0;">
						<div class="col-md-12">
							<h1>FAQ</h1>
							<div class="col-md-12">
								<div class="form-group">
									<label class="mr-sm-2" for="inlineFormCustomSelect">?????? ?????? ????????????????</label>
									<input type="text" class="form-control" id="inputEmail" required placeholder="" name="pr_faq01">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="mr-sm-2" for="inlineFormCustomSelect">?????? ??? ?????? ????????????????</label>
									<input type="text" class="form-control" id="inputEmail" required placeholder="" name="pr_faq02">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="mr-sm-2" for="inlineFormCustomSelect">????????? ?????? ??????????</label>
									<input type="text" class="form-control" id="inputEmail" required placeholder="" name="pr_faq03">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="mr-sm-2" for="inlineFormCustomSelect">??????????????? ????????? ????????? ??????????</label>
									<input type="text" class="form-control" id="inputEmail" required placeholder="" name="pr_faq04">
								</div>
							</div>
						</div>
						<hr style="margin: 20px; height: 0;">
						<div class="col-md-12">
							<!-- <input type="submit" class="btn btn-dark btn-lg btnBlock" value="????????????"> -->
							<button type="submit" class="btn btn-primary" onclick="test2()">????????????</button>
							<button type="submit" class="btn btn-dark">??????</button>
						</div>
					</form>
				</div>
			</div>
			
			
          </div>
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright ?? ????????? Co., Ltd. 2022</span>
            </div>
          </footer>
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
   
<!--    <script>
   function clkBtn(){

	   var form = $('#form')[0];
	   var formData = new FormData(form);
	   $.ajax({
	   	   type:"post",
	   	   enctype:'multipart/form-data',
	       url:'/web/register.do',
	       data:formData,
	       dataType:'json',
	       processData:false,
	       contentType:false,
	       cache:false,
	       success:function(data){
	       	console.log("success : ", data);
	       },
	       error:function(e){
	           console.log("error : ", e);
	       }
	   });
   }
   </script> -->
   
   
   
<!-- 	<script type="text/javascript">
	// ?????? ?????? ??? ??????
	function clkBtn(){
		// Get form
		var form = $('#form')[0];

		// Create an FormData object 
		var data = new FormData(form);

		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: '/web/register.do',	// form??? ????????? ?????? ????????????
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			beforeSend : function() {
				// ?????? ??? ?????? ??????
			},
			success: function (data) {
				// ?????? ??? ?????? ??? ?????? ??????
				console.log(data);
			},
			error: function (e) {
				// ?????? ??? ?????? ?????? ??? ?????? ??????
				console.log("ERROR : ", e);
			}
		});
	}
    </script> -->
<!-- 	<script>
    $(function(){
        $('#clkBtn').on("click",function () {

            var form1 = $("#form").serialize();

            console.log($("#form"));
            $.ajax({
                type: "POST",
                url: "/web/register.do",
                data: $("#form"),
                dataType: 'text',
                async: true, 
                cache: false,
                contentType: false,
                processData: false,
                success: function (data, status, xhr) {
                    console.log(data);
                    alert("success");
                },
                error: function (request, status, error) {
                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

                }
            });
        });
    });
    	
	</script> -->
<!-- 	
	<script>
	$(function(){
	     $("#uploadbutton").click(function(){
	         var form = $('#form')[0];
	         console.log(form);
	         var formData = new FormData(form);
	             $.ajax({
	                url: '/web/register.do',
	                processData: false,
	                    contentType: false,
	                data: formData,
	                type: 'POST',
	                success: function(result){
	                	console.log(result);
	                    alert("????????? ??????!!");
	                }
	            });
	         });
	})
	</script> -->
	
	<!-- ????????? -->
	
	<script>
	function test2(){
		/* var formData = $('#form').serialize();
		 */
 		var form = new FormData();
		
		console.log(CKEDITOR.instances.ckeditor.getData());
		
 		form.append( "file1", $("#img")[0].files[0] );
        console.log($("select[name=pr_category]").val());
        console.log($("textarea[name=pr_contents]").val());
        form.append("pr_category", $("select[name=pr_category]").val());
        form.append("pr_title", $("input[name=pr_title]").val());
        /* form.append("pr_contents", $("textarea[name=pr_contents]").value()); */
        form.append("pr_contents", CKEDITOR.instances.ckeditor.getData());
        form.append("pr_faq01", $("input[name=pr_faq01]").val());
        form.append("pr_faq02", $("input[name=pr_faq02]").val());
        form.append("pr_faq03", $("input[name=pr_faq03]").val());
        form.append("pr_faq04", $("input[name=pr_faq04]").val()); 
        
        
        
        
    	console.log("form ???:",form);
         $.ajax({
             url : "/web/register.do"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(form) {
           		
           }
           , error: function (jqXHR) 
           { 
               alert("??????"); 
           }
         
       });
	}
	
	</script>
	
	<!-- 
	<script>
    function test2(){
    	
        form = $("#form")[0];
        var formData = new FormData(form);
        console.log($("input[name=pr_contents]").val());

      /*    
        formData.append("pr_thumbnail", $("input[name=pr_thumbnail]").val());
		formData.append("pr_category", $("input[name=pr_category]").val());
        formData.append("pr_title", $("input[name=pr_title]").val());
        formData.append("pr_contents", $("input[name=pr_contents]").val());
        formData.append("pr_faq01", $("input[name=pr_faq01]").val());
        formData.append("pr_faq02", $("input[name=pr_faq02]").val());
        formData.append("pr_faq03", $("input[name=pr_faq03]").val());
        formData.append("pr_faq04", $("input[name=pr_faq04]").val()); */
        
        console.log(formData);
        
        $.ajax({
			type: 'POST',
			url: '/web/register.do',
			processData: false,
			contentType: "application/json; charset=utf-8",
			data: formData,
			/* data: formData, */
			dataType: "JSON",
			success: function(formData){
				console.log(formData);
			}, // success 
    
            error : function(xhr, status) {
                alert(xhr + " : " + status + "," + formData);
            }
        }); // $.ajax */    
      
    } 
    
	</script>
     -->
    
    
    
    <!-- container-scroller -->
    <script src="/assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="/assets/js/off-canvas.js"></script>
    <script src="/assets/js/hoverable-collapse.js"></script>
    <script src="/assets/js/misc.js"></script>
    <script src="/assets/js/manage.js"></script>
  </body>

</html>