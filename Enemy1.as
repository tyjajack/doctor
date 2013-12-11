package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Enemy1 extends MovieClip
	{

		public function Enemy1(X:Number, Y:Number, lineDefine:Number, lineDistance:Number):void
		{
			//here x and y location of spawn point
			x = X;
			y = Y;

			dy = Math.random() * 10 + 1;


			//this is the x position the enemy will oscillate around
			xline = X;
			yline = Y;

			//t is a number that will control out point in the oscilation function
			t = lineDefine;

			//add it visually
			enemyLayer.addChild(Enemy1);
			//give the enemysomeAI;
			addEventListener(Event.ENTER_FRAME, enemyAI);
		}

		private function enemyAI(e:Event):void
		{
			var currentEnemy:MovieClip = MovieClip(e.currentTarget);

			if (gui.time_txt.text < 45 && gui.time_txt.text > 25)
			{
				currentEnemy.x = currentEnemy.xline + Math.sin(currentEnemy.t) * 20;//move the enemy down by its velocity
				currentEnemy.y +=  currentEnemy.dy;
				//increment out spot in in sine curve
				currentEnemy.t +=  0.1;
				fireRate = 6;
				spawnRate = 30;
			}
			else if (gui.time_txt.text < 25 && gui.time_txt.text > 15)
			{
				currentEnemy.x = currentEnemy.xline + Math.sin(currentEnemy.t) * 20;//move the enemy down by its velocity
				currentEnemy.y +=  currentEnemy.dy;
				//increment out spot in in sine curve
				currentEnemy.t +=  0.1;
				fireRate = 4;
				spawnRate = 20;

			}
			else if (gui.time_txt.text < 15)
			{
				currentEnemy.x = currentEnemy.xline + Math.sin(currentEnemy.t) * 20;//move the enemy down by its velocity
				currentEnemy.y +=  currentEnemy.dy;
				//increment out spot in in sine curve
				currentEnemy.t +=  0.1;
				fireRate = 1;
				spawnRate = 4;
			}
			else
			{
				currentEnemy.y +=  currentEnemy.dy;
			}
			

			if (currentEnemy.hitTestObject(player))
			{
				gameOver();
			}
			//remove off of screen after the death animation
			if (currentEnemy.y >= 550)
			{
				gameOver();
			}

			//remove off of screen after the death animation
			if (currentEnemy.currentFrame == currentEnemy.totalFrames)
			{
				//destory your AI
				currentEnemy.removeEventListener(Event.ENTER_FRAME, enemyAI);
				//removes it Visually;
				enemyLayer.removeChild(currentEnemy);

			}
		}
	}

}