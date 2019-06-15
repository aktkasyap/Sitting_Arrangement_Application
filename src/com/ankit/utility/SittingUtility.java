package com.ankit.utility;

import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SittingUtility {

	private static String host = "localhost";
	private static final String MAIL_SERVER = "smtp.gmail.com";
	private static String uname = "aktkasyap@gmail.com";
	private static String pwd = "Hacker01";

	public static ArrayList<String> getAllFloors() {
		ArrayList<String> list = new ArrayList<String>();
		list.add("Ground Floor");
		list.add("First Floor");
		list.add("Second Floor");
		list.add("Third Floor");
		return list;
	}

	public static ArrayList<String> getAllCollege() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("LNCT");
		al.add("LNCT&S (old block)");
		al.add("LNCT&S (new block)");
		al.add("LNCTE");
		al.add("LNCT IT");
		al.add("LNCT PHARMACY");
		al.add("LNCT MCA");
		al.add("LNCT MBA");
		al.add("LNCT CME");
		return al;
	}

	public static ArrayList<String> getAllBranch() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("CSE");
		al.add("ME");
		return al;
	}

	public static ArrayList<String> getAllBranch_A() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("CSE");
		al.add("IT");
		return al;
	}

	public static ArrayList<String> getAllBranch_B() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("ME");
		al.add("CE");
		return al;
	}

	public static ArrayList<String> getAllCourse() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("BE");
		return al;
	}

	public static ArrayList<String> getAllYear() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("FIRST");
		al.add("SECOND");
		al.add("THIRD");
		al.add("FOURTH");
		return al;
	}

	public static int getRandom() {
		return new Random().nextInt(99999);
	}

	public static boolean sendMail(String otp, String toEmail) {
		boolean flag = false;
		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtps.host", MAIL_SERVER);
			properties.put("mail.smtps.auth", "true");
			Session session = Session.getInstance(properties);
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(host));
			// msg.addRecipients(Message.RecipientType.TO, new InternetAddress(toSend));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			msg.setSubject("your OTP");
			msg.setText(otp);
			Transport tr = session.getTransport("smtps");
			tr.connect(MAIL_SERVER, uname, pwd);
			tr.sendMessage(msg, msg.getAllRecipients());
			tr.close();
			flag = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return flag;
	}

	public static ArrayList<String> getGroundRooms1() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("G-01");
		al.add("G-02");
		al.add("G-03");
		al.add("G-04");
		al.add("G-05");
		al.add("G-06");
		return al;
	}

	public static ArrayList<String> getGroundRooms2() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("G-07");
		al.add("G-08");
		al.add("G-09");
		al.add("G-10");
		al.add("G-11");
		al.add("G-12");
		return al;
	}

	public static ArrayList<String> getGroundRooms3() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("G-13");
		al.add("G-14");
		al.add("G-15");
		al.add("G-16");
		al.add("G-17");
		al.add("G-18");
		return al;
	}

	public static ArrayList<String> getFirstRooms1() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("F-01");
		al.add("F-02");
		al.add("F-03");
		al.add("F-04");
		al.add("F-05");
		al.add("F-06");
		return al;
	}

	public static ArrayList<String> getFirstRooms2() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("F-07");
		al.add("F-08");
		al.add("F-09");
		al.add("F-10");
		al.add("F-11");
		al.add("F-12");
		return al;
	}

	public static ArrayList<String> getFirstRooms3() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("F-13");
		al.add("F-14");
		al.add("F-15");
		al.add("F-16");
		al.add("F-17");
		al.add("F-18");
		return al;
	}

	public static ArrayList<String> getSecondRooms1() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("S-01");
		al.add("S-02");
		al.add("S-03");
		al.add("S-04");
		al.add("S-05");
		al.add("S-06");
		return al;
	}

	public static ArrayList<String> getSecondRooms2() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("S-07");
		al.add("S-08");
		al.add("S-09");
		al.add("S-10");
		al.add("S-11");
		al.add("S-12");
		return al;
	}

	public static ArrayList<String> getSecondRooms3() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("S-13");
		al.add("S-14");
		al.add("S-15");
		al.add("S-16");
		al.add("S-17");
		al.add("S-18");
		return al;
	}

	public static ArrayList<String> getThirdRooms1() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("T-01");
		al.add("T-02");
		al.add("T-03");
		al.add("T-04");
		al.add("T-05");
		al.add("T-06");
		return al;
	}

	public static ArrayList<String> getThirdRooms2() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("T-07");
		al.add("T-08");
		al.add("T-09");
		al.add("T-10");
		al.add("T-11");
		al.add("T-12");
		return al;
	}

	public static ArrayList<String> getThirdRooms3() {
		ArrayList<String> al = new ArrayList<String>();
		al.add("T-13");
		al.add("T-14");
		al.add("T-15");
		al.add("T-16");
		al.add("T-17");
		al.add("T-18");
		return al;
	}

}
