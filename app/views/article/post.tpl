	<{include file="s_nav.tpl" nav_left="������"}>
        <div class="b-content corner">
            <form action="<{$base}>/article/<{$bName}>/ajax_post.json" method="post" id="post_form" >
            <ul class="post-list">
            	<li class="post-list-item">
                	<div class="post-m">����:</div>
                    <input class="input-text post-title" type="text" name="subject" id="post_subject" value="<{$reTitle}>"/>
                </li>
<{if ($subject && $titKey && !empty($titKey))}>
                <li class="post-list-item">
                    <div class="post-m">�ؼ���(��ѡ):</div>
                    <ul class="post-tag">
<{foreach from=$titKey item=item}>
                    <li class="tab-normal"><{$item}></li>
<{/foreach}>
                    </ul>
                    <div class="clearfix"></div>
                </li>
<{/if}>
<{if ($isAtt)}>
            	<li class="upload post-list-item">
                	<div class="post-m">�ļ��ϴ�:</div>
<{include file="attachment/upload.tpl"}>
                </li>
<{/if}>
            	<li class="post-list-item">
                	<div class="post-m">����:</div>
                    <div id="con_c_area">
                    	<textarea class="post-textarea" name="content" id="post_content"><{$reContent}></textarea>
                    </div>
                </li>
                <li class="post-list-item">
                	<div class="post-m">����:(<span>������ǩѡ�����</span>)</div>
                    <div id="em_img"></div>
                </li>
                <li class="post-list-item">
             		<div class="post-m">ѡ��:</div>
					<div class="post-op">ǩ����:
						<select name="signature" class="post-select" id="post_sig">
						<{html_options options=$sigOption selected=$sigNow}>
						</select>   
					</div>
                    <div class="post-op"><input type="checkbox" value="0" name="email" id="post_email" /><span>�лظ�ʱʹ���ʼ�֪ͨ��</span></div>
					<{if $anony}>
                    <span class="post-op"><input type="checkbox" checked="true" value="1" name="anony" id="post_anony"/><span>����</span></span>
					<{/if}>
					<{if $outgo}>
                    <span class="post-op"><input type="checkbox" checked="true" value="1" name="outgo" id="post_outgo"/><span>ת��</span></span>
					<{/if}>
                </li>
           </ul>
		   <input type="hidden" name="id" value="<{$reid|default:0}>" />
           <div class="post-su"><input type="submit" class="button" value="��������" /><input class="button" type="button" value="Ԥ��(�޸���)" id="post_preview" /></div>
           </form>
		   <form id="f_preview" action="<{$base}>/article/<{$bName}>/ajax_preview.json" method="post"></form>
    	</div>
<{include file="article/preview.tpl"}>
