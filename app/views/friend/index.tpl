    	<div class="mbar corner">
        	<ul>
                <li><a href="<{$base}>/user/info">���������޸�</a></li>
                <li><a href="<{$base}>/user/passwd">�ǳ������޸�</a></li>
                <li><a href="<{$base}>/user/custom">�û��Զ������</a></li>
                <li><a href="<{$base}>/mail">�û��ż�</a></li>
                <li><a href="<{$base}>/refer">��������</a></li>
                <li class="selected"><a href="<{$base}>/friend">�����б�</a></li>
                <li><a href="<{$base}>/fav">�ղذ���</a></li>
            </ul>					
        </div>
        <div class="c-mbar">
			<ul>
            	<li><a href="<{$base}>/friend" class="select"><samp class="ico-pos-dot"></samp>�ҵĺ���</a></li>
                <li><a href="<{$base}>/friend/online"><samp class="ico-pos-dot"></samp>���ߺ���</a></li>
                <li><a href="<{$base}>/online"><samp class="ico-pos-dot"></samp>�����û�</a></li>
            </ul>
        </div>
        <div class="b-content">
            <div class="friend-list">
				<form method="get" action="<{$base}>/friend/ajax_add.json" id="friend_add">
					��Ӻ���:<input type="text" class="input-text" name="id" value="" />
					<input type="submit" class="button" value="���" />
				</form>
                <div class="t-pre">
                    <div class="t-btn">
						<input type="checkbox" class="friend-select" />
						<input type="button" class="button friend-del" value="ɾ��" />
                    </div>
                    <div class="page">
                        <{include file="pagination.tpl" page_name='��������'}>
                    </div>
                </div>
			<form id="friend_form" action="<{$base}>/friend/ajax_delete.json" method="post">
                <table class="m-table">
<{if isset($friends)}>
<{foreach from=$friends item=item}>
                	<tr>
                    	<td class="title_1"><input type="checkbox" name="f_<{$item.fid}>" class="friend-item"/></td>
						<td class="title_2"><a href="<{$base}>/user/query/<{$item.fid}>"><{$item.fid}></a></td>
                        <td class="title_3"><{$item.desc|default:"&nbsp;"}></td>
                        <td class="title_6"><a href="<{$base}>/mail/send?id=<{$item.fid}>">�����ʺ�</a></td>
                    </tr>
<{/foreach}>
<{else}>
					<tr>
						<td colspan="4" style="text-align:center">��û���κκ���</td>
					</tr>
<{/if}>
                </table>
			</form>
            <div class="t-pre-bottom">
            	<div class="t-btn">
						<input type="checkbox" class="friend-select" />
						<input type="button" class="button friend-del" value="ɾ��" />
				</div>
				<div class="page">
                    <{include file="pagination.tpl" page_name='��������'}>
				</div>
             </div>
            </div>
    	</div>
