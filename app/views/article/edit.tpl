	<{include file="s_nav.tpl" nav_left="�༭����"}>
        <div class="b-content corner">
            <form action="<{$base}>/article/<{$bName}>/ajax_edit/<{$eid}>.json" method="post" id="post_form">
            <ul class="post-list">
            	<li class="post-list-item">
                	<div class="post-m">����:</div>
                    <input class="input-text post-title" type="text" name="subject" id="post_subject" value="<{$title}>"/>
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
                    	<textarea class="post-textarea" name="content" id="post_content"><{$content}></textarea>
                    </div>
                </li>
                <li class="post-list-item">
                	<div class="post-m">����:(<span>������ǩѡ�����</span>)</div>
                    <div id="em_img"></div>
                </li>
           </ul>
           <div class="post-su"><input type="submit" class="button b-submit" value="�ύ" /><input class="button b-submit" type="button" value="Ԥ��(�޸���)" id="post_preview"/></div>
           </form>
		   <form id="f_preview" action="<{$base}>/article/<{$bName}>/ajax_preview.json" method="post"></form>
    	</div>
<{include file="article/preview.tpl"}>
