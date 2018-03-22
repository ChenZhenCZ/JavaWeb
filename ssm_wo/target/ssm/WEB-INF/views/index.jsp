<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path=request.getContextPath();
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>陈桢的个人网站</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

 <%@include file="master/footer.jsp"%>
</head>

<body>
<div class="header">
    <div class="container">
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="navbar-header">
                <button type="button" id="nav-toggle" class="navbar-toggle" data-toggle="collapse" data-target="#main-nav">
                    <span class="sr-only">我们不一样</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand scroll-top"><em>我们</em>不一样</a>
            </div>
            <!--/.navbar-header-->
            <div id="main-nav" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#" class="scroll-top">首页</a></li>
                    <li><a href="#" class="scroll-link" data-id="about">展现自我</a></li>
                    <li><a href="#" class="scroll-link" data-id="portfolio">我想说</a></li>
                    <li><a href="#" class="scroll-link" data-id="blog">关于我们</a></li>
                    <li><a href="#" class="scroll-link" data-id="contact-us">联系我们</a></li>
                </ul>
            </div>
            <!--/.navbar-collapse-->
        </nav>
        <!--/.navbar-->
    </div>
    <!--/.container-->
</div>
<!--/.header-->


<div class="parallax-content baner-content" id="home">
    <div class="container">
        <div class="text-content">
            <h2>我们 <span>不</span>一<em>样</em></h2>
            <p>正时光悄无声息地翻过,春天又翩跹而至,走在四季的开端,仿佛走在了一条起跑线上,亲爱的同学,看看周围的伙伴,你是不是有很多话想要表达——我和小鸟和铃铛·金子美铃我伸展双臂我伸展双臂,也不能在天空飞翔也不能在天空飞翔,会飞的小鸟却不能像我会飞的小鸟却不能像我,在地上快快地奔跑在地上快快地奔跑 </p>
            <div class="primary-white-button">
                <a href="#" class="scroll-link" data-id="about">让我们开始吧！</a>
            </div>
        </div>
    </div>
</div>


<section id="about" class="page-section">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="service-item">
                    <div class="icon">
                        <img src="<%=path %>/static/img/service_icon_01.png" alt="">
                    </div>
                    <h4>我们的校园时光</h4>
                    <div class="line-dec"></div>
                    <p>这种情景似曾相识,真好,好熟悉,而更多的是想要学会珍惜,这么美好的学生时代,就连这样的压力和苦闷的思绪都想作为最甜美的记忆.加油,你可以,我爱你,美丽的校园,让我们留下...</p>
                    <div class="primary-blue-button">
                        <a href="#" class="scroll-link" data-id="portfolio">留下美好</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="service-item">
                    <div class="icon">
                        <img src="<%=path %>/static/img/service_icon_02.png" alt="">
                    </div>
                    <h4>我们一起追过的女孩</h4>
                    <div class="line-dec"></div>
                    <p>去追，却换来不尽的泪水。你不禁的拷问自己，是自己不爱这个 女孩 吗？还是不敢轻易的承诺说我 喜欢 你？ 那些年我们追过的女孩，现在都已长大啦！不再是青涩的年少，当彼此...</p>
                    <div class="primary-blue-button">
                        <a href="#" class="scroll-link" data-id="portfolio">留下美好</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="service-item">
                    <div class="icon">
                        <img src="<%=path %>/static/img/service_icon_03.png" alt="">
                    </div>
                    <h4>留下的那些遗憾</h4>
                    <div class="line-dec"></div>
                    <p>而那些错过的人或者事也如此，一旦错过了，就再也挽回不了，就算自己再怎么努力也回不到当初那种感觉，那么人活一辈子最害怕留下那几个遗憾呢？ 一：没有做自己想做的事。...</p>
                    <div class="primary-blue-button">
                        <a href="#" class="scroll-link" data-id="portfolio">留下遗憾</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="service-item">
                    <div class="icon">
                        <img src="<%=path %>/static/img/service_icon_04.png" alt="">
                    </div>
                    <h4>开心玩玩</h4>
                    <div class="line-dec"></div>
                    <p>每个游戏都有自己的游戏规则开心也一样，我每玩一个游戏都喜欢了解清楚游戏的规则，这样玩起来就事半功倍了，清楚整个游戏的操作进入游戏时就更开心了！ 言归正传： 一升...</p>
                    <div class="primary-blue-button">
                        <a href="#" class="scroll-link" data-id="portfolio">玩玩吧</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>

<section id="portfolio">
    <div class="content-wrapper">
        <div class="inner-container container">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <div class="section-heading">
                        <h4>我们的图库</h4>
                        <div class="line-dec"></div>
                        <p>单纯的我们总有不一样的烟火.</p>
                        <div class="filter-categories">
                            <ul class="project-filter">
                                <li class="filter" data-filter="all"><span>我们所有</span></li>
                                <li class="filter" data-filter="branding"><span>模糊</span></li>
                                <li class="filter" data-filter="graphic"><span>美好</span></li>
                                <li class="filter" data-filter="nature"><span>自然</span></li>
                                <li class="filter" data-filter="animation"><span>单纯</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="projects-holder-3">
                        <div class="projects-holder">
                            <div class="row">
                                <div class="col-md-6 col-sm-6 project-item mix nature">
                                    <div class="thumb">
                                        <div class="image">
                                            <a href="<%=path %>/static/img/portfolio_big_item_01.jpg" data-lightbox="image-1"><img src="<%=path %>/static/img/portfolio_item_01.jpg"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 project-item mix animation">
                                    <div class="thumb">
                                        <div class="image">
                                            <a href="<%=path %>/static/img/portfolio_big_item_02.jpg" data-lightbox="image-1"><img src="<%=path %>/static/img/portfolio_item_02.jpg"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 project-item mix branding">
                                    <div class="thumb">
                                        <div class="image">
                                            <a href="<%=path %>/static/img/portfolio_big_item_03.jpg" data-lightbox="image-1"><img src="<%=path %>/static/img/portfolio_item_03.jpg"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 project-item mix graphic nature">
                                    <div class="thumb">
                                        <div class="image">
                                            <a href="<%=path %>/static/img/portfolio_big_item_04.jpg" data-lightbox="image-1"><img src="<%=path %>/static/img/portfolio_item_04.jpg"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 project-item mix branding">
                                    <div class="thumb">
                                        <div class="image">
                                            <a href="<%=path %>/static/img/portfolio_big_item_05.jpg" data-lightbox="image-1"><img src="<%=path %>/static/img/portfolio_item_05.jpg"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 project-item mix graphic animation">
                                    <div class="thumb">
                                        <div class="image">
                                            <a href="<%=path %>/static/img/portfolio_big_item_06.jpg" data-lightbox="image-1"><img src="<%=path %>/static/img/portfolio_item_06.jpg"></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section id="testimonial">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div id="owl-testimonials" class="owl-carousel owl-theme">
                    <div class="item">
                        <div class="testimonials-item">
                            <p>“我是一个害怕孤独的人，最喜欢和朋友在一起，如果没有朋友，我估计活不出来。... 和朋友在一起，忧伤会减半，快乐会加倍，心里被雨淋湿了，朋友会为你撑起伞。和朋.... ”</p>
                            <h4>站长</h4>
                            <span>摘要</span>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonials-item">
                            <p>“ 如此清淡,不是疏离尘世,而是让自己在尘世中修炼得更加质朴.人生这本蕴含真理的书,其实掩藏在平淡的物事中.返璞归真,随缘即安. .... ”</p>
                            <h4>站长</h4>
                            <span>摘要</span>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonials-item">
                            <p>“ 一昂首,便惊褪了满空的星子. 一壶酒,便醉了整个天下. 如果说竹林的连绵绿浪让人心旷神怡、江南的清浅流水使人留恋往返的话,那么 面对昆仑山脉的峰峦起伏,我...”</p>
                            <h4>站长</h4>
                            <span>摘要</span>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonials-item">
                            <p>“ 请再谱一支青春曲, 伴随你我在明天的征途中继续奋进! 岁月的车轮即将驶出青春的校 园,甚至来不及去想一想,我们就要走向生活的前方.这样匆匆,说些什么?――让我们的 ... ”</p>
                            <h4>站长</h4>
                            <span>摘要</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="tabs-content" id="blog">
    <div class="container">
        <div class="row">
            <div class="wrapper">
                <div class="col-md-4">
                    <div class="section-heading">
                        <h4>关于我们</h4>
                        <div class="line-dec"></div>
                        <p>我就是我，不一样的烟火.</p>
                        <ul class="tabs clearfix" data-tabgroup="first-tab-group">
                            <li><a href="#tab1" class="active">Lorem ipsum dolor sit</a></li>
                            <li><a href="#tab2">Quisque ultricies maximus</a></li>
                            <li><a href="#tab3">Sed vel elit et lorem</a></li>
                            <li><a href="#tab4">Vivamus purus neque</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-8">
                    <section id="first-tab-group" class="tabgroup">
                        <div id="tab1">
                            <img src="<%=path %>/static/img/blog_item_01.jpg" alt="">
                            <div class="text-content">
                                <h4>Lorem ipsum dolor sit amet</h4>
                                <span><a href="#">Digital Marketing</a> / <a href="#">John</a> / <a href="#">22 September 2017</a></span>
                                <p>Sed sed elementum diam. Nunc vehicula leo et ante dapibus tincidunt. Praesent fringilla mauris gravida enim laoreet, eu cursus erat dignissim. Praesent lacinia, nisi in suscipit commodo, risus elit viverra neque, ut pretium eros turpis vel enim. Maecenas vitae lacus purus.</p>
                            </div>
                        </div>
                        <div id="tab2">
                            <img src="<%=path %>/static/img/blog_item_02.jpg" alt="">
                            <div class="text-content">
                                <h4>Quisque ultricies maximus</h4>
                                <span><a href="#">Branding</a> / <a href="#">David</a> / <a href="#">14 September 2017</a></span>
                                <p> Quisque eget congue orci. Integer et eros diam. Curabitur aliquam nisi ornare turpis tristique tincidunt ut ut orci. Phasellus orci nisi, varius sed lacinia et, pulvinar quis est. Curabitur a tincidunt tortor. Cras rhoncus sodales massa sagittis malesuada.</p>
                            </div>
                        </div>
                        <div id="tab3">
                            <img src="<%=path %>/static/img/blog_item_03.jpg" alt="">
                            <div class="text-content">
                                <h4>Sed vel elit et lorem</h4>
                                <span><a href="#">Web Design</a> / <a href="#">Jacky</a> / <a href="#">25 August 2017</a></span>
                                <p>Cras sodales, magna non ultrices pellentesque, ligula dui viverra nunc, vitae scelerisque arcu tortor nec nibh. Proin tempor vel nisi et sagittis. Morbi ut sagittis orci, a pretium diam. Nullam sed bibendum turpis. Fusce eget dapibus lectus. Vestibulum ac malesuada lacus, eu vulputate sapien. Sed vel elit et lorem cursus dignissim sed sit amet arcu.</p>
                            </div>
                        </div>
                        <div id="tab4">
                            <img src="<%=path %>/static/img/blog_item_04.jpg" alt="">
                            <div class="text-content">
                                <h4>Vivamus purus neque</h4>
                                <span><a href="#">E-Commerce</a> / <a href="#">John</a> / <a href="#">12 August 2017</a></span>
                                <p>Aliquam erat volutpat. Nulla at nunc nec ante rutrum congue id in diam. Nulla at lectus non turpis placerat volutpat lacinia ut mi. Quisque ultricies maximus justo a blandit. Donec sit amet commodo arcu. Sed sit amet iaculis mi, vel fermentum nisi. Morbi dui enim, vestibulum non accumsan ac, tempor non nisl.</p>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="contact-us">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h4>联系我们</h4>
                    <div class="line-dec"></div>
                    <p>另外，主流的便利酒精。然而，我的胡萝卜有针对性的，或者直到温暖。Morbi酒后驾车enim，accumsan交流前庭非，tempor非nisl。.</p>
                    <div class="pop-button">
                        <h4>给我们留言</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="pop">
                    <span>✖</span>
                    <form id="contact" action="#" method="post">
                        <div class="row">
                            <div class="col-md-12">
                                <fieldset>
                                    <input name="name" type="text" class="form-control" id="name" placeholder="Your name..." required="">
                                </fieldset>
                            </div>
                            <div class="col-md-12">
                                <fieldset>
                                    <input name="email" type="email" class="form-control" id="email" placeholder="Your email..." required="">
                                </fieldset>
                            </div>
                            <div class="col-md-12">
                                <fieldset>
                                    <textarea name="message" rows="6" class="form-control" id="message" placeholder="Your message..." required=""></textarea>
                                </fieldset>
                            </div>
                            <div class="col-md-12">
                                <fieldset>
                                    <button type="submit" id="form-submit" class="btn">我们</button>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-12">
                <div class="logo">
                    <a href="#" class="scroll-top"><em>我们</em>不一样</a>
                    <p>版权所有&copy; 2017年贵公司
                        |  更多的信息<a href="http://www.cssmoban.com/" target="_blank" title="模板之家">忍耐之家</a> - 开始 from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">我们的空间之旅</a></p>
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <div class="location">
                    <h4>位置</h4>
                    <ul>
                        <li>30莱佛士大道， <br> 1共和国路，</li>
                        <li>新加坡039803 <br>新加坡038975</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2 col-sm-12">
                <div class="contact-info">
                    <h4>More Info</h4>
                    <ul>
                        <li><em>电话</em>: 010-020-0340</li>
                        <li><em>Email</em>: tk@company.co</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2 col-sm-12">
                <div class="connect-us">
                    <h4>我们</h4>
                    <ul>
                        <li><a href="#" target="_parent"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#o" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>

<%@include file="master/header.jsp"%>
</body>
</html>
