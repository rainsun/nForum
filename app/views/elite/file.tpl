    <{capture name=n_right}><a href="<{$base}>/elite/path<{if !empty($parent)}>?v=<{$parent}><{/if}>" style="color:#fff;font-size:12px" >����</a><{/capture}>
    
    <{include file="s_nav.tpl" nav_left="�����������Ķ�" nav_right=$smarty.capture.n_right}>
    <div class="a-wrap corner">
    <table class="article">
        <tr class="a-head">
            <td>
                <ul class="a-func">
                    <li><span>����:&ensp;<{$subject}></span></li>
                </ul>
            </td>
        </tr>
        <tr class="a-body">
            <td class="a-content">
                <{$content}>
            </td>
        </tr>
    </table>
    </div>
