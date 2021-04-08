/// data : {"curPage":1,"datas":[{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>记得mipmap刚出来的时候，出现过很多言论，XXX类型图片放mipmap更好。</p>\r\n<p>如今的观念基本停留在，仅将app icon放置到mipmap，其他的图片都放到drawable。</p>\r\n<p>那么我们想想：</p>\r\n<ol>\r\n<li>google 为啥要搞个mipmap，或者mipmap有什么特殊的能力？</li>\r\n<li>从源码上能做出相关分析吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17666,"link":"https://wanandroid.com/wenda/show/17666","niceDate":"2021-03-18 23:19","niceShareDate":"2021-03-17 21:12","origin":"","prefix":"","projectLink":"","publishTime":1616080780000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1615986729000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | mipmap vs drawable，傻傻分不清楚？","type":1,"userId":2,"visible":1,"zan":2},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>很多时候我们在自定义 View 的需要做动画的时候，我们可以依赖属性动画的回调周期性修改 自定义的属性值，然后调用 invalidate 方法实现。</p>\r\n<p>不过我还见过一个比较野的路子，它在 onDraw 里面直接修改属性，然后调用 invalidate() 方法。</p>\r\n<p>运行起来好像也没问题。</p>\r\n<p>那么问题来了：</p>\r\n<ol>\r\n<li>在 onDraw 里面调用 修改绘制相关属性（例如画圆，修改半径） invalidate() ，这种与属性动画的回调调用 invalidate()源码分析有什么区别？</li>\r\n<li>在 onDraw 里面调用  invalidate() 会存在什么问题？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17629,"link":"https://www.wanandroid.com/wenda/show/17629","niceDate":"2021-03-15 00:43","niceShareDate":"2021-03-15 00:43","origin":"","prefix":"","projectLink":"","publishTime":1615740221000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1615740191000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | onDraw 里面调用 invalidate 做动画，有什么问题？","type":1,"userId":2,"visible":1,"zan":6},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>线程大概应该非常熟悉了，一般面试问得比较多的可能是线程池相关的一些原理。</p>\r\n<p>不过在一个更高阶的面试过程中，可能会问考察线程与内存之间的一些联系。</p>\r\n<p>大家有没有思考过，目前业内一些头部 app，例如微信，抖音等，他们在运行时大概有多少个线程存活?</p>\r\n<p>另外如果大家比较关注 OOM 的话，线程比较多可能会导致 OOM，当然线程多导致OOM的原因不止一种，先不深究，想考虑一个问题：每个线程会占据多少内存？</p>\r\n<p>总结下问题：</p>\r\n<ol>\r\n<li>如何查看一个 app 在运行时，大概有多少线程在运行？</li>\r\n<li>每个线程会占据多少内存空间？这个内存空间是固定大小的吗？还是一开始很少，随着你方法调用越来越多，而动态增加？</li>\r\n<li>如何拿到一个线程已经使用的栈空间？</li>\r\n<li>我们能够调整一个线程占据的内存大小吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17356,"link":"https://wanandroid.com/wenda/show/17356","niceDate":"2021-03-18 23:20","niceShareDate":"2021-02-21 20:14","origin":"","prefix":"","projectLink":"","publishTime":1616080802000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1613909666000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Android 中线程与内存之间相关问题","type":0,"userId":2,"visible":1,"zan":3},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>Wall Clock Time 是一段代码在某个线程上实际执行的时间，但由于cpu是分时间片给线程的，同时一段代码可能由于IO，还是类似调用wait等线程调用方法，阻塞不执行了，此时cpu会分配给其它线程，但这段代码其实并没有执行完，可能等某个条件触发后，轮到这段代码在的线程分到cpu后，继续执行，而执行这段代码cpu真正的用时是Thread Time。</p>\r\n<p>了解这个概念后：</p>\r\n<ol>\r\n<li>在 Android中如何获取某个方法执行过程中的 Thread time , wall Time?</li>\r\n<li>了解了这两个时间之后，在我们做性能优化的时候有什么指导意义？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17564,"link":"https://www.wanandroid.com/wenda/show/17564","niceDate":"2021-03-15 00:43","niceShareDate":"2021-03-09 00:29","origin":"","prefix":"","projectLink":"","publishTime":1615740209000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1615220958000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 在做性能优化的时候，常常看到 Thread(Cpu) Time，Wall clock Time?","type":0,"userId":2,"visible":0,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>今天的问题比较细了，探索一个大家可能没关注过的 API，View中包含一个方法：</p>\r\n<ul>\r\n<li>hasOverlappingRendering() </li>\r\n</ul>\r\n<p>问题很直接：</p>\r\n<ol>\r\n<li>这个方法有什么用？</li>\r\n<li>在什么情况下我们会考虑复写这个方法？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17131,"link":"https://wanandroid.com/wenda/show/17131","niceDate":"2021-02-21 20:16","niceShareDate":"2021-01-31 17:09","origin":"","prefix":"","projectLink":"","publishTime":1613909777000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1612084141000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 今天还探索一个 View 的方法 hasOverlappingRendering()","type":0,"userId":2,"visible":0,"zan":9},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>大家都知道一个Java类从class文件到可以运行时，需要经历：加载、链接、初始化等过程，然后才能被创建对象（实例化）。</p>\r\n<p>今天问一个有趣的问题，有可能一个对象的实例化调用，要早于其初始化吗？</p>\r\n<p>白话点说：这个类中的构造方法要早于静态代码块的执行？</p>\r\n<ol>\r\n<li>怎么写会出现这种情况？</li>\r\n<li>分析其执行流程</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17083,"link":"https://www.wanandroid.com/wenda/show/17083","niceDate":"2021-02-21 20:15","niceShareDate":"2021-01-27 23:58","origin":"","prefix":"","projectLink":"","publishTime":1613909746000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1611763136000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 类要先加载、链接、初始化才能实例化，有特殊Case吗？","type":0,"userId":2,"visible":1,"zan":10},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>在上一问，我们了解了 Java 中 lambda 表达式的原理：</p>\r\n<p><a href=\"https://www.wanandroid.com/wenda/show/16717\">每日一问 | Java中匿名内部类写成 lambda，真的只是语法糖吗？</a></p>\r\n<p>新的问题来了，看下面一段简单的 lambda 代码：</p>\r\n<pre><code>Runnable r = ()-&gt;{\r\n      Log.d(&quot;test&quot;,&quot;hello, lambda&quot;);\r\n};\r\nr.run();\r\n</code></pre><ol>\r\n<li>上述代码在 Android 中与 Java 中，运行时原理有何不同？</li>\r\n<li>与 Java 的 lambda 相比，哪个更像是语法糖？</li>\r\n<li>transformClassesWithDesugarForDebug 这个任务是做什么的？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16771,"link":"https://www.wanandroid.com/wenda/show/16771","niceDate":"2021-01-31 17:20","niceShareDate":"2021-01-06 01:46","origin":"","prefix":"","projectLink":"","publishTime":1612084837000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1609868785000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Java 中的 lambda 与 Android 中的 lambda 有什么不同？","type":0,"userId":2,"visible":1,"zan":13},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<blockquote>\r\n<p>本题目摘自一篇 Blog，大家先尝试思考下，过两天注明博客链接。</p>\r\n</blockquote>\r\n<p>众所周知，对于 RxJava我们可以使用：</p>\r\n<ol>\r\n<li>observeOn</li>\r\n<li>subscribeOn</li>\r\n</ol>\r\n<p>去做线程调度，我们看个例子：</p>\r\n<pre><code>fun fetchItem(): Single&lt;Item&gt; {\r\n    return download(itemId.getAndIncrement())\r\n        .flatMap(::unZip)\r\n        .flatMap(::checkMd5)\r\n}\r\n\r\nprivate fun download(id: Int): Single&lt;Item&gt; {\r\n    return Single.just(id)\r\n        //Simulate a long time operation\r\n        .delay(300, TimeUnit.MILLISECONDS, Schedulers.io())\r\n        .map { Item(it) }\r\n}\r\n\r\nprivate fun unZip(item: Item): Single&lt;Item&gt; {\r\n    return Single.just(item)\r\n        //Simulate a long time operation\r\n        .delay(300, TimeUnit.MILLISECONDS, Schedulers.io())\r\n}\r\n\r\nprivate fun checkMd5(item: Item): Single&lt;Item&gt; {\r\n    return Single.just(item)\r\n        //Simulate a long time operation\r\n        .delay(300, TimeUnit.MILLISECONDS, Schedulers.io())\r\n}\r\n</code></pre><p>上面模拟的操作中，download unZip checkMd5 都各自指定了调度器，导致 fetchItem 实际上发生了三次线程切换。 </p>\r\n<p>对于这种一系列的耗时操作来说，完全可以运行在同一条后台线程上。</p>\r\n<p>还有这个更刻意的例子：</p>\r\n<pre><code>Observable\r\n    .create(emitter -&gt; {\r\n        System.out.println(&quot;create on &quot; + Thread.currentThread().getName());\r\n        emitter.onNext(&quot;Test&quot;);\r\n        emitter.onComplete();\r\n    })\r\n    .subscribeOn(Schedulers.io())\r\n    .observeOn(Schedulers.io())\r\n    .map(s -&gt; {\r\n        System.out.println(&quot;map on &quot; + Thread.currentThread().getName());\r\n        return s;\r\n    })\r\n    .observeOn(Schedulers.io())\r\n    .flatMapCompletable(s -&gt; {\r\n        System.out.println(&quot;flatMap on &quot; + Thread.currentThread().getName());\r\n        return Completable.complete();\r\n    })\r\n    .subscribe();\r\n</code></pre><p>其实几次操作都交给了 io 线程调度，大概率运行在不同的线程上，实际上完全可以避免没有必要的 io 调度。</p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>我们如何无感知的避免这类多余的线程调度，例如当前方法已经运行在 io 线程，那么就没有必要再去做 io 线程调度了；</li>\r\n<li>无感知指的是，不需要刻意去修改业务逻辑代码，毕竟上面第一个例子那个几个方法内部指定Schedulers.io()也是合理的。</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16929,"link":"https://www.wanandroid.com/wenda/show/16929","niceDate":"2021-01-31 16:58","niceShareDate":"2021-01-16 21:29","origin":"","prefix":"","projectLink":"","publishTime":1612083486000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1610803767000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 如何检测和避免 RxJava 的重复线程切换？","type":0,"userId":2,"visible":1,"zan":2},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<ul>\r\n<li>Thread.setPrioriy()</li>\r\n<li>Process.setThreadPriority()</li>\r\n</ul>\r\n<p>请问：</p>\r\n<ol>\r\n<li>两种方式有何区别？更推荐用哪种方式？</li>\r\n<li>Android 中的线程与操作系统中的线程是如何对应的？通过优先级的设置如何影响到 CPU 的调度？</li>\r\n<li>方式 1 有什么问题吗或者说使用注意事项吗?（这道题有点偏，可以选答）</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16848,"link":"https://www.wanandroid.com/wenda/show/16848","niceDate":"2021-01-27 23:59","niceShareDate":"2021-01-10 23:59","origin":"","prefix":"","projectLink":"","publishTime":1611763172000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1610294379000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Android 中两种设置线程优先级的方式，有何区别？","type":0,"userId":2,"visible":0,"zan":7},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>我们来看两段代码：</p>\r\n<p>lambda 版本：</p>\r\n<pre><code>public class LambdaTest{\r\n\r\n    public static void main(String[] args) {\r\n        Runnable r = ()-&gt;{\r\n            System.out.println(&quot;hello, lambda&quot;);\r\n        };\r\n        r.run();\r\n    }\r\n\r\n}\r\n</code></pre><p>匿名内部类版本：</p>\r\n<pre><code>public class LambdaTest2{\r\n\r\n    public static void main(String[] args) {\r\n        Runnable r = new Runnable(){\r\n            @Override\r\n            public void run(){\r\n                System.out.println(&quot;hello, lambda&quot;);\r\n            }\r\n        };\r\n        r.run();\r\n    }\r\n\r\n}\r\n</code></pre><p>在日常开发过程中，其实我们感受不到两者有什么区别，反正更终运行的结果都是一致的。</p>\r\n<p>那么问题来了，这两个写法究竟有什么区别？仅仅在写法上的不同吗？</p>\r\n<blockquote>\r\n<p>注意：本题目针对 Java语言。</p>\r\n</blockquote>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16717,"link":"https://www.wanandroid.com/wenda/show/16717","niceDate":"2021-01-11 00:00","niceShareDate":"2021-01-03 20:34","origin":"","prefix":"","projectLink":"","publishTime":1610294436000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1609677252000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Java中匿名内部类写成 lambda，真的只是语法糖吗？","type":0,"userId":2,"visible":1,"zan":6},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>RxJava 算是现在 Android 中非常常用的一个开源库了，例如和 retrofit 配合完成网络请求封装。</p>\r\n<p>我大概看到以下几个关键词都能完成网络请求的发送：</p>\r\n<pre><code>@GET(&quot;query&quot;)\r\nObservable&lt;Article&gt; getArticle(...)\r\n</code></pre><p>其中Observable可以替换为Flowable,Single,Maybe，问题来了：</p>\r\n<ol>\r\n<li>这几个关键词有什么区别呢？分别在什么场景下比较适用？</li>\r\n<li>在网络请求和 retrofit 配合这块，哪个关键词更加合理呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16634,"link":"https://www.wanandroid.com/wenda/show/16634","niceDate":"2021-01-03 20:34","niceShareDate":"2020-12-27 22:37","origin":"","prefix":"","projectLink":"","publishTime":1609677292000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1609079863000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | RxJava中Observable、Flowable、Single、Maybe 有何区别?","type":0,"userId":2,"visible":1,"zan":5},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>我们在写代码的时候，有时候很容易使用一个高版本的 API，如果不注意，可能会导致在一些低版本的设备崩溃。</p>\r\n<p>因此，我们可以选择引入 lint 在编译时进行检查。</p>\r\n<p>今天的问题是？</p>\r\n<ol>\r\n<li>应用：如何在打包时，强制开启 New API检查？</li>\r\n<li>原理：lint 怎么能知道某个 方法是哪个版本加入的？是有一个汇总的地方维护着这样的方法列表吗？</li>\r\n<li>原理：即使有这样的一个列表，lint是怎么扫描每一个方法调用的？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15949,"link":"https://www.wanandroid.com/wenda/show/15949","niceDate":"2020-12-27 22:39","niceShareDate":"2020-11-02 00:14","origin":"","prefix":"","projectLink":"","publishTime":1609079946000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1604247264000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Call requires API level 23 (current min is 14) 扫描出来的原理是？","type":0,"userId":2,"visible":1,"zan":10},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>大家在日常开发过程中，应该对invalidate，requestLayout简易的区别都理解，更近准备针对这两个问题问几问。</p>\r\n<p>先来invalidate吧。</p>\r\n<ol>\r\n<li>invalidate 的执行流程是什么样子的？</li>\r\n<li>如果连续调用多次invalidate执行流程是？</li>\r\n<li>invalidate重绘的区域是如何确定的，仅是当前View还是整个View树，还是某种计算方式？</li>\r\n<li>View除了invalidate()外，还有个方法叫做postInvalidateOnAnimation()，这两个方法有何区别？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16190,"link":"https://wanandroid.com/wenda/show/16190","niceDate":"2020-12-27 22:38","niceShareDate":"2020-11-24 13:32","origin":"","prefix":"","projectLink":"","publishTime":1609079936000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1606195930000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | View invalidate() 相关的一些细节探究~","type":0,"userId":2,"visible":1,"zan":13},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>先来看一段代码：</p>\r\n<pre><code>final class A {\r\n    String selfIntroduction() {\r\n        return &quot;I&#39;m A&quot;;\r\n    }\r\n}\r\n\r\nclass B {\r\n    String selfIntroduction() {\r\n        return &quot;I&#39;m B&quot;;\r\n    }\r\n}\r\n\r\nclass Test {\r\n    public final A a = new A();\r\n}\r\n</code></pre>\r\n<p><strong>问题来了：</strong><br><strong>1. Test.<code>a</code>能被替换吗？</strong></p>\r\n<p><strong>2. Test.<code>a</code>能被替换成B对象的实例吗？</strong></p>\r\n<p><strong>3. 如果问题2成立，在成功替换对象之后，调用Test.a.<code>selfIntroduction</code>方法，返回的是什么？ 为什么会这样？</strong></p>\r\n<p>把代码稍微改一下：</p>\r\n<pre><code>final class A {\r\n    String selfIntroduction = &quot;I&#39;m A&quot;;\r\n\r\n    String selfIntroduction() {\r\n        return selfIntroduction;\r\n    }\r\n}\r\n\r\nclass B {\r\n    String selfIntroduction = &quot;I&#39;m B&quot;;\r\n\r\n    String selfIntroduction() {\r\n        return selfIntroduction;\r\n    }\r\n}\r\n\r\nclass Test {\r\n    public final A a = new A();\r\n}\r\n</code></pre>\r\n<p><strong>4. 在成功替换对象之后，调用Test.a.<code>selfIntroduction</code>方法，返回的是什么？ 为什么？</strong></p>\r\n<p>再把代码改一下：</p>\r\n<pre><code>final class A {\r\n    String selfIntroduction = &quot;I&#39;m A&quot;;\r\n\r\n    String selfIntroduction() {\r\n        return selfIntroduction;\r\n    }\r\n}\r\n\r\nclass B {\r\n    String selfIntroduction = &quot;I&#39;m B&quot;;\r\n}\r\n\r\nclass Test {\r\n    public final A a = new A();\r\n}\r\n</code></pre>\r\n<p><strong>5. 在成功替换对象之后，调用Test.a.<code>selfIntroduction</code>方法，会报错吗？ 为什么？</strong></p>\r\n<p>继续改一下代码：</p>\r\n<pre><code>final class A {\r\n    String selfIntroduction = &quot;I&#39;m A&quot;;\r\n\r\n    String selfIntroduction() {\r\n        return selfIntroduction;\r\n    }\r\n}\r\n\r\nclass B {\r\n    String fakeSelfIntroduction = &quot;I&#39;m fake B&quot;;\r\n    String selfIntroduction = &quot;I&#39;m B&quot;;\r\n}\r\n\r\nclass Test {\r\n    public final A a = new A();\r\n}\r\n</code></pre>\r\n<p><strong>6. 在成功替换对象之后，调用Test.a.<code>selfIntroduction</code>方法，会报错吗？ 如果不会报错，返回值是什么？ 为什么会这样？</strong></p>\r\n<p>再改一次代码吧：</p>\r\n<pre><code>final class A {\r\n    String selfIntroduction = &quot;I&#39;m A&quot;;\r\n\r\n    String selfIntroduction() {\r\n        return selfIntroduction;\r\n    }\r\n}\r\n\r\nclass B {\r\n    int i = 1;\r\n    String fakeSelfIntroduction = &quot;I&#39;m Fake B&quot;;\r\n    String selfIntroduction = &quot;I&#39;m B&quot;;\r\n}\r\n\r\nclass Test {\r\n    public final A a = new A();\r\n}\r\n</code></pre>\r\n<p><strong>7. 在成功替换对象之后，调用Test.a.<code>selfIntroduction</code>方法，会报错吗？ 为什么？</strong></p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15797,"link":"https://www.wanandroid.com/wenda/show/15797","niceDate":"2020-11-02 00:16","niceShareDate":"2020-10-19 23:57","origin":"","prefix":"","projectLink":"","publishTime":1604247367000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1603123027000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 当Unsafe遇上final，超神奇的事情发生了？","type":0,"userId":2,"visible":1,"zan":8},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>很多时候我们讨论属性动画与之前的View Animation之间的区别，很多同学都会说：</p>\r\n<p>“属性动画在移动后，仍然可以响应用户的点击”</p>\r\n<p>原因可以看这篇：<a href=\"https://www.wanandroid.com/wenda/show/8644\">每日一问 | 为什么属性动画移动一个控件后，目标位置仍然能响应用户事件？</a></p>\r\n<p>了解的同学应该清楚，能响应只是在事件分发的时候，做了一下坐标映射。</p>\r\n<p>今天，我们讨论另一个区别，就是当属性动画与硬件加速配合时，会摩擦出什么火花？</p>\r\n<p>看一个示例：</p>\r\n<pre><code>MyTextView tv =view.findViewById( R.id.tv_name);\r\n        tv.setOnClickListener(new View.OnClickListener() {\r\n            @Override\r\n            public void onClick(View v) {\r\n                ValueAnimator valueAnimator = ValueAnimator.ofInt(0, 300).setDuration(2000);\r\n                valueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {\r\n                    @Override\r\n                    public void onAnimationUpdate(ValueAnimator animation) {\r\n                        v.setTranslationY((int) animation.getAnimatedValue());\r\n                    }\r\n                });\r\n                valueAnimator.start();\r\n            }\r\n        });\r\n</code></pre><p>很简答，我们自定义一个TextView，点击的时候，对它做一点往下的移动。</p>\r\n<p>布局文件：</p>\r\n<pre><code>&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;\r\n&lt;com.example.zhanghongyang.kotlinlearn.view.MyFrameLayout \r\n    xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;\r\n    android:layout_width=&quot;match_parent&quot;\r\n    android:layout_height=&quot;match_parent&quot;&gt;\r\n\r\n    &lt;com.example.zhanghongyang.kotlinlearn.view.MyTextView\r\n        android:id=&quot;@+id/tv_name&quot;\r\n        android:layout_width=&quot;wrap_content&quot;\r\n        android:layout_height=&quot;wrap_content&quot;\r\n        android:text=&quot;hello&quot; /&gt;\r\n\r\n&lt;/com.example.zhanghongyang.kotlinlearn.view.MyFrameLayout&gt;\r\n</code></pre><p>当<strong>硬件加速</strong>开启时（默认就是开启的）:</p>\r\n<ol>\r\n<li>动画执行过程中：MyTextView的draw方法会回调吗？</li>\r\n<li>动画执行过程中：MyFrameLayout的dispatchDraw方法会回调吗？</li>\r\n</ol>\r\n<p>当<strong>硬件加速</strong>关闭时:</p>\r\n<ol>\r\n<li>动画执行过程中：MyTextView的draw方法会回调吗？</li>\r\n<li>动画执行过程中：MyFrameLayout的dispatchDraw方法会回调吗？</li>\r\n</ol>\r\n<p>如果两者有差异：</p>\r\n<ol>\r\n<li><strong>v.setTranslationY</strong>在开启和不开启硬件加速过程中，执行的逻辑到底有什么变化？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15582,"link":"https://wanandroid.com/wenda/show/15582","niceDate":"2020-10-26 23:45","niceShareDate":"2020-10-05 11:21","origin":"","prefix":"","projectLink":"","publishTime":1603727114000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1601868088000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 属性动画与硬件加速的相遇，不是你想的那么简单？","type":0,"userId":2,"visible":1,"zan":16},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>每当大家有在编译期间有修改字节码的需求，第一反应应该就是使用 Transform 吧，我们知道每个 Transform 都有它的输入、输出，问几个问题：</p>\r\n<ol>\r\n<li>在编译过程中，有哪些“系统Transform”执行？</li>\r\n<li>自定义 Transform和其他系统Transform执行的顺序是怎么样的？</li>\r\n<li>Transform和 gradle task的关系是怎么样的？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15215,"link":"https://www.wanandroid.com/wenda/show/15215","niceDate":"2020-10-26 23:45","niceShareDate":"2020-09-12 18:32","origin":"","prefix":"","projectLink":"","publishTime":1603727102000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1599906744000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 玩转 Gradle，可不能不熟悉 Transform，那么，我要开始问了。","type":0,"userId":2,"visible":1,"zan":40},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>RecyclerView$Adapter 的：</p>\r\n<pre><code>setHasStableIds(boolean)\r\n</code></pre><ol>\r\n<li>在什么场景下我们会考虑设置为true?</li>\r\n<li>设置为true会带来什么好处？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15514,"link":"https://wanandroid.com/wenda/show/15514","niceDate":"2020-10-26 23:44","niceShareDate":"2020-10-03 11:43","origin":"","prefix":"","projectLink":"","publishTime":1603727094000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1601696580000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 关于 RecyclerView$Adapter setHasStableIds(boolean)的一切","type":0,"userId":2,"visible":1,"zan":18},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>更近实在是太忙了，抽空更新一问。</p>\r\n<p>想到一个非常有意思的问题：</p>\r\n<p>如果 app 启动了一个 Activity，那么在这个 Activity 展示的情况下，问题来了：</p>\r\n<p>1.上述场景背后至少有多少个线程？<br>2.每个线程具体的作用是什么？</p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15188,"link":"https://www.wanandroid.com/wenda/show/15188","niceDate":"2020-10-12 00:47","niceShareDate":"2020-09-09 23:54","origin":"","prefix":"","projectLink":"","publishTime":1602434832000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1599666870000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 启动了Activity 的 app 至少有几个线程？","type":0,"userId":2,"visible":1,"zan":25},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>上次我们问了：</p>\r\n<p><a href=\"https://wanandroid.com/wenda/show/14941\">每日一问 | Java 泛型与接口碰撞出的火花！</a></p>\r\n<p>不少同学认识到了，<strong>「桥接方法」解决了实现类与接口参数类型不匹配的问题。</strong></p>\r\n<p>那么我们再来看一个例子：</p>\r\n<pre><code>interface TestInter&lt;T&gt; {\r\n\r\n    T getName(String name);\r\n\r\n}\r\n</code></pre><p>实现类：</p>\r\n<pre><code>class TestImpl implements TestInter&lt;String&gt; {\r\n    @Override\r\n    public String getName(String name) {\r\n        return null;\r\n    }\r\n}\r\n</code></pre><p>这次猜我的关注点在哪？</p>\r\n<p>我们反编译一下TestImpl：</p>\r\n<pre><code>public java.lang.String getName(java.lang.String);\r\n  descriptor: (Ljava/lang/String;)Ljava/lang/String;\r\n  flags: ACC_PUBLIC\r\n\r\n\r\npublic java.lang.Object getName(java.lang.String);\r\n  descriptor: (Ljava/lang/String;)Ljava/lang/Object;\r\n  flags: ACC_PUBLIC, ACC_BRIDGE, ACC_SYNTHETIC\r\n</code></pre><p>又看到了ACC_BRIDGE，ACC_SYNTHETIC，已知知识。</p>\r\n<p>可以看到生成的两个方法，我们转成Java的展现形式：</p>\r\n<ol>\r\n<li>String getName(String str)</li>\r\n<li>Object getName(String str);</li>\r\n</ol>\r\n<p>有没有觉得奇怪？</p>\r\n<p>我贴张图，你就能看明白了：</p>\r\n<p><img src=\"https://wanandroid.com/blogimgs/9d06cc96-4343-4e9c-83f0-a448a6e3bbc1.png\" alt></p>\r\n<p>这两个方法的方法名，参数均相同，只有返回值不同，在我们Java平时编写中是不允许的。</p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>为何在这个场景下，允许「一个类中有方法名，参数均相同，只有返回值不同」两个方法？</li>\r\n<li>既然class文件有两个getName，那么我们调用getName时，是如何确定调用的哪个方法呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":14990,"link":"https://wanandroid.com/wenda/show/14990","niceDate":"2020-10-03 11:43","niceShareDate":"2020-08-26 21:08","origin":"","prefix":"","projectLink":"","publishTime":1601696612000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1598447321000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 |  当JVM遇到桥接方法，暴露出了什么？","type":0,"userId":2,"visible":1,"zan":8},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>之前我们问过：</p>\r\n<p><a href=\"https://wanandroid.com/wenda/show/14738\">每日一问 Java编译器背后干了多少活 之 「内部类构造」</a></p>\r\n<p>提到了isSynthetic，<strong>注意今天的问题也是个类似的问题。</strong></p>\r\n<p>首先我们编写个接口：</p>\r\n<pre><code>interface Animal&lt;T&gt;{\r\n    void test(T t);\r\n}\r\n</code></pre><p>这个接口有个实现类：</p>\r\n<pre><code>class Dog implements Animal&lt;String&gt;{\r\n\r\n    @override\r\n    public void test(String str){\r\n    }\r\n}\r\n</code></pre><p>符合我们平时的写法对吧。</p>\r\n<p>但是你仔细推敲一下：</p>\r\n<p>接口 Animal 类的泛型，在编译成 class 后，会经历泛型擦除，会变成这样：</p>\r\n<pre><code>interface Animal{\r\n    void test(Object obj);\r\n}\r\n</code></pre><p>而实现类Dog里面有个方法<code>test(String str)</code>，注意<strong>这个方法和接口类的方法参数并不一致</strong>。</p>\r\n<p>那么也就是说，<strong>并没有实现接口中的方法。</strong></p>\r\n<p>但是，接口的方法，实现类是必须实现的。</p>\r\n<p>问题来了：</p>\r\n<ul>\r\n<li>为何不报错呢？</li>\r\n<li>除了这个场景，编译期间还有哪里有类似的处理方式么？(可不回答)</li>\r\n</ul>","descMd":"","envelopePic":"","fresh":false,"host":"","id":14941,"link":"https://wanandroid.com/wenda/show/14941","niceDate":"2020-09-09 23:54","niceShareDate":"2020-08-23 23:53","origin":"","prefix":"","projectLink":"","publishTime":1599666893000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1598198007000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问  | Java 泛型与接口碰撞出的火花！","type":0,"userId":2,"visible":0,"zan":13},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>之前写代码，需要在一些特殊时机做一些事情，例如释放内存等，特殊时机包含：</p>\r\n<ol>\r\n<li>应用退出（用户back 退出，没有任何 Activity 了，但进程还存活的情况）</li>\r\n<li>应用 Home 按键置于后台</li>\r\n</ol>\r\n<p>问题来了，怎么方便的判断这两种时机呢？</p>\r\n<p><strong>注意：需要考虑屏幕旋转异常情况。</strong></p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":14774,"link":"https://wanandroid.com/wenda/show/14774","niceDate":"2020-08-26 21:11","niceShareDate":"2020-08-16 19:55","origin":"","prefix":"","projectLink":"","publishTime":1598447504000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1597578943000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 如何判断应用退出，或者到后台了？","type":0,"userId":2,"visible":0,"zan":11},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>我们来看一坨代码：</p>\r\n<pre><code>public class A{\r\n\r\n    public static void main(String[] args){\r\n        B b = new A.B();\r\n    }\r\n\r\n\r\n    private static class B{\r\n\r\n    }\r\n\r\n}\r\n</code></pre><p>上述代码，如果我们执行<code>javac A.java</code>编译，会产生几个class文件？</p>\r\n<p>我们分析下：</p>\r\n<ol>\r\n<li>A.class 肯定有</li>\r\n<li>有个静态内部类B，还有个A$B.class</li>\r\n</ol>\r\n<p>两个。</p>\r\n<p>实际运行你会发现有三个：</p>\r\n<ol>\r\n<li>A.class</li>\r\n<li>A$B.class</li>\r\n<li>A$1.class</li>\r\n</ol>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>为什么会多了个A$1.class?</li>\r\n<li>Java里面<code>java.lang.reflect.Method</code>以及<code>java.lang.Class</code>都有一个<code>isSynthetic()</code>方法，是什么意思？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":14738,"link":"https://wanandroid.com/wenda/show/14738","niceDate":"2020-08-23 23:54","niceShareDate":"2020-08-12 10:20","origin":"","prefix":"","projectLink":"","publishTime":1598198050000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1597198816000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问  Java编译器背后干了多少活 之 「内部类构造」","type":0,"userId":2,"visible":0,"zan":18}],"offset":0,"over":false,"pageCount":6,"size":22,"total":131}
/// errorCode : 0
/// errorMsg : ""

class QuestionData {
  QuestionResult _data;
  int _errorCode;
  String _errorMsg;

  QuestionResult get data => _data;
  int get errorCode => _errorCode;
  String get errorMsg => _errorMsg;

  QuestionData({
    QuestionResult data,
      int errorCode, 
      String errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  QuestionData.fromJson(dynamic json) {
    _data = json["data"] != null ? QuestionResult.fromJson(json["data"]) : null;
    _errorCode = json["errorCode"];
    _errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    map["errorCode"] = _errorCode;
    map["errorMsg"] = _errorMsg;
    return map;
  }

}

/// curPage : 1
/// datas : [{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>记得mipmap刚出来的时候，出现过很多言论，XXX类型图片放mipmap更好。</p>\r\n<p>如今的观念基本停留在，仅将app icon放置到mipmap，其他的图片都放到drawable。</p>\r\n<p>那么我们想想：</p>\r\n<ol>\r\n<li>google 为啥要搞个mipmap，或者mipmap有什么特殊的能力？</li>\r\n<li>从源码上能做出相关分析吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17666,"link":"https://wanandroid.com/wenda/show/17666","niceDate":"2021-03-18 23:19","niceShareDate":"2021-03-17 21:12","origin":"","prefix":"","projectLink":"","publishTime":1616080780000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1615986729000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | mipmap vs drawable，傻傻分不清楚？","type":1,"userId":2,"visible":1,"zan":2},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>很多时候我们在自定义 View 的需要做动画的时候，我们可以依赖属性动画的回调周期性修改 自定义的属性值，然后调用 invalidate 方法实现。</p>\r\n<p>不过我还见过一个比较野的路子，它在 onDraw 里面直接修改属性，然后调用 invalidate() 方法。</p>\r\n<p>运行起来好像也没问题。</p>\r\n<p>那么问题来了：</p>\r\n<ol>\r\n<li>在 onDraw 里面调用 修改绘制相关属性（例如画圆，修改半径） invalidate() ，这种与属性动画的回调调用 invalidate()源码分析有什么区别？</li>\r\n<li>在 onDraw 里面调用  invalidate() 会存在什么问题？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17629,"link":"https://www.wanandroid.com/wenda/show/17629","niceDate":"2021-03-15 00:43","niceShareDate":"2021-03-15 00:43","origin":"","prefix":"","projectLink":"","publishTime":1615740221000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1615740191000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | onDraw 里面调用 invalidate 做动画，有什么问题？","type":1,"userId":2,"visible":1,"zan":6},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>线程大概应该非常熟悉了，一般面试问得比较多的可能是线程池相关的一些原理。</p>\r\n<p>不过在一个更高阶的面试过程中，可能会问考察线程与内存之间的一些联系。</p>\r\n<p>大家有没有思考过，目前业内一些头部 app，例如微信，抖音等，他们在运行时大概有多少个线程存活?</p>\r\n<p>另外如果大家比较关注 OOM 的话，线程比较多可能会导致 OOM，当然线程多导致OOM的原因不止一种，先不深究，想考虑一个问题：每个线程会占据多少内存？</p>\r\n<p>总结下问题：</p>\r\n<ol>\r\n<li>如何查看一个 app 在运行时，大概有多少线程在运行？</li>\r\n<li>每个线程会占据多少内存空间？这个内存空间是固定大小的吗？还是一开始很少，随着你方法调用越来越多，而动态增加？</li>\r\n<li>如何拿到一个线程已经使用的栈空间？</li>\r\n<li>我们能够调整一个线程占据的内存大小吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17356,"link":"https://wanandroid.com/wenda/show/17356","niceDate":"2021-03-18 23:20","niceShareDate":"2021-02-21 20:14","origin":"","prefix":"","projectLink":"","publishTime":1616080802000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1613909666000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Android 中线程与内存之间相关问题","type":0,"userId":2,"visible":1,"zan":3},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>Wall Clock Time 是一段代码在某个线程上实际执行的时间，但由于cpu是分时间片给线程的，同时一段代码可能由于IO，还是类似调用wait等线程调用方法，阻塞不执行了，此时cpu会分配给其它线程，但这段代码其实并没有执行完，可能等某个条件触发后，轮到这段代码在的线程分到cpu后，继续执行，而执行这段代码cpu真正的用时是Thread Time。</p>\r\n<p>了解这个概念后：</p>\r\n<ol>\r\n<li>在 Android中如何获取某个方法执行过程中的 Thread time , wall Time?</li>\r\n<li>了解了这两个时间之后，在我们做性能优化的时候有什么指导意义？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17564,"link":"https://www.wanandroid.com/wenda/show/17564","niceDate":"2021-03-15 00:43","niceShareDate":"2021-03-09 00:29","origin":"","prefix":"","projectLink":"","publishTime":1615740209000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1615220958000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 在做性能优化的时候，常常看到 Thread(Cpu) Time，Wall clock Time?","type":0,"userId":2,"visible":0,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>今天的问题比较细了，探索一个大家可能没关注过的 API，View中包含一个方法：</p>\r\n<ul>\r\n<li>hasOverlappingRendering() </li>\r\n</ul>\r\n<p>问题很直接：</p>\r\n<ol>\r\n<li>这个方法有什么用？</li>\r\n<li>在什么情况下我们会考虑复写这个方法？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17131,"link":"https://wanandroid.com/wenda/show/17131","niceDate":"2021-02-21 20:16","niceShareDate":"2021-01-31 17:09","origin":"","prefix":"","projectLink":"","publishTime":1613909777000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1612084141000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 今天还探索一个 View 的方法 hasOverlappingRendering()","type":0,"userId":2,"visible":0,"zan":9},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>大家都知道一个Java类从class文件到可以运行时，需要经历：加载、链接、初始化等过程，然后才能被创建对象（实例化）。</p>\r\n<p>今天问一个有趣的问题，有可能一个对象的实例化调用，要早于其初始化吗？</p>\r\n<p>白话点说：这个类中的构造方法要早于静态代码块的执行？</p>\r\n<ol>\r\n<li>怎么写会出现这种情况？</li>\r\n<li>分析其执行流程</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":17083,"link":"https://www.wanandroid.com/wenda/show/17083","niceDate":"2021-02-21 20:15","niceShareDate":"2021-01-27 23:58","origin":"","prefix":"","projectLink":"","publishTime":1613909746000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1611763136000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 类要先加载、链接、初始化才能实例化，有特殊Case吗？","type":0,"userId":2,"visible":1,"zan":10},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>在上一问，我们了解了 Java 中 lambda 表达式的原理：</p>\r\n<p><a href=\"https://www.wanandroid.com/wenda/show/16717\">每日一问 | Java中匿名内部类写成 lambda，真的只是语法糖吗？</a></p>\r\n<p>新的问题来了，看下面一段简单的 lambda 代码：</p>\r\n<pre><code>Runnable r = ()-&gt;{\r\n      Log.d(&quot;test&quot;,&quot;hello, lambda&quot;);\r\n};\r\nr.run();\r\n</code></pre><ol>\r\n<li>上述代码在 Android 中与 Java 中，运行时原理有何不同？</li>\r\n<li>与 Java 的 lambda 相比，哪个更像是语法糖？</li>\r\n<li>transformClassesWithDesugarForDebug 这个任务是做什么的？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16771,"link":"https://www.wanandroid.com/wenda/show/16771","niceDate":"2021-01-31 17:20","niceShareDate":"2021-01-06 01:46","origin":"","prefix":"","projectLink":"","publishTime":1612084837000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1609868785000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Java 中的 lambda 与 Android 中的 lambda 有什么不同？","type":0,"userId":2,"visible":1,"zan":13},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<blockquote>\r\n<p>本题目摘自一篇 Blog，大家先尝试思考下，过两天注明博客链接。</p>\r\n</blockquote>\r\n<p>众所周知，对于 RxJava我们可以使用：</p>\r\n<ol>\r\n<li>observeOn</li>\r\n<li>subscribeOn</li>\r\n</ol>\r\n<p>去做线程调度，我们看个例子：</p>\r\n<pre><code>fun fetchItem(): Single&lt;Item&gt; {\r\n    return download(itemId.getAndIncrement())\r\n        .flatMap(::unZip)\r\n        .flatMap(::checkMd5)\r\n}\r\n\r\nprivate fun download(id: Int): Single&lt;Item&gt; {\r\n    return Single.just(id)\r\n        //Simulate a long time operation\r\n        .delay(300, TimeUnit.MILLISECONDS, Schedulers.io())\r\n        .map { Item(it) }\r\n}\r\n\r\nprivate fun unZip(item: Item): Single&lt;Item&gt; {\r\n    return Single.just(item)\r\n        //Simulate a long time operation\r\n        .delay(300, TimeUnit.MILLISECONDS, Schedulers.io())\r\n}\r\n\r\nprivate fun checkMd5(item: Item): Single&lt;Item&gt; {\r\n    return Single.just(item)\r\n        //Simulate a long time operation\r\n        .delay(300, TimeUnit.MILLISECONDS, Schedulers.io())\r\n}\r\n</code></pre><p>上面模拟的操作中，download unZip checkMd5 都各自指定了调度器，导致 fetchItem 实际上发生了三次线程切换。 </p>\r\n<p>对于这种一系列的耗时操作来说，完全可以运行在同一条后台线程上。</p>\r\n<p>还有这个更刻意的例子：</p>\r\n<pre><code>Observable\r\n    .create(emitter -&gt; {\r\n        System.out.println(&quot;create on &quot; + Thread.currentThread().getName());\r\n        emitter.onNext(&quot;Test&quot;);\r\n        emitter.onComplete();\r\n    })\r\n    .subscribeOn(Schedulers.io())\r\n    .observeOn(Schedulers.io())\r\n    .map(s -&gt; {\r\n        System.out.println(&quot;map on &quot; + Thread.currentThread().getName());\r\n        return s;\r\n    })\r\n    .observeOn(Schedulers.io())\r\n    .flatMapCompletable(s -&gt; {\r\n        System.out.println(&quot;flatMap on &quot; + Thread.currentThread().getName());\r\n        return Completable.complete();\r\n    })\r\n    .subscribe();\r\n</code></pre><p>其实几次操作都交给了 io 线程调度，大概率运行在不同的线程上，实际上完全可以避免没有必要的 io 调度。</p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>我们如何无感知的避免这类多余的线程调度，例如当前方法已经运行在 io 线程，那么就没有必要再去做 io 线程调度了；</li>\r\n<li>无感知指的是，不需要刻意去修改业务逻辑代码，毕竟上面第一个例子那个几个方法内部指定Schedulers.io()也是合理的。</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16929,"link":"https://www.wanandroid.com/wenda/show/16929","niceDate":"2021-01-31 16:58","niceShareDate":"2021-01-16 21:29","origin":"","prefix":"","projectLink":"","publishTime":1612083486000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1610803767000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 如何检测和避免 RxJava 的重复线程切换？","type":0,"userId":2,"visible":1,"zan":2},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<ul>\r\n<li>Thread.setPrioriy()</li>\r\n<li>Process.setThreadPriority()</li>\r\n</ul>\r\n<p>请问：</p>\r\n<ol>\r\n<li>两种方式有何区别？更推荐用哪种方式？</li>\r\n<li>Android 中的线程与操作系统中的线程是如何对应的？通过优先级的设置如何影响到 CPU 的调度？</li>\r\n<li>方式 1 有什么问题吗或者说使用注意事项吗?（这道题有点偏，可以选答）</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16848,"link":"https://www.wanandroid.com/wenda/show/16848","niceDate":"2021-01-27 23:59","niceShareDate":"2021-01-10 23:59","origin":"","prefix":"","projectLink":"","publishTime":1611763172000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1610294379000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Android 中两种设置线程优先级的方式，有何区别？","type":0,"userId":2,"visible":0,"zan":7},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>我们来看两段代码：</p>\r\n<p>lambda 版本：</p>\r\n<pre><code>public class LambdaTest{\r\n\r\n    public static void main(String[] args) {\r\n        Runnable r = ()-&gt;{\r\n            System.out.println(&quot;hello, lambda&quot;);\r\n        };\r\n        r.run();\r\n    }\r\n\r\n}\r\n</code></pre><p>匿名内部类版本：</p>\r\n<pre><code>public class LambdaTest2{\r\n\r\n    public static void main(String[] args) {\r\n        Runnable r = new Runnable(){\r\n            @Override\r\n            public void run(){\r\n                System.out.println(&quot;hello, lambda&quot;);\r\n            }\r\n        };\r\n        r.run();\r\n    }\r\n\r\n}\r\n</code></pre><p>在日常开发过程中，其实我们感受不到两者有什么区别，反正更终运行的结果都是一致的。</p>\r\n<p>那么问题来了，这两个写法究竟有什么区别？仅仅在写法上的不同吗？</p>\r\n<blockquote>\r\n<p>注意：本题目针对 Java语言。</p>\r\n</blockquote>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16717,"link":"https://www.wanandroid.com/wenda/show/16717","niceDate":"2021-01-11 00:00","niceShareDate":"2021-01-03 20:34","origin":"","prefix":"","projectLink":"","publishTime":1610294436000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1609677252000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Java中匿名内部类写成 lambda，真的只是语法糖吗？","type":0,"userId":2,"visible":1,"zan":6},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>RxJava 算是现在 Android 中非常常用的一个开源库了，例如和 retrofit 配合完成网络请求封装。</p>\r\n<p>我大概看到以下几个关键词都能完成网络请求的发送：</p>\r\n<pre><code>@GET(&quot;query&quot;)\r\nObservable&lt;Article&gt; getArticle(...)\r\n</code></pre><p>其中Observable可以替换为Flowable,Single,Maybe，问题来了：</p>\r\n<ol>\r\n<li>这几个关键词有什么区别呢？分别在什么场景下比较适用？</li>\r\n<li>在网络请求和 retrofit 配合这块，哪个关键词更加合理呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16634,"link":"https://www.wanandroid.com/wenda/show/16634","niceDate":"2021-01-03 20:34","niceShareDate":"2020-12-27 22:37","origin":"","prefix":"","projectLink":"","publishTime":1609677292000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1609079863000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | RxJava中Observable、Flowable、Single、Maybe 有何区别?","type":0,"userId":2,"visible":1,"zan":5},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>我们在写代码的时候，有时候很容易使用一个高版本的 API，如果不注意，可能会导致在一些低版本的设备崩溃。</p>\r\n<p>因此，我们可以选择引入 lint 在编译时进行检查。</p>\r\n<p>今天的问题是？</p>\r\n<ol>\r\n<li>应用：如何在打包时，强制开启 New API检查？</li>\r\n<li>原理：lint 怎么能知道某个 方法是哪个版本加入的？是有一个汇总的地方维护着这样的方法列表吗？</li>\r\n<li>原理：即使有这样的一个列表，lint是怎么扫描每一个方法调用的？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15949,"link":"https://www.wanandroid.com/wenda/show/15949","niceDate":"2020-12-27 22:39","niceShareDate":"2020-11-02 00:14","origin":"","prefix":"","projectLink":"","publishTime":1609079946000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1604247264000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Call requires API level 23 (current min is 14) 扫描出来的原理是？","type":0,"userId":2,"visible":1,"zan":10},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>大家在日常开发过程中，应该对invalidate，requestLayout简易的区别都理解，更近准备针对这两个问题问几问。</p>\r\n<p>先来invalidate吧。</p>\r\n<ol>\r\n<li>invalidate 的执行流程是什么样子的？</li>\r\n<li>如果连续调用多次invalidate执行流程是？</li>\r\n<li>invalidate重绘的区域是如何确定的，仅是当前View还是整个View树，还是某种计算方式？</li>\r\n<li>View除了invalidate()外，还有个方法叫做postInvalidateOnAnimation()，这两个方法有何区别？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":16190,"link":"https://wanandroid.com/wenda/show/16190","niceDate":"2020-12-27 22:38","niceShareDate":"2020-11-24 13:32","origin":"","prefix":"","projectLink":"","publishTime":1609079936000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1606195930000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | View invalidate() 相关的一些细节探究~","type":0,"userId":2,"visible":1,"zan":13},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>先来看一段代码：</p>\r\n<pre><code>final class A {\r\n    String selfIntroduction() {\r\n        return &quot;I&#39;m A&quot;;\r\n    }\r\n}\r\n\r\nclass B {\r\n    String selfIntroduction() {\r\n        return &quot;I&#39;m B&quot;;\r\n    }\r\n}\r\n\r\nclass Test {\r\n    public final A a = new A();\r\n}\r\n</code></pre>\r\n<p><strong>问题来了：</strong><br><strong>1. Test.<code>a</code>能被替换吗？</strong></p>\r\n<p><strong>2. Test.<code>a</code>能被替换成B对象的实例吗？</strong></p>\r\n<p><strong>3. 如果问题2成立，在成功替换对象之后，调用Test.a.<code>selfIntroduction</code>方法，返回的是什么？ 为什么会这样？</strong></p>\r\n<p>把代码稍微改一下：</p>\r\n<pre><code>final class A {\r\n    String selfIntroduction = &quot;I&#39;m A&quot;;\r\n\r\n    String selfIntroduction() {\r\n        return selfIntroduction;\r\n    }\r\n}\r\n\r\nclass B {\r\n    String selfIntroduction = &quot;I&#39;m B&quot;;\r\n\r\n    String selfIntroduction() {\r\n        return selfIntroduction;\r\n    }\r\n}\r\n\r\nclass Test {\r\n    public final A a = new A();\r\n}\r\n</code></pre>\r\n<p><strong>4. 在成功替换对象之后，调用Test.a.<code>selfIntroduction</code>方法，返回的是什么？ 为什么？</strong></p>\r\n<p>再把代码改一下：</p>\r\n<pre><code>final class A {\r\n    String selfIntroduction = &quot;I&#39;m A&quot;;\r\n\r\n    String selfIntroduction() {\r\n        return selfIntroduction;\r\n    }\r\n}\r\n\r\nclass B {\r\n    String selfIntroduction = &quot;I&#39;m B&quot;;\r\n}\r\n\r\nclass Test {\r\n    public final A a = new A();\r\n}\r\n</code></pre>\r\n<p><strong>5. 在成功替换对象之后，调用Test.a.<code>selfIntroduction</code>方法，会报错吗？ 为什么？</strong></p>\r\n<p>继续改一下代码：</p>\r\n<pre><code>final class A {\r\n    String selfIntroduction = &quot;I&#39;m A&quot;;\r\n\r\n    String selfIntroduction() {\r\n        return selfIntroduction;\r\n    }\r\n}\r\n\r\nclass B {\r\n    String fakeSelfIntroduction = &quot;I&#39;m fake B&quot;;\r\n    String selfIntroduction = &quot;I&#39;m B&quot;;\r\n}\r\n\r\nclass Test {\r\n    public final A a = new A();\r\n}\r\n</code></pre>\r\n<p><strong>6. 在成功替换对象之后，调用Test.a.<code>selfIntroduction</code>方法，会报错吗？ 如果不会报错，返回值是什么？ 为什么会这样？</strong></p>\r\n<p>再改一次代码吧：</p>\r\n<pre><code>final class A {\r\n    String selfIntroduction = &quot;I&#39;m A&quot;;\r\n\r\n    String selfIntroduction() {\r\n        return selfIntroduction;\r\n    }\r\n}\r\n\r\nclass B {\r\n    int i = 1;\r\n    String fakeSelfIntroduction = &quot;I&#39;m Fake B&quot;;\r\n    String selfIntroduction = &quot;I&#39;m B&quot;;\r\n}\r\n\r\nclass Test {\r\n    public final A a = new A();\r\n}\r\n</code></pre>\r\n<p><strong>7. 在成功替换对象之后，调用Test.a.<code>selfIntroduction</code>方法，会报错吗？ 为什么？</strong></p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15797,"link":"https://www.wanandroid.com/wenda/show/15797","niceDate":"2020-11-02 00:16","niceShareDate":"2020-10-19 23:57","origin":"","prefix":"","projectLink":"","publishTime":1604247367000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1603123027000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 当Unsafe遇上final，超神奇的事情发生了？","type":0,"userId":2,"visible":1,"zan":8},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>很多时候我们讨论属性动画与之前的View Animation之间的区别，很多同学都会说：</p>\r\n<p>“属性动画在移动后，仍然可以响应用户的点击”</p>\r\n<p>原因可以看这篇：<a href=\"https://www.wanandroid.com/wenda/show/8644\">每日一问 | 为什么属性动画移动一个控件后，目标位置仍然能响应用户事件？</a></p>\r\n<p>了解的同学应该清楚，能响应只是在事件分发的时候，做了一下坐标映射。</p>\r\n<p>今天，我们讨论另一个区别，就是当属性动画与硬件加速配合时，会摩擦出什么火花？</p>\r\n<p>看一个示例：</p>\r\n<pre><code>MyTextView tv =view.findViewById( R.id.tv_name);\r\n        tv.setOnClickListener(new View.OnClickListener() {\r\n            @Override\r\n            public void onClick(View v) {\r\n                ValueAnimator valueAnimator = ValueAnimator.ofInt(0, 300).setDuration(2000);\r\n                valueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {\r\n                    @Override\r\n                    public void onAnimationUpdate(ValueAnimator animation) {\r\n                        v.setTranslationY((int) animation.getAnimatedValue());\r\n                    }\r\n                });\r\n                valueAnimator.start();\r\n            }\r\n        });\r\n</code></pre><p>很简答，我们自定义一个TextView，点击的时候，对它做一点往下的移动。</p>\r\n<p>布局文件：</p>\r\n<pre><code>&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;\r\n&lt;com.example.zhanghongyang.kotlinlearn.view.MyFrameLayout \r\n    xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;\r\n    android:layout_width=&quot;match_parent&quot;\r\n    android:layout_height=&quot;match_parent&quot;&gt;\r\n\r\n    &lt;com.example.zhanghongyang.kotlinlearn.view.MyTextView\r\n        android:id=&quot;@+id/tv_name&quot;\r\n        android:layout_width=&quot;wrap_content&quot;\r\n        android:layout_height=&quot;wrap_content&quot;\r\n        android:text=&quot;hello&quot; /&gt;\r\n\r\n&lt;/com.example.zhanghongyang.kotlinlearn.view.MyFrameLayout&gt;\r\n</code></pre><p>当<strong>硬件加速</strong>开启时（默认就是开启的）:</p>\r\n<ol>\r\n<li>动画执行过程中：MyTextView的draw方法会回调吗？</li>\r\n<li>动画执行过程中：MyFrameLayout的dispatchDraw方法会回调吗？</li>\r\n</ol>\r\n<p>当<strong>硬件加速</strong>关闭时:</p>\r\n<ol>\r\n<li>动画执行过程中：MyTextView的draw方法会回调吗？</li>\r\n<li>动画执行过程中：MyFrameLayout的dispatchDraw方法会回调吗？</li>\r\n</ol>\r\n<p>如果两者有差异：</p>\r\n<ol>\r\n<li><strong>v.setTranslationY</strong>在开启和不开启硬件加速过程中，执行的逻辑到底有什么变化？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15582,"link":"https://wanandroid.com/wenda/show/15582","niceDate":"2020-10-26 23:45","niceShareDate":"2020-10-05 11:21","origin":"","prefix":"","projectLink":"","publishTime":1603727114000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1601868088000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 属性动画与硬件加速的相遇，不是你想的那么简单？","type":0,"userId":2,"visible":1,"zan":16},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>每当大家有在编译期间有修改字节码的需求，第一反应应该就是使用 Transform 吧，我们知道每个 Transform 都有它的输入、输出，问几个问题：</p>\r\n<ol>\r\n<li>在编译过程中，有哪些“系统Transform”执行？</li>\r\n<li>自定义 Transform和其他系统Transform执行的顺序是怎么样的？</li>\r\n<li>Transform和 gradle task的关系是怎么样的？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15215,"link":"https://www.wanandroid.com/wenda/show/15215","niceDate":"2020-10-26 23:45","niceShareDate":"2020-09-12 18:32","origin":"","prefix":"","projectLink":"","publishTime":1603727102000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1599906744000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 玩转 Gradle，可不能不熟悉 Transform，那么，我要开始问了。","type":0,"userId":2,"visible":1,"zan":40},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>RecyclerView$Adapter 的：</p>\r\n<pre><code>setHasStableIds(boolean)\r\n</code></pre><ol>\r\n<li>在什么场景下我们会考虑设置为true?</li>\r\n<li>设置为true会带来什么好处？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15514,"link":"https://wanandroid.com/wenda/show/15514","niceDate":"2020-10-26 23:44","niceShareDate":"2020-10-03 11:43","origin":"","prefix":"","projectLink":"","publishTime":1603727094000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1601696580000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 关于 RecyclerView$Adapter setHasStableIds(boolean)的一切","type":0,"userId":2,"visible":1,"zan":18},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>更近实在是太忙了，抽空更新一问。</p>\r\n<p>想到一个非常有意思的问题：</p>\r\n<p>如果 app 启动了一个 Activity，那么在这个 Activity 展示的情况下，问题来了：</p>\r\n<p>1.上述场景背后至少有多少个线程？<br>2.每个线程具体的作用是什么？</p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":15188,"link":"https://www.wanandroid.com/wenda/show/15188","niceDate":"2020-10-12 00:47","niceShareDate":"2020-09-09 23:54","origin":"","prefix":"","projectLink":"","publishTime":1602434832000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1599666870000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 启动了Activity 的 app 至少有几个线程？","type":0,"userId":2,"visible":1,"zan":25},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>上次我们问了：</p>\r\n<p><a href=\"https://wanandroid.com/wenda/show/14941\">每日一问 | Java 泛型与接口碰撞出的火花！</a></p>\r\n<p>不少同学认识到了，<strong>「桥接方法」解决了实现类与接口参数类型不匹配的问题。</strong></p>\r\n<p>那么我们再来看一个例子：</p>\r\n<pre><code>interface TestInter&lt;T&gt; {\r\n\r\n    T getName(String name);\r\n\r\n}\r\n</code></pre><p>实现类：</p>\r\n<pre><code>class TestImpl implements TestInter&lt;String&gt; {\r\n    @Override\r\n    public String getName(String name) {\r\n        return null;\r\n    }\r\n}\r\n</code></pre><p>这次猜我的关注点在哪？</p>\r\n<p>我们反编译一下TestImpl：</p>\r\n<pre><code>public java.lang.String getName(java.lang.String);\r\n  descriptor: (Ljava/lang/String;)Ljava/lang/String;\r\n  flags: ACC_PUBLIC\r\n\r\n\r\npublic java.lang.Object getName(java.lang.String);\r\n  descriptor: (Ljava/lang/String;)Ljava/lang/Object;\r\n  flags: ACC_PUBLIC, ACC_BRIDGE, ACC_SYNTHETIC\r\n</code></pre><p>又看到了ACC_BRIDGE，ACC_SYNTHETIC，已知知识。</p>\r\n<p>可以看到生成的两个方法，我们转成Java的展现形式：</p>\r\n<ol>\r\n<li>String getName(String str)</li>\r\n<li>Object getName(String str);</li>\r\n</ol>\r\n<p>有没有觉得奇怪？</p>\r\n<p>我贴张图，你就能看明白了：</p>\r\n<p><img src=\"https://wanandroid.com/blogimgs/9d06cc96-4343-4e9c-83f0-a448a6e3bbc1.png\" alt></p>\r\n<p>这两个方法的方法名，参数均相同，只有返回值不同，在我们Java平时编写中是不允许的。</p>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>为何在这个场景下，允许「一个类中有方法名，参数均相同，只有返回值不同」两个方法？</li>\r\n<li>既然class文件有两个getName，那么我们调用getName时，是如何确定调用的哪个方法呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":14990,"link":"https://wanandroid.com/wenda/show/14990","niceDate":"2020-10-03 11:43","niceShareDate":"2020-08-26 21:08","origin":"","prefix":"","projectLink":"","publishTime":1601696612000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1598447321000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 |  当JVM遇到桥接方法，暴露出了什么？","type":0,"userId":2,"visible":1,"zan":8},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>之前我们问过：</p>\r\n<p><a href=\"https://wanandroid.com/wenda/show/14738\">每日一问 Java编译器背后干了多少活 之 「内部类构造」</a></p>\r\n<p>提到了isSynthetic，<strong>注意今天的问题也是个类似的问题。</strong></p>\r\n<p>首先我们编写个接口：</p>\r\n<pre><code>interface Animal&lt;T&gt;{\r\n    void test(T t);\r\n}\r\n</code></pre><p>这个接口有个实现类：</p>\r\n<pre><code>class Dog implements Animal&lt;String&gt;{\r\n\r\n    @override\r\n    public void test(String str){\r\n    }\r\n}\r\n</code></pre><p>符合我们平时的写法对吧。</p>\r\n<p>但是你仔细推敲一下：</p>\r\n<p>接口 Animal 类的泛型，在编译成 class 后，会经历泛型擦除，会变成这样：</p>\r\n<pre><code>interface Animal{\r\n    void test(Object obj);\r\n}\r\n</code></pre><p>而实现类Dog里面有个方法<code>test(String str)</code>，注意<strong>这个方法和接口类的方法参数并不一致</strong>。</p>\r\n<p>那么也就是说，<strong>并没有实现接口中的方法。</strong></p>\r\n<p>但是，接口的方法，实现类是必须实现的。</p>\r\n<p>问题来了：</p>\r\n<ul>\r\n<li>为何不报错呢？</li>\r\n<li>除了这个场景，编译期间还有哪里有类似的处理方式么？(可不回答)</li>\r\n</ul>","descMd":"","envelopePic":"","fresh":false,"host":"","id":14941,"link":"https://wanandroid.com/wenda/show/14941","niceDate":"2020-09-09 23:54","niceShareDate":"2020-08-23 23:53","origin":"","prefix":"","projectLink":"","publishTime":1599666893000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1598198007000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问  | Java 泛型与接口碰撞出的火花！","type":0,"userId":2,"visible":0,"zan":13},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>之前写代码，需要在一些特殊时机做一些事情，例如释放内存等，特殊时机包含：</p>\r\n<ol>\r\n<li>应用退出（用户back 退出，没有任何 Activity 了，但进程还存活的情况）</li>\r\n<li>应用 Home 按键置于后台</li>\r\n</ol>\r\n<p>问题来了，怎么方便的判断这两种时机呢？</p>\r\n<p><strong>注意：需要考虑屏幕旋转异常情况。</strong></p>","descMd":"","envelopePic":"","fresh":false,"host":"","id":14774,"link":"https://wanandroid.com/wenda/show/14774","niceDate":"2020-08-26 21:11","niceShareDate":"2020-08-16 19:55","origin":"","prefix":"","projectLink":"","publishTime":1598447504000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1597578943000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 如何判断应用退出，或者到后台了？","type":0,"userId":2,"visible":0,"zan":11},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>我们来看一坨代码：</p>\r\n<pre><code>public class A{\r\n\r\n    public static void main(String[] args){\r\n        B b = new A.B();\r\n    }\r\n\r\n\r\n    private static class B{\r\n\r\n    }\r\n\r\n}\r\n</code></pre><p>上述代码，如果我们执行<code>javac A.java</code>编译，会产生几个class文件？</p>\r\n<p>我们分析下：</p>\r\n<ol>\r\n<li>A.class 肯定有</li>\r\n<li>有个静态内部类B，还有个A$B.class</li>\r\n</ol>\r\n<p>两个。</p>\r\n<p>实际运行你会发现有三个：</p>\r\n<ol>\r\n<li>A.class</li>\r\n<li>A$B.class</li>\r\n<li>A$1.class</li>\r\n</ol>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>为什么会多了个A$1.class?</li>\r\n<li>Java里面<code>java.lang.reflect.Method</code>以及<code>java.lang.Class</code>都有一个<code>isSynthetic()</code>方法，是什么意思？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":14738,"link":"https://wanandroid.com/wenda/show/14738","niceDate":"2020-08-23 23:54","niceShareDate":"2020-08-12 10:20","origin":"","prefix":"","projectLink":"","publishTime":1598198050000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1597198816000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问  Java编译器背后干了多少活 之 「内部类构造」","type":0,"userId":2,"visible":0,"zan":18}]
/// offset : 0
/// over : false
/// pageCount : 6
/// size : 22
/// total : 131

class QuestionResult {
  int _curPage;
  List<QuestionItem> _datas;
  int _offset;
  bool _over;
  int _pageCount;
  int _size;
  int _total;

  int get curPage => _curPage;
  List<QuestionItem> get datas => _datas;
  int get offset => _offset;
  bool get over => _over;
  int get pageCount => _pageCount;
  int get size => _size;
  int get total => _total;

  QuestionResult({
      int curPage, 
      List<QuestionItem> datas,
      int offset, 
      bool over, 
      int pageCount, 
      int size, 
      int total}){
    _curPage = curPage;
    _datas = datas;
    _offset = offset;
    _over = over;
    _pageCount = pageCount;
    _size = size;
    _total = total;
}

  QuestionResult.fromJson(dynamic json) {
    _curPage = json["curPage"];
    if (json["datas"] != null) {
      _datas = [];
      json["datas"].forEach((v) {
        _datas.add(QuestionItem.fromJson(v));
      });
    }
    _offset = json["offset"];
    _over = json["over"];
    _pageCount = json["pageCount"];
    _size = json["size"];
    _total = json["total"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["curPage"] = _curPage;
    if (_datas != null) {
      map["datas"] = _datas.map((v) => v.toJson()).toList();
    }
    map["offset"] = _offset;
    map["over"] = _over;
    map["pageCount"] = _pageCount;
    map["size"] = _size;
    map["total"] = _total;
    return map;
  }

}

/// apkLink : ""
/// audit : 1
/// author : "xiaoyang"
/// canEdit : false
/// chapterId : 440
/// chapterName : "官方"
/// collect : false
/// courseId : 13
/// desc : "<p>记得mipmap刚出来的时候，出现过很多言论，XXX类型图片放mipmap更好。</p>\r\n<p>如今的观念基本停留在，仅将app icon放置到mipmap，其他的图片都放到drawable。</p>\r\n<p>那么我们想想：</p>\r\n<ol>\r\n<li>google 为啥要搞个mipmap，或者mipmap有什么特殊的能力？</li>\r\n<li>从源码上能做出相关分析吗？</li>\r\n</ol>"
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// host : ""
/// id : 17666
/// link : "https://wanandroid.com/wenda/show/17666"
/// niceDate : "2021-03-18 23:19"
/// niceShareDate : "2021-03-17 21:12"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1616080780000
/// realSuperChapterId : 439
/// selfVisible : 0
/// shareDate : 1615986729000
/// shareUser : ""
/// superChapterId : 440
/// superChapterName : "问答"
/// tags : [{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}]
/// title : "每日一问 | mipmap vs drawable，傻傻分不清楚？"
/// type : 1
/// userId : 2
/// visible : 1
/// zan : 2

class QuestionItem {
  String _apkLink;
  int _audit;
  String _author;
  bool _canEdit;
  int _chapterId;
  String _chapterName;
  bool _collect;
  int _courseId;
  String _desc;
  String _descMd;
  String _envelopePic;
  bool _fresh;
  String _host;
  int _id;
  String _link;
  String _niceDate;
  String _niceShareDate;
  String _origin;
  String _prefix;
  String _projectLink;
  int _publishTime;
  int _realSuperChapterId;
  int _selfVisible;
  int _shareDate;
  String _shareUser;
  int _superChapterId;
  String _superChapterName;
  List<Tags> _tags;
  String _title;
  int _type;
  int _userId;
  int _visible;
  int _zan;

  String get apkLink => _apkLink;
  int get audit => _audit;
  String get author => _author;
  bool get canEdit => _canEdit;
  int get chapterId => _chapterId;
  String get chapterName => _chapterName;
  bool get collect => _collect;
  int get courseId => _courseId;
  String get desc => _desc;
  String get descMd => _descMd;
  String get envelopePic => _envelopePic;
  bool get fresh => _fresh;
  String get host => _host;
  int get id => _id;
  String get link => _link;
  String get niceDate => _niceDate;
  String get niceShareDate => _niceShareDate;
  String get origin => _origin;
  String get prefix => _prefix;
  String get projectLink => _projectLink;
  int get publishTime => _publishTime;
  int get realSuperChapterId => _realSuperChapterId;
  int get selfVisible => _selfVisible;
  int get shareDate => _shareDate;
  String get shareUser => _shareUser;
  int get superChapterId => _superChapterId;
  String get superChapterName => _superChapterName;
  List<Tags> get tags => _tags;
  String get title => _title;
  int get type => _type;
  int get userId => _userId;
  int get visible => _visible;
  int get zan => _zan;

  Datas({
      String apkLink, 
      int audit, 
      String author, 
      bool canEdit, 
      int chapterId, 
      String chapterName, 
      bool collect, 
      int courseId, 
      String desc, 
      String descMd, 
      String envelopePic, 
      bool fresh, 
      String host, 
      int id, 
      String link, 
      String niceDate, 
      String niceShareDate, 
      String origin, 
      String prefix, 
      String projectLink, 
      int publishTime, 
      int realSuperChapterId, 
      int selfVisible, 
      int shareDate, 
      String shareUser, 
      int superChapterId, 
      String superChapterName, 
      List<Tags> tags, 
      String title, 
      int type, 
      int userId, 
      int visible, 
      int zan}){
    _apkLink = apkLink;
    _audit = audit;
    _author = author;
    _canEdit = canEdit;
    _chapterId = chapterId;
    _chapterName = chapterName;
    _collect = collect;
    _courseId = courseId;
    _desc = desc;
    _descMd = descMd;
    _envelopePic = envelopePic;
    _fresh = fresh;
    _host = host;
    _id = id;
    _link = link;
    _niceDate = niceDate;
    _niceShareDate = niceShareDate;
    _origin = origin;
    _prefix = prefix;
    _projectLink = projectLink;
    _publishTime = publishTime;
    _realSuperChapterId = realSuperChapterId;
    _selfVisible = selfVisible;
    _shareDate = shareDate;
    _shareUser = shareUser;
    _superChapterId = superChapterId;
    _superChapterName = superChapterName;
    _tags = tags;
    _title = title;
    _type = type;
    _userId = userId;
    _visible = visible;
    _zan = zan;
}

  QuestionItem.fromJson(dynamic json) {
    _apkLink = json["apkLink"];
    _audit = json["audit"];
    _author = json["author"];
    _canEdit = json["canEdit"];
    _chapterId = json["chapterId"];
    _chapterName = json["chapterName"];
    _collect = json["collect"];
    _courseId = json["courseId"];
    _desc = json["desc"];
    _descMd = json["descMd"];
    _envelopePic = json["envelopePic"];
    _fresh = json["fresh"];
    _host = json["host"];
    _id = json["id"];
    _link = json["link"];
    _niceDate = json["niceDate"];
    _niceShareDate = json["niceShareDate"];
    _origin = json["origin"];
    _prefix = json["prefix"];
    _projectLink = json["projectLink"];
    _publishTime = json["publishTime"];
    _realSuperChapterId = json["realSuperChapterId"];
    _selfVisible = json["selfVisible"];
    _shareDate = json["shareDate"];
    _shareUser = json["shareUser"];
    _superChapterId = json["superChapterId"];
    _superChapterName = json["superChapterName"];
    if (json["tags"] != null) {
      _tags = [];
      json["tags"].forEach((v) {
        _tags.add(Tags.fromJson(v));
      });
    }
    _title = json["title"];
    _type = json["type"];
    _userId = json["userId"];
    _visible = json["visible"];
    _zan = json["zan"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["apkLink"] = _apkLink;
    map["audit"] = _audit;
    map["author"] = _author;
    map["canEdit"] = _canEdit;
    map["chapterId"] = _chapterId;
    map["chapterName"] = _chapterName;
    map["collect"] = _collect;
    map["courseId"] = _courseId;
    map["desc"] = _desc;
    map["descMd"] = _descMd;
    map["envelopePic"] = _envelopePic;
    map["fresh"] = _fresh;
    map["host"] = _host;
    map["id"] = _id;
    map["link"] = _link;
    map["niceDate"] = _niceDate;
    map["niceShareDate"] = _niceShareDate;
    map["origin"] = _origin;
    map["prefix"] = _prefix;
    map["projectLink"] = _projectLink;
    map["publishTime"] = _publishTime;
    map["realSuperChapterId"] = _realSuperChapterId;
    map["selfVisible"] = _selfVisible;
    map["shareDate"] = _shareDate;
    map["shareUser"] = _shareUser;
    map["superChapterId"] = _superChapterId;
    map["superChapterName"] = _superChapterName;
    if (_tags != null) {
      map["tags"] = _tags.map((v) => v.toJson()).toList();
    }
    map["title"] = _title;
    map["type"] = _type;
    map["userId"] = _userId;
    map["visible"] = _visible;
    map["zan"] = _zan;
    return map;
  }

}

/// name : "本站发布"
/// url : "/article/list/0?cid=440"

class Tags {
  String _name;
  String _url;

  String get name => _name;
  String get url => _url;

  Tags({
      String name, 
      String url}){
    _name = name;
    _url = url;
}

  Tags.fromJson(dynamic json) {
    _name = json["name"];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["url"] = _url;
    return map;
  }

}