<{include file="../plugins/mobile/views/header.tpl"}>
<ul class="sec slist">
<{if isset($friends)}>
<li class="f">���|
ID|
״̬|
��½IP|
����|
����
</li>
<{foreach from=$friends item=item key=k}>
<li><{$k+1}>.|
<a href="<{$mbase}>/user/query/<{$item.fid}>"><{$item.fid}></a>|
<{$item.mode}>|
<{$item.from}>|
<{$item.idle}>|
<a href="<{$mbase}>/mail/send?id=<{$item.fid}>">�����ʺ�</a></li>
<{/foreach}>
<{else}>
<li class="f">��û���κκ���</li>
<{/if}>
</ul>
<{include file="../plugins/mobile/views/footer.tpl"}>
