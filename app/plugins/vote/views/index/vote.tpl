<div class="view-wrap">
    <form action="<{$base}>/vote/ajax_vote/<{$vinfo.vid}>.json" method="post" id="f_view">
        <h1><{$vinfo.title}><span>(<{if $vinfo.type=="0"}>��ѡ<{else}><{if $vinfo.limit==0}>������<{else}>��ѡ<{$vinfo.limit}><{/if}><{/if}>)</span></h1>
        <h2>����ʱ��:<{$vinfo.start}>&nbsp;&nbsp;&nbsp;��ֹ����:<{$vinfo.end}><{if $vinfo.isEnd}><font color="red">(�ѽ�ֹ)</font><{/if}><{if $vinfo.isDel}><font color="red">(��ɾ��)</font><{/if}>&nbsp;&nbsp;&nbsp;�����ʾ:<{if $result_voted}>��ͶƱ<{else}>����ͶƱ<{/if}>&nbsp;&nbsp;&nbsp;��������:<{$vinfo.num}></h2>
<{if $vinfo.desc!=""}>
        <h3><{$vinfo.desc}></h3>
<{/if}>
        <table id="vote_table" cellpadding="0" cellspacing="0" _limit="<{$vinfo.limit}>">
<{foreach from=$vitems item=item}>
            <tr>
                <td class="col1"><{$item.label}>:</td>
                <td class="col2"><div class="vote-scroll corner"><span class="corner" style="width:0" _width="<{if $no_result}>0<{else}><{$item.percent}><{/if}>"></span></div></td>
                <td class="col3"><{if $no_result}>ͶƱ�����<{else}><{$item.num}>(<{$item.percent}>%)<{/if}></td>
<{if $vinfo.type=="0"}>
                <td class="col4"><input type="radio" name="v<{$vinfo.vid}>" value="<{$item.viid}>"<{if $vinfo.voted || $vinfo.isEnd || $vinfo.isDel}> disabled="true"<{if $item.on}> checked="true"<{/if}><{/if}> /></td>
<{else}>
                <td class="col4"><input type="checkbox" name="v<{$vinfo.vid}>_<{$item.viid}>"<{if $vinfo.voted || $vinfo.isEnd || $vinfo.isDel}> disabled="true"<{if $item.on}> checked<{/if}><{/if}> /></td>
<{/if}>
                <td class="col5">&nbsp;</td>
            </tr>
<{/foreach}>
        </table>
        <div class="vote-submit">
<{if !$islogin}>
���¼�����ͶƱ
<{elseif !$vinfo.voted}>
<{if !$vinfo.isDel&& !$vinfo.isEnd}>
            <input type="submit" class="button" value="�ύ" />
            <input type="reset" class="button" value="����" />
<{/if}>
<{else}>
���� <{$myres.time}> �����˴�ͶƱ��
<{/if}>
        </div>
    </form>
</div>
