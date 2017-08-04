/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2017-08-04 09:23:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `artic`
-- ----------------------------
DROP TABLE IF EXISTS `artic`;
CREATE TABLE `artic` (
  `id` int(11) NOT NULL auto_increment COMMENT '文章id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `category` int(255) default NULL COMMENT '分类',
  `tag` int(255) default NULL COMMENT '标签',
  `create_time` timestamp NULL default NULL on update CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL default NULL COMMENT '修改时间',
  `content` text COMMENT '内容',
  `readcount` int(11) default NULL,
  `create_year` varchar(255) default NULL,
  `create_month` varchar(255) default NULL,
  `img_path` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `tk1` (`category`),
  KEY `tk2` (`tag`),
  CONSTRAINT `tk1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`),
  CONSTRAINT `tk2` FOREIGN KEY (`tag`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of artic
-- ----------------------------
INSERT INTO `artic` VALUES ('1', '2017年JAVA常见的面试题汇总（一）', '1', '13', '2017-07-20 13:38:37', '2017-07-20 04:31:25', '<p>	</p><p>	</p><p>	</p><p>1.抽象：</p><p>抽象就是忽略一个主题中与当前目标无关的那些方面，以便更充分地注意与当前目标有关的方面。抽象并不打算了解全部</p><p>问题，而只是选择其中的一部分，暂时不用部分细节。抽象包括两个方面，一是过程抽象，二是数据抽象。</p><p><br/></p><p>2.继承：</p><p>继承是一种联结类的层次模型，并且允许和鼓励类的重用，它提供了一种明确表述共性的方法。对象的一个新类可以从现有的类中派生，这个过程称为类继承。新类继承了原始类的特性，新类称为原始类的派生类（子类），而原始类称为新类的基类（父类）。派生类可以从它的基类那里继承方法和实例变量，并且类可以修改或增加新的方法使之更适合特殊的需要。</p><p><br/></p><p>3.封装：</p><p>封装是把过程和数据包围起来，对数据的访问只能通过已定义的界面。面向对象计算始于这个基本概念，即现实世界可以被描绘成一系列完全自治、封装的对象，这些对象通过一个受保护的接口访问其他对象。</p><p><br/></p><p>4. 多态性：</p><p>多态性是指允许不同类的对象对同一消息作出响应。多态性包括参数化多态性和包含多态性。多态性语言具有灵活、抽象、行为共享、代码共享的优势，很好的解决了应用程序函数同名问题。</p><p><br/></p><p>5、String是最基本的数据类型吗?</p><p>基本数据类型包括byte、int、char、long、float、double、boolean和short。</p><p>java.lang.String类是final类型的，因此不可以继承这个类、不能修改这个类。为了提高效率节省空间，我们应该用StringBuffer类</p><p><br/></p><p>6、int 和 Integer 有什么区别</p><p>Java 提供两种不同的类型：引用类型和原始类型（或内置类型）。Int是java的原始数据类型，Integer是java为int提供的封装类。Java为每个原始类型提供了封装类。</p><p>原始类型 &nbsp; 封装类</p><p>boolean &nbsp;Boolean</p><p>char &nbsp;Character</p><p>byte &nbsp;Byte</p><p>short &nbsp;Short</p><p>int &nbsp;Integer</p><p>long &nbsp;Long</p><p>float &nbsp;Float</p><p>double &nbsp;Double</p><p>引用类型和原始类型的行为完全不同，并且它们具有不同的语义。引用类型和原始类型具有不同的特征和用法，它们包括：大小和速度问题，这种类型以哪种类型的数据结构存储，当引用类型和原始类型用作某个类的实例数据时所指定的缺省值。对象引用实例变量的缺省值为 null，而原始类型实例变量的缺省值与它们的类型有关。</p><p><br/></p><p>7、String 和StringBuffer的区别</p><p>JAVA平台提供了两个类：String和StringBuffer，它们可以储存和操作字符串，即包含多个字符的字符数据。这个String类提供了数值不可改变的字符串。而这个StringBuffer类提供的字符串进行修改。当你知道字符数据要改变的时候你就可以使用StringBuffer。典型地，你可以使用 StringBuffers来动态构造字符数据。</p><p><br/></p><p>8、运行时异常与一般异常有何异同？</p><p>异常表示程序运行过程中可能出现的非正常状态，运行时异常表示虚拟机的通常操作中可能遇到的异常，是一种常见运行错误。java编译器要求方法必须声明抛出可能发生的非运行时异常，但是并不要求必须声明抛出未被捕获的运行时异常。</p><p><br/></p><p>9、说出Servlet的生命周期，并说出Servlet和CGI的区别。</p><p>Servlet被服务器实例化后，容器运行其init方法，请求到达时运行其service方法，service方法自动派遣运行与请求对应的doXXX方法（doGet，doPost）等，当服务器决定将实例销毁的时候调用其destroy方法。</p><p>与cgi的区别在于servlet处于服务器进程中，它通过多线程方式运行其service方法，一个实例可以服务于多个请求，并且其实例一般不会销毁，而CGI对每个请求都产生新的进程，服务完成后就销毁，所以效率上低于servlet。</p><p><br/></p><p>10、说出ArrayList,Vector, LinkedList的存储性能和特性</p><p>ArrayList 和Vector都是使用数组方式存储数据，此数组元素数大于实际存储的数据以便增加和插入元素，它们都允许直接按序号索引元素，但是插入元素要涉及数组元素移动等内存操作，所以索引数据快而插入数据慢，Vector由于使用了synchronized方法（线程安全），通常性能上较ArrayList差，而LinkedList使用双向链表实现存储，按序号索引数据需要进行前向或后向遍历，但是插入数据时只需要记录本项的前后项即可，所以插入速度较快。</p><p><br/></p><p>11、EJB是基于哪些技术实现的？并说出SessionBean和EntityBean的区别，StatefulBean和StatelessBean的区别。</p><p>&nbsp;EJB包括Session Bean、Entity Bean、Message Driven Bean，基于JNDI、RMI、JAT等技术实现。</p><p>SessionBean在J2EE应用程序中被用来完成一些服务器端的业务操作，例如访问数据库、调用其他EJB组件。EntityBean被用来代表应用系统中用到的数据。</p><p>对于客户机，SessionBean是一种非持久性对象，它实现某些在服务器上运行的业务逻辑。</p><p>对于客户机，EntityBean是一种持久性对象，它代表一个存储在持久性存储器中的实体的对象视图，或是一个由现有企业应用程序实现的实体。</p><p>Session Bean 还可以再细分为 Stateful Session Bean 与 Stateless Session Bean ，这两种的 Session Bean都可以将系统逻辑放在 method之中执行，不同的是 Stateful Session Bean 可以记录呼叫者的状态，因此通常来说，一个使用者会有一个相对应的 Stateful Session Bean 的实体。Stateless Session Bean 虽然也是逻辑组件，但是他却不负责记录使用者状态，也就是说当使用者呼叫 Stateless Session Bean 的时候，EJB Container 并不会找寻特定的 Stateless Session Bean 的实体来执行这个 method。换言之，很可能数个使用者在执行某个 Stateless Session Bean 的 methods 时，会是同一个 Bean 的 Instance 在执行。从内存方面来看， Stateful Session Bean 与 Stateless Session Bean 比较， Stateful Session Bean 会消耗 J2EE Server 较多的内存，然而 Stateful Session Bean 的优势却在于他可以维持使用者的状态。</p><p><br/></p><p>12、Collection 和 Collections的区别。&nbsp;</p><p>Collection是集合类的上级接口，继承与他的接口主要有Set 和List.</p><p>Collections是针对集合类的一个帮助类，他提供一系列静态方法实现对各种集合的搜索、排序、线程安全化等操作。</p><p><br/></p><p>13、&amp;和&amp;&amp;的区别。&nbsp;</p><p>&amp;是位运算符，表示按位与运算，&amp;&amp;是逻辑运算符，表示逻辑与（and）。</p><p><br/></p><p>14、HashMap和Hashtable的区别。&nbsp;</p><p>&nbsp;HashMap是Hashtable的轻量级实现（非线程安全的实现），他们都完成了Map接口，主要区别在于HashMap允许空（null）键值（key）,由于非线程安全，效率上可能高于Hashtable。</p><p>HashMap允许将null作为一个entry的key或者value，而Hashtable不允许。</p><p>HashMap把Hashtable的contains方法去掉了，改成containsvalue和containsKey。因为contains方法容易让人引起误解。&nbsp;</p><p>Hashtable继承自Dictionary类，而HashMap是Java1.2引进的Map interface的一个实现。</p><p>最大的不同是，Hashtable的方法是Synchronize的，而HashMap不是，在多个线程访问Hashtable时，不需要自己为它的方法实现同步，而HashMap 就必须为之提供外同步。&nbsp;</p><p>Hashtable和HashMap采用的hash/rehash算法都大概一样，所以性能不会有很大的差异。</p><p><br/></p><p>15、final, finally, finalize的区别。&nbsp;</p><p>final 用于声明属性，方法和类，分别表示属性不可变，方法不可覆盖，类不可继承。</p><p>finally是异常处理语句结构的一部分，表示总是执行。</p><p>finalize是Object类的一个方法，在垃圾收集器执行的时候会调用被回收对象的此方法，可以覆盖此方法提供垃圾收集时的其他资源回收，例如关闭文件等。</p><p><br/></p><p>16、sleep() 和 wait() 有什么区别?&nbsp;</p><p>sleep是线程类（Thread）的方法，导致此线程暂停执行指定时间，给执行机会给其他线程，但是监控状态依然保持，到时后会自动恢复。调用sleep不会释放对象锁。</p><p>wait是Object类的方法，对此对象调用wait方法导致本线程放弃对象锁，进入等待此对象的等待锁定池，只有针对此对象发出notify方法（或notifyAll）后本线程才进入对象锁定池准备获得对象锁进入运行状态。</p><p><br/></p><p>17、Overload和Override的区别。Overloaded的方法是否可以改变返回值的类型?</p><p>方法的重写Overriding和重载Overloading是Java多态性的不同表现。重写Overriding是父类与子类之间多态性的一种表现，重载Overloading是一个类中多态性的一种表现。如果在子类中定义某方法与其父类有相同的名称和参数，我们说该方法被重写 (Overriding)。子类的对象使用这个方法时，将调用子类中的定义，对它而言，父类中的定义如同被&quot;屏蔽&quot;了。如果在一个类中定义了多个同名的方法，它们或有不同的参数个数或有不同的参数类型，则称为方法的重载(Overloading)。Overloaded的方法是可以改变返回值的类型。</p><p><br/></p><p>18、error和exception有什么区别?</p><p>error 表示恢复不是不可能但很困难的情况下的一种严重问题。比如说内存溢出。不可能指望程序能处理这样的情况。</p><p>exception 表示一种设计或实现问题。也就是说，它表示如果程序运行正常，从不会发生的情况。</p><p><br/></p><p>19、同步和异步有何异同，在什么情况下分别使用他们？举例说明。</p><p>如果数据将在线程间共享。例如正在写的数据以后可能被另一个线程读到，或者正在读的数据可能已经被另一个线程写过了，那么这些数据就是共享数据，必须进行同步存取。</p><p>当应用程序在对象上调用了一个需要花费很长时间来执行的方法，并且不希望让程序等待方法的返回时，就应该使用异步编程，在很多情况下采用异步途径往往更有效率。</p><p><br/></p><p>20、abstract class和interface有什么区别?</p><p>声明方法的存在而不去实现它的类被叫做抽象类（abstract class），它用于要创建一个体现某些基本行为的类，并为该类声明方法，但不能在该类中实现该类的情况。不能创建abstract 类的实例。然而可以创建一个变量，其类型是一个抽象类，并让它指向具体子类的一个实例。不能有抽象构造函数或抽象静态方法。Abstract 类的子类为它们父类中的所有抽象方法提供实现，否则它们也是抽象类为。取而代之，在子类中实现该方法。知道其行为的其它类可以在类中实现这些方法。</p><p>接口（interface）是抽象类的变体。在接口中，所有方法都是抽象的。多继承性可通过实现这样的接口而获得。接口中的所有方法都是抽象的，没有一个有程序体。接口只可以定义static final成员变量。接口的实现与子类相似，除了该实现类不能从接口定义中继承行为。当类实现特殊接口时，它定义（即将程序体给予）所有这种接口的方法。然后，它可以在实现了该接口的类的任何对象上调用接口的方法。由于有抽象类，它允许使用接口名作为引用变量的类型。通常的动态联编将生效。引用可以转换到接口类型或从接口类型转换，instanceof 运算符可以用来决定某对象的类是否实现了接口。</p><p><br/></p><p>21、heap和stack有什么区别。</p><p>栈是一种线形集合，其添加和删除元素的操作应在同一段完成。栈按照后进先出的方式进行处理。</p><p>堆是栈的一个组成元素</p><p><br/></p><p>22、forward 和redirect的区别</p><p>forward是服务器请求资源，服务器直接访问目标地址的URL，把那个URL的响应内容读取过来，然后把这些内容再发给浏览器，浏览器根本不知道服务器发送的内容是从哪儿来的，所以它的地址栏中还是原来的地址。</p><p>redirect就是服务端根据逻辑,发送一个状态码,告诉浏览器重新去请求那个地址，一般来说浏览器会用刚才请求的所有参数重新请求，所以session,request参数都可以获取。</p><p><br/></p><p>23、EJB与JAVA BEAN的区别？</p><p>Java Bean 是可复用的组件，对Java Bean并没有严格的规范，理论上讲，任何一个Java类都可以是一个Bean。但通常情况下，由于Java Bean是被容器所创建（如Tomcat）的，所以Java Bean应具有一个无参的构造器，另外，通常Java Bean还要实现Serializable接口用于实现Bean的持久性。Java Bean实际上相当于微软COM模型中的本地进程内COM组件，它是不能被跨进程访问的。Enterprise Java Bean 相当于DCOM，即分布式组件。它是基于Java的远程方法调用（RMI）技术的，所以EJB可以被远程访问（跨进程、跨计算机）。但EJB必须被布署在诸如Webspere、WebLogic这样的容器中，EJB客户从不直接访问真正的EJB组件，而是通过其容器访问。EJB容器是EJB组件的代理， EJB组件由容器所创建和管理。客户通过容器来访问真正的EJB组件。</p><p><br/></p><p>24、Static Nested Class 和 Inner Class的不同。&nbsp;</p><p>Static Nested Class是被声明为静态（static）的内部类，它可以不依赖于外部类实例被实例化。而通常的内部类需要在外部类实例化后才能实例化。</p><p><br/></p><p>25、JSP中动态INCLUDE与静态INCLUDE的区别？</p><p>动态INCLUDE用jsp:include动作实现 &lt;jsp:include page=&quot;included.jsp&quot; flush=&quot;true&quot; /&gt;它总是会检查所含文件中的变化，适合用于包含动态页面，并且可以带参数。</p><p>静态INCLUDE用include伪码实现,定不会检查所含文件的变化，适用于包含静态页面&lt;%@ include file=&quot;included.htm&quot; %&gt;</p><p><a href=\"javascritot:void(0)\" title=\"梁钟霖个人博客www.liangzl.com\" style=\"box-sizing: border-box; background-color: rgb(247, 246, 241); color: green; text-decoration-line: none; transition: all 0.1s; font-family: &quot;Lantinghei SC&quot;, &quot;Open Sans&quot;, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif; font-size: 12px; text-align: center; white-space: normal; font-weight: bold;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 转载至: 梁钟霖个人博客www.liangzl.com</a></p>', '702', '2017', '6', 'http://on5j96b7m.bkt.clouddn.com/pjyblog/20170720/133815649.jpg');
INSERT INTO `artic` VALUES ('8', '2017年125条常见的java面试笔试题汇总(二)', '1', '28', '2017-07-20 03:52:48', '2017-07-20 04:03:43', '<p>	</p><p>	</p><p>	</p><p>26、什么时候用assert。&nbsp;</p><p>assertion(断言)在软件开发中是一种常用的调试方式，很多开发语言中都支持这种机制。在实现中，assertion就是在程序中的一条语句，它对一个boolean表达式进行检查，一个正确程序必须保证这个boolean表达式的值为true；如果该值为false，说明程序已经处于不正确的状态下，系统将给出警告或退出。一般来说，assertion用于保证程序最基本、关键的正确性。assertion检查通常在开发和测试时开启。为了提高性能，在软件发布后，assertion检查通常是关闭的。</p><p><br/></p><p>27、GC是什么? 为什么要有GC?&nbsp;</p><p>GC是垃圾收集的意思（Gabage Collection）,内存处理是编程人员容易出现问题的地方，忘记或者错误的内存回收会导致程序或系统的不稳定甚至崩溃，Java提供的GC功能可以自动监测对象是否超过作用域从而达到自动回收内存的目的，Java语言没有提供释放已分配内存的显示操作方法。</p><p><br/></p><p>28、short s1 = 1; s1 = s1 + 1;有什么错? short s1 = 1; s1 += 1;有什么错?&nbsp;</p><p>short s1 = 1; s1 = s1 + 1; （s1+1运算结果是int型，需要强制转换类型）</p><p>short s1 = 1; s1 += 1;（可以正确编译）</p><p><br/></p><p>29、Math.round(11.5)等於多少? Math.round(-11.5)等於多少?&nbsp;</p><p>&nbsp;Math.round(11.5)==12</p><p>Math.round(-11.5)==-11</p><p>round方法返回与参数最接近的长整数，参数加1/2后求其floor.</p><p><br/></p><p>30、String s = new String(&quot;xyz&quot;);创建了几个String Object?&nbsp;</p><p>两个</p><p><br/></p><p>31、EJB包括（SessionBean,EntityBean）说出他们的生命周期，及如何管理事务的？</p><p>SessionBean： Stateless Session Bean 的生命周期是由容器决定的，当客户机发出请求要建立一个Bean的实例时，EJB容器不一定要创建一个新的Bean的实例供客户机调用，而是随便找一个现有的实例提供给客户机。当客户机第一次调用一个Stateful Session Bean 时，容器必须立即在服务器中创建一个新的Bean实例，并关联到客户机上，以后此客户机调用Stateful Session Bean 的方法时容器会把调用分派到与此客户机相关联的Bean实例。</p><p>EntityBean：Entity Beans能存活相对较长的时间，并且状态是持续的。只要数据库中的数据存在，Entity beans就一直存活。而不是按照应用程序或者服务进程来说的。即使EJB容器崩溃了，Entity beans也是存活的。Entity Beans生命周期能够被容器或者 Beans自己管理。</p><p>EJB通过以下技术管理实务：对象管理组织（OMG）的对象实务服务（OTS），Sun Microsystems的Transaction Service（JTS）、Java Transaction API（JTA），开发组（X/Open）的XA接口。</p><p><br/></p><p>32、应用服务器有那些？</p><p>BEA WebLogic Server，IBM WebSphere Application Server，Oracle9i Application Server，jBoss，Tomcat</p><p><br/></p><p>33、给我一个你最常见到的runtime exception。</p><p>ArithmeticException, ArrayStoreException, BufferOverflowException, BufferUnderflowException, CannotRedoException, CannotUndoException, ClassCastException, CMMException, ConcurrentModificationException, DOMException, EmptyStackException, IllegalArgumentException, IllegalMonitorStateException, IllegalPathStateException, IllegalStateException, ImagingOpException, IndexOutOfBoundsException, MissingResourceException, NegativeArraySizeException, NoSuchElementException, NullPointerException, ProfileDataException, ProviderException, RasterFormatException, SecurityException, SystemException, UndeclaredThrowableException, UnmodifiableSetException, UnsupportedOperationException</p><p><br/></p><p>34、接口是否可继承接口? 抽象类是否可实现(implements)接口? 抽象类是否可继承实体类(concrete class)?</p><p>接口可以继承接口。抽象类可以实现(implements)接口，抽象类是否可继承实体类，但前提是实体类必须有明确的构造函数。</p><p><br/></p><p>35、List, Set, Map是否继承自Collection接口?</p><p>List，Set是，Map不是</p><p><br/></p><p>36、说出数据连接池的工作机制是什么?</p><p>J2EE 服务器启动时会建立一定数量的池连接，并一直维持不少于此数目的池连接。客户端程序需要连接时，池驱动程序会返回一个未使用的池连接并将其表记为忙。如果当前没有空闲连接，池驱动程序就新建一定数量的连接，新建连接的数量有配置参数决定。当使用的池连接调用完成后，池驱动程序将此连接表记为空闲，其他调用就可以使用这个连接。</p><p><br/></p><p>37、abstract的method是否可同时是static,是否可同时是native，是否可同时是synchronized?</p><p>都不能</p><p><br/></p><p>38、数组有没有length()这个方法? String有没有length()这个方法？</p><p>数组没有length()这个方法，有length的属性。String有有length()这个方法。</p><p><br/></p><p>39、Set里的元素是不能重复的，那么用什么方法来区分重复与否呢? 是用==还是equals()? 它们有何区别?</p><p>Set里的元素是不能重复的，那么用iterator()方法来区分重复与否。equals()是判读两个Set是否相等。</p><p>equals()和==方法决定引用值是否指向同一对象equals()在类中被覆盖，为的是当两个分离的对象的内容和类型相配的话，返回真值。&nbsp;</p><p><br/></p><p>40、构造器Constructor是否可被override?</p><p>构造器Constructor不能被继承，因此不能重写Overriding，但可以被重载Overloading。</p><p><br/></p><p>41、是否可以继承String类?</p><p>String类是final类故不可以继承。</p><p><br/></p><p>42、swtich是否能作用在byte上，是否能作用在long上，是否能作用在String上?</p><p>switch（expr1）中，expr1是一个整数表达式。因此传递给 switch 和 case 语句的参数应该是 int、 short、 char 或者 byte。long,string 都不能作用于swtich。</p><p><br/></p><p>43、try {}里有一个return语句，那么紧跟在这个try后的finally {}里的code会不会被执行，什么时候被执行，在return前还是后?</p><p>会执行，在return前执行。</p><p><br/></p><p>44、编程题: 用最有效率的方法算出2乘以8等於几?&nbsp;</p><p>2 &lt;&lt; 3</p><p><br/></p><p>45、两个对象值相同(x.equals(y) == true)，但却可有不同的hash code，这句话对不对?</p><p>不对，有相同的hash code。</p><p><br/></p><p>46、当一个对象被当作参数传递到一个方法后，此方法可改变这个对象的属性，并可返回变化后的结果，那么这里到底是值传递还是引用传递?&nbsp;</p><p>是值传递。Java 编程语言只有值传递参数。当一个对象实例作为一个参数被传递到方法中时，参数的值就是对该对象的引用。对象的内容可以在被调用的方法中改变，但对象的引用是永远不会改变的。</p><p><br/></p><p>47、当一个线程进入一个对象的一个synchronized方法后，其它线程是否可进入此对象的其它方法?</p><p>不能，一个对象的一个synchronized方法只能由一个线程访问。</p><p><br/></p><p>48、编程题: 写一个Singleton出来。</p><p>Singleton模式主要作用是保证在Java应用程序中，一个类Class只有一个实例存在。</p><p>一般Singleton模式通常有几种种形式:</p><p>第一种形式: 定义一个类，它的构造函数为private的，它有一个static的private的该类变量，在类初始化时实例话，通过一个public的getInstance方法获取对它的引用,继而调用其中的方法。</p><p><br/></p><p>public class Singleton {</p><p>private Singleton(){}</p><p>&nbsp; &nbsp; //在自己内部定义自己一个实例，是不是很奇怪？</p><p>&nbsp; &nbsp; //注意这是private 只供内部调用</p><p>&nbsp; &nbsp; private static Singleton instance = new Singleton();</p><p>&nbsp; &nbsp; //这里提供了一个供外部访问本class的静态方法，可以直接访问&nbsp;</p><p>&nbsp; &nbsp; public static Singleton getInstance() {</p><p>&nbsp; &nbsp; return instance;&nbsp;</p><p>&nbsp; &nbsp; }&nbsp;</p><p>&nbsp; &nbsp; } &nbsp;</p><p>&nbsp; &nbsp; 第二种形式:</p><p><br/></p><p>public class Singleton {&nbsp;</p><p>private static Singleton instance = null;</p><p>public static synchronized Singleton getInstance() {</p><p>//这个方法比上面有所改进，不用每次都进行生成对象，只是第一次&nbsp;</p><p>//使用时生成实例，提高了效率！</p><p>if (instance==null)</p><p>instance＝new Singleton();</p><p>return instance; 　　}&nbsp;</p><p>}&nbsp;</p><p><br/></p><p>&nbsp;其他形式:</p><p>定义一个类，它的构造函数为private的，所有方法为static的。</p><p>一般认为第一种形式要更加安全些&nbsp;</p><p><br/></p><p>49、Java的接口和C++的虚类的相同和不同处。</p><p>由于Java不支持多继承，而有可能某个类或对象要使用分别在几个类或对象里面的方法或属性，现有的单继承机制就不能满足要求。与继承相比，接口有更高的灵活性，因为接口中没有任何实现代码。当一个类实现了接口以后，该类要实现接口里面所有的方法和属性，并且接口里面的属性在默认状态下面都是public static,所有方法默认情况下是public.一个类可以实现多个接口。</p><p><br/></p><p>50、Java中的异常处理机制的简单原理和应用。</p><p>当JAVA 程序违反了JAVA的语义规则时，JAVA虚拟机就会将发生的错误表示为一个异常。违反语义规则包括2种情况。一种是JAVA类库内置的语义检查。例如数组下标越界,会引发IndexOutOfBoundsException;访问null的对象时会引发NullPointerException。另一种情况就是JAVA允许程序员扩展这种语义检查，程序员可以创建自己的异常，并自由选择在何时用throw关键字引发异常。所有的异常都是 java.lang.Thowable的子类。</p><p><a href=\"javascritot:void(0)\" title=\"梁钟霖个人博客www.liangzl.com\" style=\"box-sizing: border-box; background-color: rgb(247, 246, 241); color: green; text-decoration-line: none; transition: all 0.1s; font-family: &quot;Lantinghei SC&quot;, &quot;Open Sans&quot;, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeiti, &quot;WenQuanYi Micro Hei&quot;, SimSun, sans-serif; font-size: 12px; text-align: center; white-space: normal; font-weight: bold;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;转载至: 梁钟霖个人博客www.liangzl.com</a></p>', '69', '2017', '6', 'http://on5j96b7m.bkt.clouddn.com/pjyblog/20170720/133815649.jpg');
INSERT INTO `artic` VALUES ('10', '解决web项目中中文乱码的问题', '1', '30', '2017-07-24 20:05:51', '2017-07-25 15:44:19', '<p>	</p><p>	</p><p>	</p><p>&nbsp;&nbsp;&nbsp;&nbsp;首先是彻底解决post中文乱码的问题<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;第一种办法在servelt中是采用过滤器的办法，可以起到有效的作用，但是必须要保证传过来的参数不能空，否则会产生异常，下面附上代码，定义一个中文过滤器</p><pre class=\"brush:java;toolbar:false\">package&nbsp;com.filter;\r\nimport&nbsp;java.io.IOException;\r\nimport&nbsp;javax.servlet.Filter;\r\nimport&nbsp;javax.servlet.FilterChain;\r\nimport&nbsp;javax.servlet.FilterConfig;\r\nimport&nbsp;javax.servlet.ServletException;\r\nimport&nbsp;javax.servlet.ServletRequest;\r\nimport&nbsp;javax.servlet.ServletResponse;\r\nimport&nbsp;javax.servlet.http.HttpServletRequest;\r\nimport&nbsp;javax.servlet.http.HttpServletResponse;\r\n\r\npublic&nbsp;class&nbsp;ChineseFilter&nbsp;implements&nbsp;Filter{\r\n	@Override\r\n	public&nbsp;void&nbsp;destroy()&nbsp;{\r\n		//&nbsp;TODO&nbsp;Auto-generated&nbsp;method&nbsp;stub\r\n		\r\n	}\r\n	@Override\r\n	public&nbsp;void&nbsp;doFilter(ServletRequest&nbsp;req,&nbsp;\r\n	ServletResponse&nbsp;resp,&nbsp;FilterChain&nbsp;chain)\r\n	&nbsp;throws&nbsp;IOException,&nbsp;ServletException&nbsp;{&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HttpServletRequest&nbsp;request&nbsp;=&nbsp;(HttpServletRequest)&nbsp;req;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HttpServletResponse&nbsp;response&nbsp;=&nbsp;(HttpServletResponse)&nbsp;resp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MyRequest&nbsp;myRrequest&nbsp;=&nbsp;new&nbsp;MyRequest(request);&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;chain.doFilter(myRrequest,&nbsp;response);&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;\r\n	@Override\r\n	public&nbsp;void&nbsp;init(FilterConfig&nbsp;filterConfig)&nbsp;\r\n	throws&nbsp;ServletException&nbsp;{\r\n		\r\n		\r\n	}\r\n\r\n}</pre><p>&nbsp;&nbsp;&nbsp;&nbsp;然后实现其中的MyRequest<br/></p><pre class=\"brush:java;toolbar:false\">package&nbsp;com.filter;\r\n\r\nimport&nbsp;javax.servlet.http.HttpServletRequest;\r\nimport&nbsp;javax.servlet.http.HttpServletRequestWrapper;\r\n\r\npublic&nbsp;class&nbsp;MyRequest&nbsp;extends&nbsp;HttpServletRequestWrapper{&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;HttpServletRequest&nbsp;request=null;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;MyRequest(HttpServletRequest&nbsp;request)&nbsp;{&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;super(request);&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.request&nbsp;=&nbsp;request;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;@Override&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;String&nbsp;getParameter(String&nbsp;name)&nbsp;{&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;method&nbsp;=&nbsp;request.getMethod();&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;value=null;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try&nbsp;{&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;request.setCharacterEncoding(&quot;utf-8&quot;);&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value&nbsp;=&nbsp;request.getParameter(name);&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(&quot;get&quot;.equalsIgnoreCase(method)){&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value&nbsp;=&nbsp;new&nbsp;String(value.getBytes(&quot;iso-8859-1&quot;),&quot;utf-8&quot;);&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;catch&nbsp;(Exception&nbsp;e)&nbsp;{&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(&quot;&quot;);&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;value;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;@Override&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;String[]&nbsp;getParameterValues(String&nbsp;name)&nbsp;{&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String&nbsp;method&nbsp;=&nbsp;request.getMethod();&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String[]&nbsp;values=null;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try&nbsp;{&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;request.setCharacterEncoding(&quot;utf-8&quot;);&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;values&nbsp;=&nbsp;request.getParameterValues(name);&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(&quot;get&quot;.equalsIgnoreCase(method)){&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;i=0;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(String&nbsp;str&nbsp;:&nbsp;values)&nbsp;{&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;values[i++]&nbsp;=&nbsp;new&nbsp;String(str.getBytes(&quot;iso-8859-1&quot;),&quot;utf-8&quot;);&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;catch&nbsp;(Exception&nbsp;e)&nbsp;{&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.printStackTrace();&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;values;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n}</pre><p>&nbsp;&nbsp;&nbsp;&nbsp;2，解决框架项目中的乱码问题，直接在web.xml中设置<br/></p><pre class=\"brush:java;toolbar:false\">&lt;filter&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;filter-name&gt;CharacterEncodingFilter&lt;/filter-name&gt;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;filter-class&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;org.springframework.web.filter.CharacterEncodingFilter\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/filter-class&gt;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;init-param&gt;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;param-name&gt;encoding&lt;/param-name&gt;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;param-value&gt;utf-8&lt;/param-value&gt;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/init-param&gt;&nbsp;&nbsp;\r\n&lt;/filter&gt;\r\n&lt;filter-mapping&gt;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;filter-name&gt;CharacterEncodingFilter&lt;/filter-name&gt;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;url-pattern&gt;/*&lt;/url-pattern&gt;&nbsp;&nbsp;\r\n&lt;/filter-mapping&gt;</pre><p>&nbsp;&nbsp;&nbsp;&nbsp;3，解决get请求，直接修改tomcat的配置文件server.xml<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;tomcat--&gt;conf--&gt;server.xml<br/></p><pre class=\"brush:java;toolbar:false\">&lt;Connector&nbsp;URIEncoding=&quot;UTF-8&quot;&nbsp;&nbsp;&nbsp;port=&quot;8080&quot;&nbsp;protocol=&quot;HTTP/1.1&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;connectionTimeout=&quot;20000&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;redirectPort=&quot;8443&quot;&nbsp;/&gt;</pre><p>&nbsp;&nbsp;&nbsp;&nbsp;加上前面的</p><pre class=\"brush:java;toolbar:false\">&nbsp;URIEncoding=&quot;UTF-8&quot;</pre><p>&nbsp;&nbsp;&nbsp;&nbsp;问题就解决了，如果还有问题，可以文章下面评论，或者留言私信我<br/></p>', '49', '2017', '6', 'http://on5j96b7m.bkt.clouddn.com/pjyblog/20170720/133815649.jpg');

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL COMMENT '文章类别',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'java');
INSERT INTO `categories` VALUES ('2', 'mysql');
INSERT INTO `categories` VALUES ('4', 'ssh');
INSERT INTO `categories` VALUES ('5', 'springMVC');
INSERT INTO `categories` VALUES ('6', 'css');
INSERT INTO `categories` VALUES ('7', 'hexo');

-- ----------------------------
-- Table structure for `remark`
-- ----------------------------
DROP TABLE IF EXISTS `remark`;
CREATE TABLE `remark` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `articid` int(11) NOT NULL,
  `text` varchar(255) default NULL,
  `time` timestamp NULL default NULL,
  `mail` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `tkkk` (`articid`),
  CONSTRAINT `tkkk` FOREIGN KEY (`articid`) REFERENCES `artic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of remark
-- ----------------------------

-- ----------------------------
-- Table structure for `replay`
-- ----------------------------
DROP TABLE IF EXISTS `replay`;
CREATE TABLE `replay` (
  `id` int(11) NOT NULL auto_increment,
  `username` int(11) NOT NULL,
  `text` varchar(255) default NULL,
  `time` timestamp NULL default NULL,
  `remarkid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `remark` (`remarkid`),
  CONSTRAINT `remark` FOREIGN KEY (`remarkid`) REFERENCES `remark` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replay
-- ----------------------------

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL COMMENT '标签',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('13', 'java,java基础');
INSERT INTO `tags` VALUES ('28', 'java,面试');
INSERT INTO `tags` VALUES ('30', '乱码');
INSERT INTO `tags` VALUES ('40', '121');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '741506070@qq.com', '123456');
INSERT INTO `user` VALUES ('2', '123', '123');

-- ----------------------------
-- Table structure for `words`
-- ----------------------------
DROP TABLE IF EXISTS `words`;
CREATE TABLE `words` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `text` text,
  `mail` varchar(255) default NULL,
  `time` timestamp NULL default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of words
-- ----------------------------
INSERT INTO `words` VALUES ('1', '213', '123123', '741506070@qq.com', '2017-07-23 20:29:14', '未回复');

-- ----------------------------
-- Table structure for `words_replay`
-- ----------------------------
DROP TABLE IF EXISTS `words_replay`;
CREATE TABLE `words_replay` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `text` varchar(255) default NULL,
  `time` timestamp NULL default NULL,
  `wordsid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `ttt` (`wordsid`),
  CONSTRAINT `ttt` FOREIGN KEY (`wordsid`) REFERENCES `words` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of words_replay
-- ----------------------------
