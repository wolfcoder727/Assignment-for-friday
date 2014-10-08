/*
 * SecondImageScene
 * Created by Eqela Studio 2.0b7.4
 */

public class SecondImageScene : SEScene {
	SESprite maintext;
	SESprite image1text;
	SESprite image2;
	SESprite image3text;
	SESprite image4text;
	SESprite text;
	
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		add_sprite_for_color(Color.instance("blue"), get_scene_width(), get_scene_height());		
		rsc.prepare_image("mylagiacrus","Lagiacrus", get_scene_width(),get_scene_height());
		image2 = add_sprite_for_image(SEImage.for_resource("mylagiacrus"));
		image2.move(0,0);	
	
		rsc.prepare_font("myfont","arial bold color=black",40);
		maintext = add_sprite_for_text(" ","myfont");
		image1text = add_sprite_for_text(" ", "myfont"); 
		image3text = add_sprite_for_text(" ", "myfont");
		image4text = add_sprite_for_text(" ", "myfont");

		maintext.set_text("Main Page");
		image1text.set_text("Rathalos");
		image3text.set_text("Tigrex");
		image4text.set_text("Nargacuga");

		image4text.move(get_scene_width()-image4text.get_width(),get_scene_height()-image4text.get_height());
		image3text.move(get_scene_width()-image3text.get_width(),get_scene_height()-image4text.get_height()-image3text.get_height());
		image1text.move(get_scene_width()-image1text.get_width(),get_scene_height()-image4text.get_height()-image3text.get_height()-image1text.get_height());
		maintext.move(get_scene_width()-maintext.get_width(),get_scene_height()-image4text.get_height()-image3text.get_height()-image1text.get_height()-maintext.get_height());
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
		//image1 (Rathalos))
		else if(pi.is_inside(get_scene_width()-image1text.get_width()-image4text.get_height()-image3text.get_height(),get_scene_height()-image4text.get_height()-image3text.get_height()-image1text.get_height(),get_scene_width()-image4text.get_height()-image3text.get_height(),get_scene_height()-image4text.get_height()-image3text.get_height())){	
			base.on_pointer_press(pi);	
			switch_scene(new FirstImageScene());
	
		}
		//maintext
		else if(pi.is_inside(get_scene_width()-maintext.get_width()-image4text.get_height()-image3text.get_height()-image1text.get_height(),get_scene_height()-image4text.get_height()-image3text.get_height()-image1text.get_height()-maintext.get_height(),get_scene_width()-image4text.get_height()-image3text.get_height()-image1text.get_height(),get_scene_height()-image4text.get_height()-image3text.get_height()-image1text.get_height())){	
			base.on_pointer_press(pi);	
			switch_scene(new MainScene());
	
		}
		
		
	}

	public void cleanup() {
		base.cleanup();
	}

}
