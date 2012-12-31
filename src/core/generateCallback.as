package core
{
	/**
	 * @author Andreas Renberg (IQAndreas)
	 *	I HATE, I HATE, I HATE Peter Pan!
	 *	... I mean, I HATE writing these types of functions, it's so dirty!
	 */
	public function generateCallback(targetFunction:Function, ... parameters):Function 
	{
		function callback():void
		{
			targetFunction.apply(null, parameters);	
		}
			
		return callback;
	}
}
