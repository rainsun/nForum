    	<div class="mbar">
        	<ul>
                <li><a href="<{$base}>/user/info">���������޸�</a></li>
                <li><a href="<{$base}>/user/passwd">�ǳ������޸�</a></li>
                <li><a href="<{$base}>/user/custom">�û��Զ������</a></li>
                <li class="selected"><a href="<{$base}>/mail">�û��ż�</a></li>
                <li><a href="<{$base}>/refer">��������</a></li>
                <li><a href="<{$base}>/friend">�����б�</a></li>
                <li><a href="<{$base}>/fav">�ղذ���</a></li>
            </ul>					
        </div>
        <div class="c-mbar">
			<ul>
            	<li><a href="<{$base}>/mail/inbox"><samp class="ico-pos-dot"></samp>�ռ���</a></li>
                <li><a href="<{$base}>/mail/outbox" ><samp class="ico-pos-dot"></samp>������</a></li>
                <li><a href="<{$base}>/mail/deleted" ><samp class="ico-pos-dot"></samp>�Ͼ���</a></li>
                <li><a href="<{$base}>/friend"><samp class="ico-pos-dot"></samp>��ַ��</a></li>
                <li><a href="<{$base}>/mail/send" class="select"><samp class="ico-pos-dot"></samp>׫д�ʼ�</a></li>
            </ul>
        </div>
        <div class="b-content">
			<form id="post_form" method="post" action="<{$base}>/mail/<{$type|default:'NULL'}>/ajax_send.json">
                <ul class="post-list" style="border-top:1px solid #c9d7f1;">
                    <li class="post-list-item">
						<div class="post-m">�ռ��ˣ�</div>
<{if !isset($rid)}>
						<input class="input-text post-title" type="text" name="id" id="post_id"style="width:300px" value=""/>  
						<select class="post-select" onchange="$('#post_id').val($(this).val())">
							<option value="">ѡ�����</option>
							<{html_options options=$friends}>
						</select>
<{else}>
						<input class="input-text post-title" type="text" id="id" name="id" style="width:300px" value="<{$rid}>" readonly="readonly"/>  
<{/if}>
					</li>
                    <li class="post-list-item">
						<div class="post-m">����:</div>
						<input class="input-text post-title" type="text" name="title" id="post_subject" value="<{$title|default:""}>"/>
					</li>
                    <li class="post-list-item">
						<div class="post-m">���ݣ�</div>
                        <div id="con_c_area">
                            <textarea id="post_content" class="post-textarea" name="content"><{$content|default:""}></textarea>
                    </div>
					</li>
                    <li class="post-list-item">
                        <div class="post-m">����:(<span>������ǩѡ�����</span>)</div>
                        <div id="em_img"></div>
                    </li>
                    <li class="post-list-item">
						<div class="post-m">ѡ��:</div>
						<div class="post-op">
						ǩ����:<select class="post-select" name="signature">
						<{html_options options=$sigOption selected=$sigNow}>
						</select>   
						</div>
                        <div class="post-op"><input type="checkbox" name="backup"<{if $bak}> checked="checked"<{/if}>/>���ݵ���������</div>
                    </li>
                </ul>
                <div class="post-su"><input type="submit" class="button" value="������Ϣ" /><input class="button" type="button" value="Ԥ��(�޸���)" id="post_preview" /></div>
                <input type="hidden" name="num" value="<{$num|default:''}>" />
			</form>
		   <form id="f_preview" action="<{$base}>/mail/ajax_preview.json" method="post"></form>
    	</div>
<{include file="article/preview.tpl"}>
