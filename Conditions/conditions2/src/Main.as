package 
{
	import delay.DelayTimer;
	import events.ProgramEvent;
	import evolution.Condition;
	import evolution.GenerationGenerator;
	import evolution.IOrganizm;
	import evolution.SeriesAdapter;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import operands.OperandGenerator;
	import operations.OperationGenerator;
	import operations.OperationPriority;
	import series.Series;
	import series.SeriesElement;
	import series.SeriesElementGenerator;
	import series.SeriesGenerator;
	import series.SeriesReader;
	
	/**
	 * ...
	 * @author Dima Petrichenko
	 */
	public class Main extends Sprite 
	{
		private var _timer:Timer;
		
		private var seriesList:Vector.<Series> = new Vector.<Series>();
		private var seriesList2:Vector.<Series> = new Vector.<Series>();
		private var generationGenerator:GenerationGenerator = new GenerationGenerator();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			IdealNumber.number = 8021;
			
			OperandGenerator.initialize();
			OperationGenerator.initialize();
			DelayTimer.initialize();
			
			Stream.addEventListener(ProgramEvent.START_ITERATION, onStartIteration);
			//_timer = new Timer(1000);
			//_timer.addEventListener(TimerEvent.TIMER, onTimer);
			//_timer.start();
			/*
			var series:Series = new Series();
			
			var seriesList:Vector.<Series> = new Vector.<Series>();
			seriesList.push(SeriesGenerator.generate(10));
			
			var seriesList2:Vector.<Series> = new Vector.<Series>();
			
			for (var i:int = 0; i < seriesList.length; i++) 
			{
				trace(seriesList[i].traceValue());
				trace(SeriesReader.readseries(seriesList[i]));
			}
			
			trace("---------------");
			
			for (i = 0; i < seriesList2.length; i++) 
			{
				trace(seriesList2[i].traceValue());
				trace(SeriesReader.readseries(seriesList2[i]));
			}
			*/
			
			//-----------------------------------------------------------------
			execute();

		}
		
		private function onStartIteration(event:Event):void 
		{
			execute();
		}
		
		private function execute():void 
		{
			for (var k:int = 0; k < 5; k++) 
			{
				seriesList.push(SeriesGenerator.generate(10));
			}
			
			for (var j:int = 0; j < 100; j++) 
			{
				seriesList2 = new Vector.<Series>();
				seriesList2 = generationGenerator.generate(seriesList);
					
				var v:Vector.<IOrganizm> = SeriesAdapter.adaptSeries(seriesList2);

					
				var ar:Array = [];
				for (var l:int = 0; l < v.length; l++) 
				{
					ar.push(v[l]);
				}
					
					
				var av:Vector.<IOrganizm> = Condition.sortOut(v, ar);
				
				seriesList = SeriesAdapter.returnSeries(av);
			}
			
			Stream.dispatchEvent(new Event(ProgramEvent.COMPLETE_ITERATION));
			
			trace(seriesList[0].traceValue(), SeriesReader.readseries(seriesList[0]));
			trace("--");

		}
		
	}
	
}