<{include file="../plugins/mobile/views/header.tpl"}>
<{if $parent}>
<div class="sec sp">
	<a href="<{$mbase}><{$parent}>">��һ��</a>
</div>
<{/if}>
<ul class="slist sec">
<{if $boards}>
<{foreach from=$boards item=item}>
<li<{cycle values=', class="hl"'}>><{if $item.dir}><font color="#f60">Ŀ¼</font><{else}>����<{/if}>|<a href="<{$mbase}><{$item.url}>"><{$item.name}></a>|<{if isset($item.hot)}><a href="<{$mbase}><{$item.hot}>" style="color:#f00">�ȵ�</a><{/if}></a></li>
<{/foreach}>
<{else}>
<li>û���κΰ���</li>
<{/if}>
</ul>
<{include file="../plugins/mobile/views/footer.tpl"}>
