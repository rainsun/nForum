<{include file="../plugins/mobile/views/header.tpl"}>
<form action="<{$mbase}>/user/login" method="post">
<{if $islogin}>
<ul class="sec slist">
<li class="f">��ǰ�û�:<{$id}></li>
<li>�ȼ�:<{$level}></li>
<li>������:<{$postNum}></li>
<{else}>
<ul class="sec">
<li>
�û���:<br/> 
<input type="text" name="id" />
</li>
<li>
����:<br/> 
<input type="password" name="passwd" />
</li>
<li>
<input type="checkbox" name="save" />��ס��<br/>
<input type="submit" class="btn" value="��¼" /> 
</li>
<{/if}>
</ul>
</form>
<ul class="slist sec">
<li class="f">ʮ�����Ż���</li>
<{foreach from=$top item=item key=k}>
<li><{$k+1}>|<a href="<{$mbase}><{$item.url}>"><{$item.text}></a></li>
<{/foreach}>
</ul>
<{include file="../plugins/mobile/views/footer.tpl"}>
