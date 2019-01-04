<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/1/3
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%--上传文件--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //    以斜线开始，不以斜线结束(例如/crud)
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
</head>

<body>
    <h1>Multiple file uploads with process bar</h1>
    <div id="processBar" style="height: 20px;border:2px solid green">
        <div id="bar" style="height: 100%; background: #33dd33; width: 0%">
        </div>
    </div>
    <form>
        <input type="file" id="files" multiple/>
        <br/>
        <output id="selectedFiles"></output>
        <input id="uploadButton" type="button" value="Upload" />
    </form>
    <div id="debug" style="height: 100px;border: 2px solid green; overflow: auto"></div>
</body>

<script>
    var totalFileLength, totalUploaded, fileCount, filesUploaded;
    function debug(s){
        var debug = document.getElementById('debug');
        if(debug){
            debug.innerHTML = debug.innerHTML + '<br/>' + s;
        }

    }

    function onFileSelect(e){
        var files = e.target.files;
        var output = [];
        fileCount = files.length;
        totalFileLength = 0;
        for(var i = 0; i < fileCount; i++){
            var file = files[i];
            output.push(file.name, '(', file.size, 'bytes, ', file.lastModified.toLocaleString(), ')');
            output.push('<br/>');
            debug('add' + file.size);
            totalFileLength += file.size;
        }
        document.getElementById('selectedFiles').innerHTML = output.join(' ');
        debug('totalFileLength:' + totalFileLength);

    }

    function onUploadProcess(e){
        if(e.lengthComputable){
            var percentComplete = parseInt((e.loaded +totalUploaded) * 100 / totalFileLength);
            var bar = document.getElementById('bar');
            bar.style.width = percentComplete + '%';
            bar.innerHTML = percentComplete + '% complete';
        }else{
            debug('unable to compute')
        }
    }

    function onUploadComplete(){
        totalUploaded += document.getElementById('files').files[filesUploaded].size
        filesUploaded++;
        debug('complete ' + filesUploaded + "of" +fileCount);
        debug('totalUploaded: ' + totalUploaded);
        if(filesUploaded < fileCount){
            uploadNext();
        }else{
            var bar = document.getElementById('bar');
            bar.style.width = '100%'
            bar.innerHTML = '100% complete';
            // alert('Finished uploading file(s)')
        }

    }

    function onUploadFailed(){
        alert("Error Uploading file")
    }

    function uploadNext(){
        var xhr = new XMLHttpRequest();
        var fd = new FormData();
        var file = document.getElementById('files').files[filesUploaded];
        fd.append("multipartFile", file);
        xhr.upload.addEventListener("progress", onUploadProcess)
        xhr.addEventListener("load", onUploadComplete, false)
        xhr.addEventListener("error", onUploadFailed, false)
        xhr.open("POST", "file_upload")
        debug('uploading ' + file.name)
        xhr.send(fd)
    }

    function startUpload(){
        totalUploaded = filesUploaded = 0;
        uploadNext();
    }

    window.onload = function () {
        document.getElementById('files').addEventListener('change', onFileSelect, false);
        document.getElementById('uploadButton').addEventListener('click', startUpload, false);

    }

</script>
</html>
