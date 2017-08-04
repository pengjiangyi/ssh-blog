<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>幸运数字与词条</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">

		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<link rel="stylesheet" type="text/css" href="css/style2.css" />
		<script>document.documentElement.className = 'js';</script>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js" ></script>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<!--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>-->
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<svg class="hidden">
			<defs>
				<symbol id="icon-arrow" viewBox="0 0 24 24">
					<title>arrow</title>
					<polygon points="6.3,12.8 20.9,12.8 20.9,11.2 6.3,11.2 10.2,7.2 9,6 3.1,12 9,18 10.2,16.8 "/>
				</symbol>
				<symbol id="icon-drop" viewBox="0 0 24 24">
					<title>drop</title>
					<path d="M12,21c-3.6,0-6.6-3-6.6-6.6C5.4,11,10.8,4,11.4,3.2C11.6,3.1,11.8,3,12,3s0.4,0.1,0.6,0.3c0.6,0.8,6.1,7.8,6.1,11.2C18.6,18.1,15.6,21,12,21zM12,4.8c-1.8,2.4-5.2,7.4-5.2,9.6c0,2.9,2.3,5.2,5.2,5.2s5.2-2.3,5.2-5.2C17.2,12.2,13.8,7.3,12,4.8z"/><path d="M12,18.2c-0.4,0-0.7-0.3-0.7-0.7s0.3-0.7,0.7-0.7c1.3,0,2.4-1.1,2.4-2.4c0-0.4,0.3-0.7,0.7-0.7c0.4,0,0.7,0.3,0.7,0.7C15.8,16.5,14.1,18.2,12,18.2z"/>
				</symbol>
				<symbol id="icon-github" viewBox="0 0 32.58 31.77">
					<title>github</title>
					<path d="M16.29,0a16.29,16.29,0,0,0-5.15,31.75c.81.15,1.11-.35,1.11-.79s0-1.41,0-2.77C7.7,29.18,6.74,26,6.74,26a4.31,4.31,0,0,0-1.81-2.38c-1.48-1,.11-1,.11-1a3.42,3.42,0,0,1,2.5,1.68,3.47,3.47,0,0,0,4.74,1.35,3.48,3.48,0,0,1,1-2.18C9.7,23.08,5.9,21.68,5.9,15.44a6.3,6.3,0,0,1,1.68-4.37,5.86,5.86,0,0,1,.16-4.31s1.37-.44,4.48,1.67a15.44,15.44,0,0,1,8.16,0c3.11-2.11,4.48-1.67,4.48-1.67A5.85,5.85,0,0,1,25,11.07a6.29,6.29,0,0,1,1.67,4.37c0,6.26-3.81,7.63-7.44,8a3.89,3.89,0,0,1,1.11,3c0,2.18,0,3.93,0,4.47s.29.94,1.12.78A16.29,16.29,0,0,0,16.29,0Z"/>
				</symbol>
			</defs>
		</svg>
		<main>
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
					<a class="navbar-brand" href="#" style="margin-left:150px ;">pjyblog</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							<a href="index.html">主页 <span class="sr-only">(current)</span></a>
						</li>
						<li class="head-li" id="guidang">
							<a href="guidang.html">归档</a>
						</li>
						<li class="head-li" id="liuyan">
							<a href="#">留言</a>
						</li>
						<li class="head-li" id="guanyu">
							<a href="about.html">关于</a>
						</li>
						<li class="head-li" id="ht5">
							<a href="h5.html">随机词条</a>
						</li>
					</ul>

				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->

		</nav>
		
		
		
			<div class="calendar-wrap" style="margin-top: 50px;">
				<div class="calendar">
					<div class="cube" data-bg-color="#F7E8ED" data-title="Peaceful World"></div>
					<div class="cube" data-bg-color="#F2D9E6" data-title="Impossible"></div>
					<div class="cube" data-bg-color="#ECC6DE" data-title="Everything"></div>
					<div class="cube" data-bg-color="#E0ECF5" data-title="Hung Up"></div>
					<div class="cube" data-bg-color="#DDF4DE" data-title="Live Freely"></div>
					<div class="cube" data-bg-color="#F0F1D5" data-title="Tolerable Planet"></div>
					<div class="cube" data-bg-color="#EEDECD" data-title="Normal"></div>
					<div class="cube" data-bg-color="#B8E6B3" data-title="Superhero"></div>
					<div class="cube" data-bg-color="#ABE3D8" data-title="New Weariness"></div>
					<div class="cube" data-bg-color="#E0E1F5" data-title="The Sinner"></div>
					<div class="cube" data-bg-color="#F7E8ED" data-title="Intellectual Wealth"></div>
					<div class="cube" data-bg-color="#F2D9E6" data-title="Limiting Principle"></div>
					<div class="cube" data-bg-color="#DFD1F0" data-title="Quaintly Free"></div>
					<div class="cube" data-bg-color="#E0ECF5" data-title="On A Level"></div>
					<div class="cube" data-bg-color="#DDF4DE" data-title="Experiences"></div>
					<div class="cube" data-bg-color="#F0F1D5" data-title="Entrenched"></div>
					<div class="cube" data-bg-color="#EEDECD" data-title="Happiness"></div>
					<div class="cube" data-bg-color="#B8E6B3" data-title="Working Jobs"></div>
					<div class="cube" data-bg-color="#ABE3D8" data-title="Spending Billions"></div>
					<div class="cube" data-bg-color="#E0E1F5" data-title="Principle Of Having"></div>
					<div class="cube" data-bg-color="#DFD1F0" data-title="Enemies"></div>
					<div class="cube" data-bg-color="#DFD1F0" data-title="Better World"></div>
					<div class="cube" data-inactive data-bg-color="#6161616" data-title="Coming soon"></div>
					<div class="cube" data-inactive data-bg-color="#6161616" data-title="Coming soon"></div>
					<div class="cube" data-inactive data-bg-color="#6161616" data-title="Coming soon"></div>
				</div>
				<div class="content">
					<div class="content__block">
						<h3 class="content__title">Peaceful World</h3>
						<p class="content__description">If everyone demanded peace instead of another television set, then there'd be peace.</p>
						<p class="content__meta">John Lennon</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Impossible</h3>
						<p class="content__description">To be content with little is difficult; to be content with much, impossible.</p>
						<p class="content__meta">Marie von Ebner-Eschenbach</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Everything</h3>
						<p class="content__description">The things you own end up owning you. It's only after you lose everything that you're free to do anything.</p>
						<p class="content__meta">Chuck Palahniuk</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Hung Up</h3>
						<p class="content__description">A lot of people get so hung up on what they can't have that they don't think for a second about whether they really want it.</p>
						<p class="content__meta">Lionel Shriver</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Live Freely</h3>
						<p class="content__description">It is the preoccupation with possessions, more than anything else that prevents us from living freely and nobly.</p>
						<p class="content__meta">Bertrand Russell</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Tolerable Planet</h3>
						<p class="content__description">What is the use of a house if you haven't got a tolerable planet to put it on?</p>
						<p class="content__meta">Henry David Thoreau</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Normal</h3>
						<p class="content__description">Normal is getting dressed in clothes that you buy for work and driving through traffic in a car that you are still paying for - in order to get to the job you need to pay for the clothes and the car, and the house you leave vacant all day so you can afford to live in it.</p>
						<p class="content__meta">Ellen Goodman</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Superhero</h3>
						<p class="content__description">The reality of loving God is loving him like he's a Superhero who actually saved you from stuff rather than a Santa Claus who merely gave you some stuff.</p>
						<p class="content__meta">Criss Jami</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">New Weariness</h3>
						<p class="content__description">Every increased possession loads us with new weariness.</p>
						<p class="content__meta">John Ruskin</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">The Sinner</h3>
						<p class="content__description">The Christmas tree, twinkling with lights, had a mountain of gifts piled up beneath it, like offerings to the great god of excess.</p>
						<p class="content__meta">Tess Gerritsen</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Intellectual Wealth</h3>
						<p class="content__description">Whoever prefers the material comforts of life over intellectual wealth is like the owner of a palace who moves into the servants' quarters and leaves the sumptuous rooms empty.</p>
						<p class="content__meta">Marie von Ebner-Eschenbach</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Limiting Principle</h3>
						<p class="content__description">An attitude to life which seeks fulfilment in the single-minded pursuit of wealth - in short, materialism - does not fit into this world, because it contains within itself no limiting principle, while the environment in which it is placed is strictly limited.</p>
						<p class="content__meta">Ernst F. Schumacher</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Quaintly Free</h3>
						<p class="content__description">To have so little, and it of so little value, was to be quaintly free.</p>
						<p class="content__meta">Wallace Stegner</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">On A Level</h3>
						<p class="content__description">I've always felt that your belongings have never been on a level with you.</p>
						<p class="content__meta">George Eliot</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Experiences</h3>
						<p class="content__description">We all need new ideas, images, and experiences far more than we need new stoves or cars or computers.</p>
						<p class="content__meta">Bill Holm</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Entrenched</h3>
						<p class="content__description">We are being called upon to act against a prevailing culture, to undermine our own entrenched tendency to accumulate and to consume, and to refuse to define our individuality by our presumed ability to do whatever we want.</p>
						<p class="content__meta">Lyanda Lynn Haupt</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Happiness</h3>
						<p class="content__description">The way of the consumerist culture is to spend so much energy chasing happiness that it has none left to be happy.</p>
						<p class="content__meta">Criss Jami</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Working Jobs</h3>
						<p class="content__description">Advertising has us chasing cars and clothes, working jobs we hate so we can buy shit we don't need.</p>
						<p class="content__meta">Chuck Palahniuk</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Spending Billions</h3>
						<p class="content__description">Our economy is based on spending billions to persuade people that happiness is buying things, and then insisting that the only way to have a viable economy is to make things for people to buy so they’ll have jobs and get enough money to buy things.</p>
						<p class="content__meta">Philip Slater</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Principle Of Having</h3>
						<p class="content__description">The real opposition is that between the ego-bound man, whose existence is structured by the principle of having, and the free man, who has overcome his egocentricity.</p>
						<p class="content__meta">Erich Fromm</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Enemies</h3>
						<p class="content__description">Happy slaves are the bitterest enemies of freedom.</p>
						<p class="content__meta">Marie von Ebner-Eschenbach</p>
					</div>
					<div class="content__block">
						<h3 class="content__title">Better World</h3>
						<p class="content__description">If you assume that there is no hope, you guarantee that there will be no hope. If you assume that there is an instinct for freedom, that there are opportunities to change things, then there is a possibility that you can contribute to making a better world.</p>
						<p class="content__meta">Noam Chomsky</p>
					</div>
					<div class="content__number">0</div>
					<button class="btn-back" aria-label="Back to the grid view">&crarr;</button>
				</div><!-- /content -->
			</div>
		</main>
		<script src="js/charming.min.js"></script>
		<script src="js/anime.min.js"></script>
		<script src="js/textfx.js"></script>
		<script src="js/main2.js"></script>
	</body>
</html>
