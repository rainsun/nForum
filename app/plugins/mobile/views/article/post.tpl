<{include file="../plugins/mobile/views/header.tpl"}>
<form action="<{$mbase}>/article/<{$bName}>/<{if isset($edit)}>edit<{else}>post<{/if}><{if $reid!=0}>/<{$reid}><{/if}>" method="post">
<ul class="sec list">
<li>����:<br /><input type="text" name="subject" value="<{$title}>" style="width:100%" /></li>
<li>����:<br /><textarea name="content" style="width:100%" rows="8"><{$content}></textarea></li>
<{if $email}>
<li><input type="checkbox" name="email" />����ת��
<{/if}>
<{if $anony}>
&nbsp;<input type="checkbox" name="anony" checked="true"/>����
<{/if}>
<{if $outgo}>
&nbsp;<input type="checkbox" name="outgo" checked="true"/>ת��
<{/if}>
</li>
<li><input type="submit" class="btn" value="�ύ"/>&nbsp;<input type="button" class="btn" value="����" onclick="javascript:history.go(-1)" /></li>
</ul>
<{if $single}>
<input type="hidden" name="s" value="1" />
<{/if}>
</form>
<{include file="../plugins/mobile/views/footer.tpl"}>
