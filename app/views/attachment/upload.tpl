<div id="upload">
    <div id="upload_op">
        <input id="upload_select" type="button" value="ѡ���ļ�" class="submit" />
        <input id="upload_upload" type="button" value="�ϴ��ļ�" class="submit" />
        <span id="upload_info">
            ��������:<span class="upload-max-num"><{$maxNum}></span>
            ��С����:<span class="upload-max-size"><{$maxSize}></span>
            <span class="upload-msg"></span>
        </span>
    </div>
    <table id="upload_result">
        <thead>
            <tr>
                <th style="width:40px;">���</td>
                <th>�ļ���</td>
                <th style="width:60px;">��С</td>
                <th style="width:60px;">����</td>
            </tr>
        </thead>
        <tbody>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4">��<span style="color:red" id="upload_num_count"></span>���ļ����ܴ�С<span style="color:red" id="upload_size_count"></span></td>
            </tr>
        </tfoot>
    </table>
</div>
<script id="tmpl_upload_file" type="text/template">
<td><%=no%>.</td>
<td><%-name%>
<%if(status===plupload.QUEUED){%>
<span style="color:blue">(׼���ϴ�)</span>
<%}else if(status===plupload.UPLOADING){%>
<span style="color:blue">(<%=percent%>%)</span>
<%}else if(status===plupload.DONE){%>
<span style="color:green">(�ϴ��ɹ�)</span>
<%}else if(status===plupload.FAILED){%>
<span style="color:red">(�ϴ�ʧ��:<%=err%>)</span>
<%}%>
</td>
<td><%=$.sizeFormat(size)%></td>
<td><a href="javascript:void(0)">
<%if(status===plupload.DONE || status===plupload.XWNONE ){%>
ɾ��
<%}else{%>
<span style="color:blue">ȡ��</span>
<%}%></a></td>
</script>
