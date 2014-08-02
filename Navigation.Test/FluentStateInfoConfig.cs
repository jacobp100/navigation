﻿using System;
using System.Collections.Generic;

namespace Navigation.Test
{
	public class FluentStateInfoConfig
	{
		public static void Register(FluentStateInfo stateInfo)
		{
			stateInfo
				.Dialog("d0", new
				{
					s0 = new WebFormsState("", "~/d0/s0.aspx")
							.Title("s0"),
					s1 = new WebFormsState("", "~/d0/s1.aspx")
							.Title("s1")
							.DefaultTypes(new { _bool = typeof(int), @short = typeof(short), @long = typeof(string) })
							.Defaults(new { @string = "Hello", _bool = true, _int = 0, @short = (short)1, @long = 2L, @float = 3F })
							.Derived("st1 ", " bool ", "  long")
							.Attributes(new { mobilePage = "~/mobile/d0/s1.aspx" }),
					s2 = new WebFormsState("", "~/d0/s2.aspx")
							.Title("s2")
							.DefaultTypes(new { @string = typeof(string), DateTime = typeof(DateTime), @char = typeof(char), @byte = typeof(char) })
							.Defaults(new { emptyString = "", @double = 4D, @decimal = 5M, DateTime = new DateTime(1990, 3, 1, 12, 35, 47), @byte = (byte)6, @char = (char)7 })
							.Derived("string", "decimal"),
					s3 = new WebFormsState("", "~/d0/s3.aspx")
							.Title("s3")
							.DefaultTypes(new { s1 = typeof(string), s2 = typeof(int), b1 = typeof(bool), i1 = typeof(int), sh1 = typeof(short), l1 = typeof(long), f1 = typeof(float), d1 = typeof(double), de1 = typeof(decimal), dt2 = typeof(DateTime), t1 = typeof(TimeSpan), by1 = typeof(byte), ch1 = typeof(char), g1 = typeof(Guid) }),
					s4 = new WebFormsState("", "~/d0/s4.aspx")
							.Title("s4")
							.DefaultTypes(new { @string = typeof(string), @bool = typeof(bool), @int = typeof(int), @short = typeof(short), @long = typeof(long), @float = typeof(float), @double = typeof(double), @decimal = typeof(decimal), DateTime = typeof(DateTime), TimeSpan = typeof(TimeSpan), @byte = typeof(byte), @char = typeof(char), Guid = typeof(Guid) }),
				}, d => d.s0)
					.Title("d0")
					.Attributes(new { path = " d0 " })
					.Transition("t0", d => d.s0, d => d.s1)
					.Transition("t1", d => d.s0, d => d.s2)
					.Transition("t2", d => d.s0, d => d.s3)
					.Transition("t3", d => d.s0, d => d.s4)
					.Transition("t0", d => d.s1, d => d.s2)
					.Transition("t1", d => d.s1, d => d.s3)
					.Transition("t2", d => d.s1, d => d.s4)
					.Transition("t0", d => d.s2, d => d.s3)
					.Transition("t1", d => d.s2, d => d.s4)
					.Transition("t0", d => d.s3, d => d.s4)
				.Dialog("d1", new
				{
					s0 = new WebFormsState("", "~/d1/s0.aspx")
							.Title("s0")
							.Attributes(new Dictionary<string, string> { { "defaultTypes", "_0_1_2_3_4_5_=int,*/()-_+~@:?><.;[]{}!£$%^#&=short" } })
							.Attributes(new { theme = "  test ", masters = "test1  , test2 " }),
					s1 = new WebFormsState("", "~/d1/s1.aspx")
							.Title("s1")
							.Attributes(new Dictionary<string, string> { { "defaults", "  &s0=a,s1=b,s2?string=c,s3=d,b1=true,b2?bool=false,b3?bool=true,i1=0,i2?int=1,i3?int=2,sh1=3,sh2?short=4,sh3?short=5,l1=6,l2?long=7,l3?long=8,f1=9,f2?float=10,f3?float=11,d1=12,d2?double=13,d3?double=14,de1=15,de2?decimal=16,de3?decimal=17,dt1=1/3/1990 12:35:47,dt2?datetime=2/4/1991 13:36:48,dt3?datetime=3/5/1992 14:37:49,t1?string=d,by1=18,by2?byte=19,by3?byte=20,ch1=e,ch2?char=f,ch3?char=g,g1?string=h" }, { "defaultTypes", "s1=string,s2=bool,b1=bool,b2=int,i1=int,i2=short,sh1=short,sh2=long,l1=long,l2=float,f1=float,f2=double,d1=double,d2=decimal,de1=decimal,de2=datetime,dt1=datetime,dt2=timespan,t1=timespan,by1=byte,by2=char,ch1=char,ch2=guid,g1=guid" } })
							.Attributes(new { masters = ",", mobilePage = "  ~/mobile/d1/s1.aspx " }),
					s2 = new WebFormsState("", "~/d1/s2.aspx")
							.Title("s2")
							.Attributes(new { masters = "!@" }),
					s3 = new WebFormsState("", "~/d1/s3.aspx")
							.Title("s3")
							.Attributes(new Dictionary<string, string> { { "mobileTheme", " test  " }, { "mobileMasters", " test1 ,  test2" } }),
					s4 = new WebFormsState("", "~/d1/s4.aspx")
							.Title("s4")
							.Attributes(new { mobileMasters = "," }),
					s5 = new WebFormsState("", "~/d1/s5.aspx")
							.Title("s5")
							.Attributes(new { mobileMasters = "!@" }),
				}, d => d.s0)
					.Title("d1")
					.Attributes(new { path = "d1" })
					.Transition("t0", d => d.s0, d => d.s1)
					.Transition("t0", d => d.s1, d => d.s2)
					.Transition("t0", d => d.s2, d => d.s3)
					.Transition("t0", d => d.s3, d => d.s4)
					.Transition("t0", d => d.s4, d => d.s5)
					.Transition("t0", d => d.s4, d => d.s5)
					.Transition("t0", d => d.s5, d => d.s0)
					.Transition("t1", d => d.s5, d => d.s1)
					.Transition("t2", d => d.s5, d => d.s2)
					.Transition("t3", d => d.s5, d => d.s3)
					.Transition("t4", d => d.s5, d => d.s4)
				.Build();
		}
	}
}
