package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_2 extends SceneScript
{
	public var _slide:Bool;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("slide", "_slide");
		_slide = false;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		loopSound(getSound(39));
		getActor(1).moveTo(160, 96, 2.25, Easing.backOut);
		getActor(2).moveTo(192, 256, 2.25, Easing.backOut);
		getActor(3).moveTo(192, 352, 2.25, Easing.backOut);
		_slide = true;
		
		/* ======================= Every N seconds ======================== */
		runPeriodically(1000 * 10, function(timeTask:TimedTask):Void
		{
			if(wrapper.enabled)
			{
				if((_slide == true))
				{
					getActor(4).moveTo(-64, 0, 7, Easing.quadIn);
					playSound(getSound(40));
					_slide = false;
				}
				else
				{
					getActor(4).moveTo(640, 0, 7, Easing.quadIn);
					playSound(getSound(40));
					_slide = true;
				}
			}
		}, null);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}