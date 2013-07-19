<style>
#a_manage samp{width:16px;height:17px}
.list-block {padding-top:6px;}
#a_manage .list-block ul{overflow:hidden;*zoom:1}
#a_manage .list-block li{float:left;margin-right:10px;width:220px;height:18px}
</style>
<script id="tmpl_manage" type="text/template">
<form id="a_manage" action="<%=action%>" method="post">
    <section class="list-block" id="manage_op">
        <header>��ƪ����</header>
        <ul class="narrow">
            <li>
                <input name="i1" value="g" type="checkbox">&nbsp;<span>����/ȡ��g���(<samp class="ico-pos-article-g"></samp>)</span>
            </li>
            <li>
                <input name="i2" value="m" type="checkbox">&nbsp;<span>����/ȡ��m���(<samp class="ico-pos-article-m"></samp>)</span>
            </li>
            <li>
                <input name="i3" value=";" type="checkbox">&nbsp;<span>����/ȡ�����ɻظ����(<samp class="ico-pos-article-lock"></samp>)</span>
            </li>
            <li>
                <input name="i4" value="top" type="checkbox">&nbsp;<span>����������/ȡ���ö�(<samp class="ico-pos-article-top"></samp>)</span>
            </li>
            <li>
                <input name="i5" value="%" type="checkbox">&nbsp;<span>����/ȡ�������(��)</span>
            </li>
            <li>
                <input name="i6" value="x" type="checkbox">&nbsp;<span>����/ȡ��X���(X)</span>
            </li>
            <li>
                <input name="i7" value="sharp" type="checkbox">&nbsp;<span>����/ȡ���|���(�|)</span>
            </li>
        </ul>
    </section>
    <section class="list-block" id="manage_top">
        <header>ͬ����(�ӵ�ǰ���¿�ʼ)</header>
        <ul class="narrow">
            <li>
                <input name="i1" value="d" type="checkbox">&nbsp;<span>ͬ����ɾ��</span>
            </li>
            <li>
                <input name="i2" value="dx" type="checkbox">&nbsp;<span>ͬ����X����ɾ��</span>
            </li>
            <li>
                <input name="i3" value="m" type="checkbox">&nbsp;<span>����m���(<samp class="ico-pos-article-m"></samp>)</span>
            </li>
            <li>
                <input name="i4" value="um" type="checkbox">&nbsp;<span>ȡ��m���(<samp class="ico-pos-article-m"></samp>)</span>
            </li>
            <li>
                <input name="i5" value=";" type="checkbox">&nbsp;<span>���ò��ɻظ����(<samp class="ico-pos-article-lock"></samp>)</span>
            </li>
            <li>
                <input name="i6" value="u;" type="checkbox">&nbsp;<span>ȡ�����ɻظ����(<samp class="ico-pos-article-lock"></samp>)</span>
            </li>
            <li>
                <input name="i7" value="x" type="checkbox">&nbsp;<span>����X���(X)</span>
            </li>
            <li>
                <input name="i8" value="ux" type="checkbox">&nbsp;<span>ȡ��X���(X)</span>
            </li>
        </ul>
    </section>
    <input type="hidden" id="a_manage_gid"name="gid" value="<%=gid%>" />
</form>
</script>
<script id="tmpl_deny" type="text/template">
<form id="a_deny" action="<%=action%>" method="post">
    <section class="list-block">
        <header>��<%=board%>����<%=userid%></header>
        <ul class="narrow">
            <li>
                <span>�������:</span><input type="text" class="input-text" name="reason" /><select id="a_deny_reasons"><option value="">ѡ��������</option>
<%=_.reduce(reason,function(ret,item){
    ret += ('<option value="' + item.desc + '">' + item.desc + '</option>');
    return ret;
},'')%>
                </select>
            </li>
            <li>
                <span>�������:</span><input type="text" class="input-text" name="day"><span>(1-<%=maxday%>��)</span>
            </li>
        </ul>
    </section>
</form>
</script>
