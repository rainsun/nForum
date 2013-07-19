<script id="tmpl_user" type="text/template">
<section class="u-query">
    <%if(id){%>
    <header class="u-name">
        <span><%=id%></span>
        <%if(session_login){%>
        <a href="<{$base}>/mail/send?id=<%=id%>" id="u_query_mail">���ʺ���</a>|<a href="javascript:void(0)" id="u_query_add">��Ϊ����</a>
        <%}%>
    </header>
    <article class="u-info">
        <header>������Ϣ</header>
        <figure>
        <img src="<%-face_url%>"<%if(face_width != 0){%> width="<%=face_width%>px"<%}%><%if(face_height != 0){%> height="<%=face_height%>px"<%}%> />
        </figure>
        <dl>
            <dt>�� �ƣ�</dt>
            <dd><%-user_name%></dd>
        <%if(id == session_id || !is_hide || session_is_admin){%>
            <dt>�� ��</dt>
            <dd><%if(gender=='m'){%>����<%}else{%>Ů��<%}%></dd>
            <dt>�� ����</dt>
            <dd><%=astro%></dd>
        <%}%>
            <dt>QQ��</dt>
            <dd><%-qq%></dd>
            <dt>MSN��</dt>
            <dd><%-msn%></dd>
            <dt>�� ҳ��</dt>
            <dd><%-home_page%></dd>
        </dl>
    </article>
    <div class="clearfix"></div>
    <article class="u-info u-detail">
        <header>��̳����</header>
        <dl class="">
            <dt>��̳�ȼ���</dt>
            <dd><%=level%></dd>
            <dt>����������</dt>
            <dd><%=post_count%>ƪ</dd>
        <%if(id == session_id || session_is_admin){%>
            <dt>��½������</dt>
            <dd><%=login_count%></dd>
        <%}%>
            <dt>��������</dt>
            <dd><%=life%></dd>
        <%if(id == session_id || session_is_admin){%>
            <dt>ע��ʱ�䣺</dt>
            <dd><%=first_login_time%></dd>
        <%}%>
            <dt>�ϴε�¼��</dt>
            <dd><%=last_login_time%></dd>
            <dt>������IP��</dt>
            <dd><%=last_login_ip%></dd>
            <dt>��ǰ״̬��</dt>
            <dd><%=status%></dd>
        </dl>
    </article>
    <%}%>
    <footer class="u-search">
        <form method="get">
        <label>��ѯ�û�:</label>
        <input class="input-text" id="u_search_u"type="text" value="" />
        <input class="button" id="u_query_search" type="submit" value="��ѯ" />
        </form>
    </footer>
</section>
</script>
