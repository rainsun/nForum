	<{include file="s_nav.tpl" nav_left="�������"}>
        <div class="b-content">
            <table class="board-list tiz" cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <th class="title_8">���</th>
                    <th class="title_9 middle">����</th>
                    <th class="title_10">����ʱ��</th>
                    <th class="title_12">|&ensp;����</th>
                    <th class="title_11 middle">�ظ�</th>
                    <th class="title_10">���»ظ�</th>
                    <th class="title_12">|&ensp;����</th>
            	</tr>
                </thead>
<{if ($info)}>
<{foreach from=$info item=item key=k}>
				<tr>
					<td class="title_8"><{$k+1}>.</td>
					<td class="title_9">
						<a href="<{$base}>/article/<{$item.bName}>/<{$item.gid}>"><{$item.title}></a>
		<{if $item.page>7}>
		<span class="threads-tab">[<{section name=temp loop=7 start=2}><a href="<{$base}>/article/<{$item.bName}>/<{$item.gid}>?p=<{$smarty.section.temp.index}>"><{$smarty.section.temp.index}></a><{/section}>..<a href="<{$base}>/article/<{$item.bName}>/<{$item.gid}>?p=<{$item.page}>"><{$item.page}></a>]</span>
		<{elseif $item.page>1}>
		<span class="threads-tab">[<{section name=temp loop=$item.page+1 start=2}><a href="<{$base}>/article/<{$item.bName}>/<{$item.gid}>?p=<{$smarty.section.temp.index}>"><{$smarty.section.temp.index}></a><{/section}>]</span>
		<{/if}>
					</td>
					<td class="title_10"><{$item.postTime}></td>
                    <td class="title_12">|&ensp;<a href="<{$base}>/user/query/<{$item.poster}>" class="c63f"><{$item.poster}></a></td>
					<td class="title_11 middle"><{$item.num}></td>
					<td class="title_10"><a href="<{$base}>/article/<{$item.bName}>/<{$item.gid}>?p=<{$item.page}>#a<{$item.num}>" title="��ת�����ظ�"><{$item.replyTime}></a></td>
                    <td class="title_12">|&ensp;<a href="<{$base}>/user/query/<{$item.poster}>" class="c09f"><{$item.last}></a></td>
				</tr>
<{/foreach}>
			</table>
<{else}>
				<tr>
					<td colspan="7" style="text-align:center">û���������κ�����</td>
				</tr>
			</table>
<{/if}>
    	</div>
    <div class="t-pre-bottom">
        <div class="page">
            <{include file="pagination.tpl" page_name='������'}>
        </div>
    </div>  
