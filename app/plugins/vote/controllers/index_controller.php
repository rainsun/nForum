<?php
App::import("vendor", array("inc/db"));
App::import("vendor", "vote.vote");
class IndexController extends VoteAppController {
    private $_board = "nVote";

    public function beforeFilter(){
        parent::beforeFilter();
        $this->notice[] = array("url" => "/vote", "text" => "ͶƱ");
    }
    public function index(){
        $this->css[] = "xwidget.css";
        $this->css['plugin']['vote'][] = "vote.css";
        $this->js['plugin']['vote'][] = "vote.js";
        $this->cache(false);
        @$category = $this->params['url']['c'];
        $u = User::getInstance();
        $time = time();
        $yes = $time - 86400;
        $search = '';
        if(isset($this->params['url']['s'])){
            $search = trim(rawurldecode($this->params['url']['s']));
            $search = nforum_iconv('utf-8', $this->encoding, $search);
            if('' != $search){
                App::import('Sanitize');
                $this->set('search', Sanitize::html($search));
                $search = addslashes($search);
                $search = " and (uid like '%$search%' or subject like '%$search%' or `desc` like '%$search%')";
            }
        }
        switch($category){
            case 'hot':
                $title = "����ͶƱ";
                $sql = "select * from pl_vote where status=1 and end>$yes $search order by num desc, vid desc";
                break;
            case 'list':
                @$user = $this->params['url']['u'];
                if($u->userid != $user){
                    try{
                        $user = User::getInstance($user);
                    }catch(UserNullException $e){
                        $this->error(ECode::$USER_NOID);
                    }
                }else{
                    $user = $u;
                }
                $title = ($user->userid == $u->userid)?"�ҵ�ͶƱ":"{$user->userid}��ͶƱ";
                $this->set("vote_user", $user->userid);
                $sql = "select * from pl_vote where status=1 and uid='{$user->userid}' $search order by vid desc";
                break;
            case 'all':
                $title = "ȫ��ͶƱ";
                $sql = "select * from pl_vote where status=1 $search order by vid desc";
                break;
            case 'join':
                $this->requestLogin();
                $title = "�Ҳ����ͶƱ";
                $sql = "select * from pl_vote where status=1 and vid in (select vid from pl_vote_result where uid='{$u->userid}') $search order by vid desc";
                break;
            case 'del':
                if(!$u->isAdmin())
                    $this->error('����Ȩ�鿴����ͶƱ');
                $title = "��ɾ����ͶƱ";
                $sql = "select * from pl_vote where status=0 $search order by vid desc";
                break;
            default:
                $title = "����ͶƱ";
                $category = "new";
                $sql = "select * from pl_vote where status=1 and end>$yes $search order by vid desc";
        }
        $list = new VoteList($sql);
        App::import("vendor", "inc/pagination");
        $page = new Pagination($list, 10);
        $p = isset($this->params['url']['p'])?$this->params['url']['p']:1;
        $res = $page->getPage($p);
        if(count($res) == 0){
            $info = false;
        }else{
            $info = array();
            App::import('Sanitize');
            foreach($res as $v){
                $info[] = array(
                    "vid" =>$v->vid,
                    "title" =>Sanitize::html($v->subject),
                    "start" =>date("Y-m-d H:i:s", $v->start),
                    "end" =>date("Y-m-d", $v->end),
                    "num" =>$v->num,
                    "isEnd" =>$v->isEnd(),
                    "isDel" =>$v->isDeleted(),
                    "admin"=>$u->userid === $v->uid || $u->isAdmin(),
                    "uid" =>$v->uid
                );
            }
        }
        $query = $this->params['url'];
        unset($query['url']);
        unset($query['p']);
        unset($query['ext']);
        foreach($query as $k=>&$v)
            $v = $k . '=' . rawurlencode($v);
        $query[] = "p=%page%";
        $link = "{$this->base}/vote?". join("&", $query);

        $pageBar = $page->getPageBar($p, $link);
        $this->set("pageBar", $pageBar);
        $this->set("totalNum", $list->getTotalNum());
        $this->set("info", $info);
        $this->set("category", $category);
        $this->set("voteTitle", $title);
        $this->notice[] = array("url" => "", "text" => $title);

        /* right rank*/
        $week = nforum_cache_read("vote_week");
        $month = nforum_cache_read("vote_month");
        $year = nforum_cache_read("vote_year");
        $this->set("week", $week);
        $this->set("month", $month);
        $this->set("year", $year);
        /* right rank end*/
    }

    public function add(){
        $this->requestLogin();
        $this->css['plugin']['vote'][] = "vote.css";
        $this->js['plugin']['vote'][] = "vote.js";
        $this->notice[] = array("url" => "", "text" => "��ͶƱ");
        $this->cache(false);

        $u = User::getInstance();
        $db = DB::getInstance();
        if(!$u->isAdmin()){
            $sql = "select count(*) as num from pl_vote where status=1 and start>=? and uid=?";
            $res = $db->one($sql, array(strtotime(date("Y-m-d",time())), $u->userid));
            if($res !== false && $res['num'] >=2)
                $this->error("ÿ������࿪������ͶƱ");
        }
        for($i = 2;$i<=19; $i++)
            $limit[$i] = $i;
        $this->set('limit', $limit);

        $secs = Configure::read("section");
        foreach($secs as $k=>&$v){
            $v = $k . "��:" . $v[0];
        }
        $this->set("sec", $secs);
        $this->set("selected", 0);
    }

    public function ajax_add(){
        if(!$this->RequestHandler->isPost())
            $this->error(ECode::$SYS_REQUESTERROR);

        $this->requestLogin();
        $db = DB::getInstance();
        $u = User::getInstance();
        if(!$u->isAdmin()){
            $sql = "select count(*) as num from pl_vote where status=1 and start>=? and uid=?";
            $res = $db->one($sql, array(strtotime(date("Y-m-d",time())), $u->userid));
            if($res !== false && $res['num'] >=2)
                $this->error("ÿ������࿪������ͶƱ");
        }
        $subject = @trim($this->params['form']['subject']);
        $desc = @trim($this->params['form']['desc']);
        $end = @trim($this->params['form']['end']);
        $type = @trim($this->params['form']['type']);
        $limit = @trim($this->params['form']['limit']);
        $result_voted = isset($this->params['form']['result_voted'])?1:0;

        if(empty($subject) || empty($end))
            $this->error();
        if($type != "0" && $type != "1")
            $type = 0;
        if(empty($limit) || intval($limit) < 2 || intval($limit) > 19)
            $limit = 0;
        if(strtotime($end) === false || !preg_match("/\d{4}(-\d{2}){2}/", $end))
            $this->error("��ֹ���ڴ���");
        $items = array();
        foreach($this->params['form'] as $k=>$v){
            if(preg_match('/^i\d+$/', $k) && trim($v) != "")
                $items[] = nforum_iconv('UTF-8', $this->encoding, trim($v));
        }
        $realNum = count($items);
        if($realNum < 2 || $realNum > 20)
            $this->error("ѡ���������󣬷���ͶƱʧ��");
        if($limit > $realNum)
            $limit = $realNum;
        $subject = nforum_iconv('UTF-8', $this->encoding, $subject);
        $desc = nforum_iconv('UTF-8', $this->encoding, $desc);
        $vid = Vote::add($u->userid, $subject, $desc, strtotime($end), $type, $limit, $items, $result_voted);
        $site = Configure::read("site");
        $a_title = $subject;
        $a_content = "����:$subject\n����:$desc\n������:{$u->userid}\n����:".(($type==0)?'��ѡ':'��ѡ')."\n��ֹ����:$end\n����:[url={$site['domain']}{$site['prefix']}/vote/view/$vid]{$site['domain']}{$site['prefix']}/vote/view/{$vid}[/url]\n[vote=$vid][/vote]";
        App::import("vendor", "model/article");
        $aid = Article::autoPost($this->_board, $a_title, $a_content);
        $db->update("pl_vote", array("aid"=>$aid), "where vid=?", array($vid));

        if(isset($this->params['form']['b'])){
            App::import("vendor", "model/board");
            try{
                $board = Board::getInstance(trim($this->params['form']['b']));
                if($board->hasPostPerm($u)){
                    Article::autoPost($board->NAME, '[ͶƱ]' . $a_title, $a_content);
                }
            }catch(Exception $e){}
        }
        $ret['ajax_code'] = "����ͶƱ�ɹ�";
        $ret['default'] = "/vote?c=list&u=".$u->userid;
        $ret['list'][] = array("text" => '�ҵ�ͶƱ', "url" => "/vote?c=list&u=".$u->userid);
        $ret['list'][] = array("text" => '����ͶƱ', "url" => "/vote?c=hot");
        $this->set('no_html_data', $ret);
    }

    public function view(){
        $this->css[] = "xwidget.css";
        $this->css['plugin']['vote'][] = "vote.css";
        $this->js['plugin']['vote'][] = "vote.js";
        $this->js[] = "forum.share.js";
        $this->notice[] = array("url" => "", "text" => "�鿴ͶƱ");
        $this->cache(false);
        if(!isset($this->params['vid']))
            $this->error("δ֪��ͶƱ");
        $vid = intval($this->params['vid']);
        try{
            $vote = new Vote($vid);
        }catch(VoteNullException $e){
            $this->error("δ֪��ͶƱ");
        }
        $u = User::getInstance();
        if($vote->isDeleted() && !$u->isAdmin())
            $this->error("��ͶƱ��ɾ��");
        $myres = $vote->getResult($u->userid);

        $voted = false;
        if($myres !== false){
            $voted = true;
            $myres['time'] = date("Y-m-d H:i:s", $myres['time']);
            $this->set("myres", $myres);
        }
        App::import('Sanitize');
        $info = array(
            "vid" =>$vote->vid,
            "title" =>Sanitize::html($vote->subject),
            "desc" =>nl2br(Sanitize::html($vote->desc)),
            "start" =>date("Y-m-d H:i:s", $vote->start),
            "end" =>date("Y-m-d", $vote->end),
            "num" =>$vote->num,
            "type" =>$vote->type,
            "limit" =>$vote->limit,
            "aid" =>$vote->aid,
            "isEnd" =>$vote->isEnd(),
            "isDel" =>$vote->isDeleted(),
            "voted" =>$voted,
            "uid" =>$vote->uid
        );
        $item = $vote->items;
        foreach($item as $k=>$v){
            $item[$k]["label"] = Sanitize::html($v["label"]);
            $item[$k]["percent"] = ($vote->total === 0)?0:round(intval($v['num'])*100/$vote->total);
            $item[$k]["on"] = ($myres !== false) && in_array($v['viid'], $myres['items']);
        }
        $this->set("board", $this->_board);
        $this->set("admin", $u->userid === $vote->uid || $u->isAdmin());
        $this->set("result_voted", $vote->result_voted);
        $this->set("no_result", !$vote->isEnd() && !$this->get('admin') && $vote->result_voted && !$voted);
        $this->set("vinfo", $info);
        $this->set("vitems", $item);

        try{
            $u = User::getInstance($vote->uid);
            $furl = $u->getFace();
        }catch(UserNullException $e){
            $furl = false;
        }
        $this->set("furl", Sanitize::html($furl));
        $this->set("fwidth", ($u->userface_width === 0)?"":$u->userface_width);
        $this->set("fheight", ($u->userface_height === 0)?"":$u->userface_height);

    }

    public function ajax_vote(){
        if(!$this->RequestHandler->isPost())
            $this->error(ECode::$SYS_REQUESTERROR);

        $this->requestLogin();
        if(!isset($this->params['vid']))
            $this->error("δ֪��ͶƱ");
        $vid = intval($this->params['vid']);
        try{
            $vote = new Vote($vid);
        }catch(VoteNullException $e){
            $this->error("δ֪��ͶƱ");
        }
        $u = User::getInstance();
        if($vote->isDeleted() && !$u->isAdmin())
            $this->error("��ͶƱ��ɾ��");
        $myres = $vote->getResult($u->userid);
        if($myres !== false)
            $this->error("���Ѿ�Ͷ��Ʊ��");
        if($vote->isDeleted())
            $this->error("��ͶƱ��ɾ��");
        if($vote->isEnd())
            $this->error("��ͶƱ�ѽ�ֹ");
        if($vote->type == "0"){
            @$viid = $this->params['form']['v'.$vote->vid];
            if(!$vote->hasItem($viid))
                $this->error("δ֪��ѡ�ͶƱʧ��");
            $vote->vote($u->userid, $viid);
        }else if($vote->type == "1"){
            $items = array_keys($this->params['form']);
            if(count($items) > $vote->limit && $vote->limit != 0)
                $this->error("ͶƱ�����������ƣ�ͶƱʧ��");
            $items = preg_replace("/v{$vote->vid}_/", "", $items);
            foreach($items as $v){
                if(!$vote->hasItem($v))
                    $this->error("δ֪��ѡ�ͶƱʧ��");
            }
            $vote->vote($u->userid, $items);
        }else{
            $this->error("�����ͶƱ");
        }
    }

    public function ajax_delete(){
        if(!$this->RequestHandler->isPost())
            $this->error(ECode::$SYS_REQUESTERROR);
        $this->requestLogin();
        if(!isset($this->params['vid']))
            $this->error("δ֪��ͶƱ");
        $vid = intval($this->params['vid']);
        try{
            $vote = new Vote($vid);
        }catch(VoteNullException $e){
            $this->error("δ֪��ͶƱ");
        }
        $u = User::getInstance();
        if(!$u->isAdmin() && $u->userid != $vote->uid)
            $this->error("����Ȩɾ����ͶƱ");
        $vote->delete();
    }
}
?>
