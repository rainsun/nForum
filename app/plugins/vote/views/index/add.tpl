    	<div class="mbar">
        	<ul>
                <li><a href="<{$base}>/vote?c=new">����ͶƱ</a></li>
                <li><a href="<{$base}>/vote?c=hot">����ͶƱ</a></li>
                <li><a href="<{$base}>/vote?c=all">ȫ��ͶƱ</a></li>
<{if $islogin}>
                <li><a href="<{$base}>/vote?c=list&u=<{$id}>">�ҵ�ͶƱ</a></li>
                <li><a href="<{$base}>/vote?c=join">�Ҳ����ͶƱ</a></li>
                <li class="selected"><a href="<{$base}>/vote/add">��ͶƱ</a></li>
<{/if}>
<{if $isAdmin}>
                <li><a href="<{$base}>/vote?c=del">��ɾ����ͶƱ</a></li>
<{/if}>
            </ul>					
        </div>
		<div class="b-content vote-main">
			<div class="vote-title">��ͶƱ</div>
			<form id="f_vote" action="<{$base}>/vote/ajax_add.json" method="post">
			<dl id="vote_head" class="vote-add">
				<dt>����:</dt>
				<dd><input type="text" class="input-text" name="subject"/><span style="color:red">&nbsp;*</span></dd>
				<dt>����:</dt>
				<dd class="a-desc"><textarea name="desc"></textarea></dd>
			</dl>
			<dl id="vote_item" class="vote-add">
				<dt>ѡ��:</dt>
				<dd><input type="text" class="input-text" name="%name%"/><samp class="ico-pos-w-remove"></samp></dd>
			</dl>
            <div class="clearfix" ></div>
			<dl id="vote_opt" class="vote-add">
				<dt>&nbsp;</dt>
				<dd class="item-more"><samp class="ico-pos-tag-off"></samp>���ѡ��(���20��)</dd>
				<dt>��ֹ����:</dt>
				<dd ><input type="text" name="end" class="input-text"/></dd>
				<dt>ѡ������:</dt>
				<dd><input type="radio" name="type" value="0" checked onclick="$('#v_limit').attr('disabled',true)"/>��ѡ&nbsp;&nbsp;<input type="radio" name="type" value="1" onclick="$('#v_limit').attr('disabled',false)"/>��ѡ</dd>
				<dt>��ѡ����:</dt>
				<dd><select id="v_limit" disabled="1" name="limit"><option value="0">������</option><{html_options options=$limit}></select></dd>
				<dt>�����ʾ:</dt>
				<dd><input type="checkbox" name="result_voted" value="1" />&ensp;ͶƱ����ʾ���</dd>
				<dt>��ذ���:</dt>
				<dd>
					<select id="vote_section">
					<{html_options options=$sec selected=$selected}>
					</select>&emsp;
					<select name="b" id="vote_board">
					</select>
                    <span style="color:red;padding-left:5px">������иð��淢��Ȩ��,��ͶƱ������������</span>
                </dd>
			</dl>
			<div class="vote-submit">
				<input type="submit" class="button" value="�ύ" />
				<input type="reset" class="button" value="����" />
			</div>
			</form>
		</div>
