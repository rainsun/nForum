    <div class="t-pre">
        <div class="bmode">
            <span>����ģʽ:</span>
            <a class="tab-normal" href="<{$base}>/board/<{$bName}>">����</a>
            <a class="tab-normal<{if $mode==6}> tab-down<{/if}>" href="<{$base}>/board/<{$bName}>/mode/6">ԭ��</a>
            <a class="tab-normal<{if $mode==0}> tab-down<{/if}>" href="<{$base}>/board/<{$bName}>/mode/0">����</a>
            <a class="tab-normal<{if $mode==3}> tab-down<{/if}>" href="<{$base}>/board/<{$bName}>/mode/3">����</a>
            <a class="tab-normal<{if $mode==1}> tab-down<{/if}>" href="<{$base}>/board/<{$bName}>/mode/1">��ժ</a>
<{if $isAdmin || $bm}>
            <a class="tab-normal<{if $mode==4}> tab-down<{/if}>" href="<{$base}>/board/<{$bName}>/mode/4">����</a>
<{/if}>
<{if $isAdmin}>
            <a class="tab-normal<{if $mode==5}> tab-down<{/if}>" href="<{$base}>/board/<{$bName}>/mode/5">ֽ¨</a>
<{/if}>
        </div>
		<div class="t-btn">
<{if !$tmpl}>
			<a href="<{$base}>/article/<{$bName}>/post" class="b-post button">�»���</a>
<{/if}>
			<a href="<{$base}>/article/<{$bName}>/tmpl" class="b-post button">ģ�淢��</a>
<{if $hasVote}>
			<a href="<{$base}>/board/<{$bName}>/vote" class="button">����ͶƱ</a>
<{/if}>
			<a href="<{$base}>/elite/path?v=<{$elitePath}>" class="button">������</a>
			<{if $islogin}><a href="javascript:void(0)" id="b_fav" class="button" _b="<{$bName}>">�ղ�</a><{/if}>
			<{if $bm || $isAdmin}><a href="<{$base}>/board/<{$bName}>/denylist" class="button">����б�</a><{/if}>
			<a href="<{$base}>/rss/board-<{$bName}>" class="rss" target="_blank"><samp class="ico-pos-rss"></samp></a>
		</div>
    </div>
	<{capture name=n_left}>���浱ǰ����<{$curNum}>������<{if isset($maxNum)}><span title="������<{$maxTime}>">[���<{$maxNum}>��]</span><{/if}>&emsp;��������<{$todayNum}><{/capture}>
	<{capture name=n_right}>
	����:
		<{foreach from=$bms item=item}>
			&ensp;<{if $item[1]}><a href="<{$base}>/user/query/<{$item[0]}>"><{$item[0]}></a><{else}><{$item[0]}><{/if}>
		<{/foreach}>
	<{/capture}>

	<{include file="s_nav.tpl" nav_left=$smarty.capture.n_left nav_right=$smarty.capture.n_right}>
        <div class="b-content">
            <table class="board-list tiz" cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <th class="title_8">״̬</th>
                    <th class="title_9 middle">����</th>
                    <th class="title_10">����ʱ��</th>
                    <th class="title_12">|&ensp;����</th>
            	</tr>
                </thead>
                <tbody>
<{if ($info)}>
<{foreach from=$info item=item}>
				<tr <{if $item.tag == "T"}>class="top"<{/if}>>
					<td class="title_8">
                    <{if $bm || $isAdmin}>
                    <a class="a-func-manage" href="<{$base}>/article/<{$bName}>/ajax_manage/<{$item.id}>.json" title="����" _gid="<{$item.gid}>">
                    <{elseif $mode!=6}>
                    <a href="<{$base}>/article/<{$bName}>/ajax_single/<{$item.id}>.json" class="a-single">
                    <{else}>
					<a target="_blank" href="<{$base}>/article/<{$bName}>/<{$item.id}>" title="���´��ڴ򿪴�����">
                    <{/if}>
                    <samp class="tag
					<{if $item.tag == "T"}> ico-pos-article-top
                    <{elseif $item.tag == "B"}> ico-pos-article-b
					<{elseif $item.tag == "M" || $mode==3}> ico-pos-article-m
					<{elseif $item.tag == "G" || $mode==1}> ico-pos-article-g
					<{elseif $item.tag == ";"}> ico-pos-article-lock
					<{elseif $item.tag == "L"}> ico-pos-article-light
                    <{elseif $item.tag == "L2"}> ico-pos-article-fire
                    <{elseif $item.tag == "L3"}> ico-pos-article-huo
					<{else}> ico-pos-article-normal
					<{/if}>"></samp></a></td>
					<td class="title_9">
<{if $mode == 6}>
						<a href="<{$base}>/article/<{$bName}>/<{$item.gid}>" title="<{$item.title}>"><{$item.title}></a>
<{else}>
						<a href="<{$base}>/article/<{$bName}>/ajax_single/<{$item.id}>.json?mode=<{$mode}>" class="a-single" title="<{$item.title}>"><{$item.title}></a>
<{/if}>

                    <{if $item.att}><samp class="tag-att ico-pos-article-attach"></samp><{/if}>
					</td>
                    <td class="title_10"><{$item.postTime}></td>
                    <td class="title_12">|&ensp;<a href="<{$base}>/user/query/<{$item.poster}>" class="c63f"><{$item.poster}></a></td>
				</tr>
<{/foreach}>
<{else}>
				<tr>
					<td colspan="4" style="text-align:center">�ð���û���κ�����</td>
				</tr>
<{/if}>
                </tbody>
			</table>
    	</div>
    <div class="t-pre-bottom">
        <div class="page">
            <{include file="pagination.tpl" page_name='������'}>
        </div>
    	<div class="t-btn">
        	<form method="get" action="<{$base}>/s/article" id="board_search">
        		<input type="text" class="input-text input" name="t1" placeholder="����ؼ���" size="16"/>
        		<input type="text" class="input-text input" name="au" placeholder="��������ID" size="12"/>
                <input type="checkbox" name="m" id="c_m"/>
                <label for="c_m">������</label>
                <input type="checkbox" name="a" id="c_a"/>
                <label for="c_a">������</label>
                <input type="submit" class="button" value="����" />
				<input type="hidden" name="b" value="<{$bName}>" />
            </form>
        </div>
    </div>
<{if $bm || $isAdmin}><{include file="article/manage.tpl"}><{/if}>
<{if $mode!=6}><{include file="article/single.tpl"}><{/if}>
