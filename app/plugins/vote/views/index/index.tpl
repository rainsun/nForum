    	<div class="mbar">
        	<ul>
                <li <{if $category=="new"}>class="selected"<{/if}>><a href="<{$base}>/vote?c=new">����ͶƱ</a></li>
                <li <{if $category=="hot"}>class="selected"<{/if}>><a href="<{$base}>/vote?c=hot">����ͶƱ</a></li>
                <li <{if $category=="all"}>class="selected"<{/if}>><a href="<{$base}>/vote?c=all">ȫ��ͶƱ</a></li>
<{if $islogin}>
                <li <{if $category=="list"}>class="selected"<{/if}>><a href="<{$base}>/vote?c=list&u=<{$id}>">�ҵ�ͶƱ</a></li>
                <li <{if $category=="join"}>class="selected"<{/if}>><a href="<{$base}>/vote?c=join">�Ҳ����ͶƱ</a></li>
                <li><a href="<{$base}>/vote/add">��ͶƱ</a></li>
<{/if}>
<{if $isAdmin}>
                <li <{if $category=="del"}>class="selected"<{/if}>><a href="<{$base}>/vote?c=del">��ɾ����ͶƱ</a></li>
<{/if}>
            </ul>					
        </div>
		<div class="b-content vote-main">
			<div class="vote-title"><{$voteTitle}></div>
			<div id="vote_rank" class="vote-right">
				<div class="vote-search">
                    <form action="<{$base}>/vote" method="get">
                        <input type="text" class="input-text" placeholder="����,������,�����ؼ���" name="s" value="<{$search|default:''}>"/>&ensp;<input type="submit" class="button" value="ɸѡ"/>
                        <input type="hidden" name="c" value="<{$category}>"/>
<{if isset($vote_user)}>
                        <input type="hidden" name="u" value="<{$vote_user}>"/>
<{/if}>
                    </form>
				</div>
				<li class="widget color-red">  
					<div class="widget-head">
						<span class="widget-title vote-hot">һ������ͶƱ���а�</span>	
					</div>
					<div class="widget-content">
						<ul class="w-list-line">
<{if empty($week)}>
						<li>�������κ�ͶƱ</li>
<{else}>
<{foreach from=$week item=item}>
						<li title="<{$item.subject}>"><a href="<{$base}>/vote/view/<{$item.vid}>"><{$item.subject}>(<span><{$item.num}></span>)</a></li>
<{/foreach}>
<{/if}>
						</ul>
					</div>
				</li>
				<li class="widget color-orange">  
					<div class="widget-head">
						<span class="widget-title vote-hot">��������ͶƱ���а�</span>	
					</div>
					<div class="widget-content">
						<ul class="w-list-line">
<{if empty($month)}>
						<li>�������κ�ͶƱ</li>
<{else}>
<{foreach from=$month item=item}>
						<li title="<{$item.subject}>"><a href="<{$base}>/vote/view/<{$item.vid}>"><{$item.subject}>(<span><{$item.num}>)</span></a></li>
<{/foreach}>
<{/if}>
						</ul>
					</div>
				</li>
				<li class="widget color-white">  
					<div class="widget-head">
						<span class="widget-title vote-hot">�������ͶƱ���а�</span>	
					</div>
					<div class="widget-content">
						<ul class="w-list-line">
<{if empty($year)}>
						<li>�������κ�ͶƱ</li>
<{else}>
<{foreach from=$year item=item}>
						<li title="<{$item.subject}>"><a href="<{$base}>/vote/view/<{$item.vid}>"><{$item.subject}>(<span><{$item.num}></span>)</a></li>
<{/foreach}>
<{/if}>
						</ul>
					</div>
				</li>
			</div>
			<div id="vote_list" class="vote-left">
<{if $info}>
				<ul class="list-main">
<{foreach from=$info item=item}>
					<li>
						<div class="c-con">
							<h1><a href="<{$base}>/vote/view/<{$item.vid}>"><{$item.title}></a><{if $item.admin && !$item.isDel}>&nbsp;&nbsp;<a href="<{$base}>/vote/ajax_delete/<{$item.vid}>.json" class="vote-delete"><span>ɾ��</span><{/if}></a></h1>
							<h2>����ʱ��:<{$item.start}>&nbsp;&nbsp;��ֹ����:<{$item.end}><{if $item.isEnd}><font color="red">(�ѽ�ֹ)</font><{/if}><{if $item.isDel}><font color="red">(��ɾ��)</font><{/if}></h2>
							<h3><font color="#666">������:</font><a href="<{$base}>/user/query/<{$item.uid}>"><{$item.uid}></a><span><a href="<{$base}>/vote?c=list&u=<{$item.uid}>">����ͶƱ</a></span><span><a href="<{$base}>/mail/send?id=<{$item.uid}>">վ����</a></span></h3>
						</div>
						<div class="c-num"><div><{$item.num}><br /><span>�˲���</span></div></div>
					</li>
<{/foreach}>
				</ul>
<{else}>
                <div style="text-align:center;padding-top:20px;">����ͶƱ��¼��</div>
<{/if}>
                <div class="page">
                    <ul class="pagination">
                      <li class="page-pre">ͶƱ����:<i><{$totalNum}></i>&nbsp;&nbsp;��ҳ:</li>
                      <li><ol title="��ҳ�б�" class="page-main"><{$pageBar}></ol></li>
                      <li class="page-suf"></li>	
                    </ul>
                </div>
			</div>
		</div>
