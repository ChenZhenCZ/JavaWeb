package com.ht.base;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import sun.audio.AudioData;
import sun.audio.AudioDataStream;
import sun.audio.AudioPlayer;

public class Sound {

	public Sound(int cmd) {
		try {
			String filename = "sound/Audio.wav";
			switch(cmd){
			case Cmd.CMD_ADDFRI:
				filename="sound/system.wav";
				break;
			}
			File file = new File(filename);
			InputStream is = new FileInputStream(file);
			int size = is.available();
			byte b[] = new byte[size];
			is.read(b, 0, size);
			AudioData ad = new AudioData(b);
			AudioDataStream ds = new AudioDataStream(ad);
			AudioPlayer.player.start(ds);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		new Sound(Cmd.CMD_ARGEE);
	}
}
