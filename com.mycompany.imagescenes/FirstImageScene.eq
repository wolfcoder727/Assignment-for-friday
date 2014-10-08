
/*
 * FirstImageScene
 * Created by Eqela Studio 2.0b7.4
 */

public class FirstImageScene : SEScene
{
	SESprite maintext;
	SESprite image1;
	SESprite image2text;
	SESprite image3text;
	SESprite image4text;
	SESprite text;
	
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		add_sprite_for_color(Color.instance("blue"), get_scene_width(), get_scene_height());		
		rsc.prepare_image("myrathalos","Rathalos", get_scene_width(),get_scene_height());
		image1 = add_sprite_for_image(SEImage.for_resource("myrathalos"));
		image1.move(0,0);	
	
		rsc.prepare_font("myfont","arial bold color=black",40);
		maintext = add_sprite_for_text(" ","myfont");
		image2text = add_sprite_for_text(" ", "myfont"); 
		image3text = add_sprite_for_text(" ", "myfont");
		image4text = add_sprite_for_text(" ", "myfont");

		maintext.set_text("Main Page");
		image2text.set_text("Lagiacrus");
		image3text.set_text("Tigrex");
		image4text.set_text("Nargacuga");

		image4text.move(get_scene_width()-image4text.get_width(),get_scene_height()-image4text.get_height());
		image3text.move(get_scene_width()-image3text.get_width(),get_scene_height()-image4text.get_height()-image3text.get_height());
		image2text.move(get_scene_width()-image2text.get_width(),get_scene_height()-image4text.get_height()-image3text.get_height()-image2text.get_height());
		maintext.move(get_scene_width()-maintext.get_width(),get_scene_height()-image4text.get_height()-image3text.get_height()-image2text.get_height()-maintext.get_height());
	}

	public void on_key_press(String name,String str) {
		base.on_key_press(name,str);	
		text.set_text("Click");
		text.move(0.25 * get_scene_width() - 0.5 * text.get_width() , 0.25*get_scene_height());	
	}

	public void on_pointer_press(SEPointerInfo pi) {
		//image4 (Nargacuga)
		if(pi.is_inside(get_scene_width()-image4text.get_width(),get_scene_height()-image4text.get_height(),image4text.get_width(),image4text.get_height())){	
			base.on_pointer_press(pi);	
			switch_scene(new FourthImageScene());	
		}
		//image3 (Tigrex)
		else if(pi.is_inside(get_scene_width()-image3text.get_width()-image4text.get_height(),get_scene_height()-image4text.get_height()-image3text.get_height(),get_scene_width()-image4text.get_height(),get_scene_height()-image4text.get_height())){	
			base.on_pointer_press(pi);	
			switch_scene(new ThirdImageScene());	
		}
		//image2 (Lagiacrus)
		else if(pi.is_inside(get_scene_width()-image2text.get_width()-image4text.get_height()-image3text.get_height(),get_scene_height()-image4text.get_height()-image3text.get_height()-image2text.get_height(),get_scene_width()-image4text.get_height()-image3text.get_height(),get_scene_height()-image4text.get_height()-image3text.get_height())){	
			base.on_pointer_press(pi);	
			switch_scene(new SecondImageScene());
	
		}
		//maintext
		else if(pi.is_inside(get_scene_width()-maintext.get_width()-image4text.get_height()-image3text.get_height()-image2text.get_height(),get_scene_height()-image4text.get_height()-image3text.get_height()-image2text.get_height()-maintext.get_height(),get_scene_width()-image4text.get_height()-image3text.get_height()-image2text.get_height(),get_scene_height()-image4text.get_height()-image3text.get_height()-image2text.get_height())){	
			base.on_pointer_press(pi);	
			switch_scene(new MainScene());
	
		}
		
	}

	public void cleanup() {
		base.cleanup();
	}
}
