    <{include file="s_nav.tpl" nav_left="�༭����"}>
        <div class="b-content corner">
            <ul class="post-list">
            	<li class="post-list-item">
                	<div class="post-m">����:&ensp;<a target="_blank" href="<{$base}>/article/<{$bName}>/<{$gid}>?s=<{$aid}>"><{$title}></a></div>
                </li>
                <li class="upload post-list-item">
                    <div class="post-m">�ļ��ϴ�:</div>
<{include file="attachment/upload.tpl"}>
                </li>
        </div>
        <input type="hidden" id="sessionid" value="<{$sessionid}>" />
