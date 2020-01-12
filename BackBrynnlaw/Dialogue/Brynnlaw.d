BEGIN O#MYST			// mysterious messenger(Irene)
BEGIN O#ROSLIN 	 		// good guy
BEGIN O#DORA			// maiden in distress
BEGIN O#JEREMY
BEGIN O#BERLIN	 		// villain
BEGIN O#DORAB1
BEGIN O#DORAB2
BEGIN O#DORAB3
BEGIN O#WIZSPE
BEGIN O#SION			// subquest 1
BEGIN O#KETTA			
BEGIN O#GONI			// subquest 2
BEGIN O#GONIW1
BEGIN O#GONIW2
BEGIN O#GONICA
BEGIN O#ALIA			// subquest 3
BEGIN O#REVIN			// subquest 4
BEGIN O#REVINS
BEGIN O#KVAS			// subquest 5
BEGIN O#KVASW
BEGIN O#WOLL 			// subquest 6
BEGIN O#PIRAT1
BEGIN O#PIRAT2
BEGIN O#GHOSTG			// subquest 7
BEGIN O#GHOST
BEGIN O#GALVEN			// subquest 8
BEGIN O#SLAVA			
BEGIN O#YASEN
BEGIN O#BRYNT			// misc dialogue
BEGIN O#BRYNB
BEGIN O#IRENE			// subquest 9
BEGIN O#FOREL			// subquest 10

/* ===============================================================

		MAIN QUEST: ATHKATLA

   =============================================================== */

// Cowled woman, elven, robe of the Archmage, Mysterious Figure - initiates dialogue

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",1)~ THEN O#MYST m1
@0 /* Bhaalspawn. Stop. */
== O#MYST @1 /* We know what transpired in Spellhold. You are dying. But there is a way. */
END
++ @2 /* Who are you? */ EXTERN O#MYST m1.1
++ @3 /* What the hell do you want? */ EXTERN O#MYST m1.1
++ @4 /* I am listening. */ EXTERN O#MYST m1.1

CHAIN O#MYST m1.1
@5 /* Go to the docks where the Shadow Thieves reside. Enter the warehouse next to their building. */
== O#MYST @6 /* He will see you there. */
DO ~AddJournalEntry(@10012,QUEST)
SetGlobal("O#BrynnQuest","GLOBAL",2)
EscapeArea()~
EXIT

// Roslin, the leader and the quest giver - initiates dialogue

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",3)~ THEN O#ROSLIN r1
@7 /* You have come. Good. I was afraid you would go off hunting Irenicus, but it seems my associate's arguments proved convincing. */
END
++ @8 /* Who was she? */ EXTERN O#ROSLIN r1.1
++ @9 /* What is this about? */ EXTERN O#ROSLIN r1.3
++ @10 /* She knew about Spellhold. Not everyone does. */ EXTERN O#ROSLIN r1.2

CHAIN O#ROSLIN r1.1
@11 /* A colleague of mine. I think you are more interested in who I am. */
END
IF ~~ EXTERN O#ROSLIN r1.3

CHAIN O#ROSLIN r1.2
@12 /* Precisely. I thought you'd be interested. */
END
IF ~~ EXTERN O#ROSLIN r1.3

CHAIN O#ROSLIN r1.3
@13 /* My name is Roslin, and I am a Cowled Wizard. A rogue Cowled Wizard, now that we've finally met. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",4) EraseJournalEntry(@10012)~
== O#ROSLIN @14 /* We are in danger, <CHARNAME>, and we do not have much time. Once this meeting is over, every Cowled Wizard will be ordered to hunt you. */
== O#ROSLIN @15 /* You have a choice to leave right now. If you don't, you are in. What will it be? */
END
++ @16 /* Tell me more. */ EXTERN O#ROSLIN r1.5
++ @17 /* Continue. I am not going anywhere. */ EXTERN O#ROSLIN r1.5
++ @18 /* So be it, then. I am leaving. */ EXTERN O#ROSLIN r1.4

CHAIN O#ROSLIN r1.4
@19 /* As you wish. We will not meet again. */
DO ~AddJournalEntry(@10013,QUEST_DONE) ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

CHAIN O#ROSLIN r1.5
@20 /* You are powerful, strong, a born winner. But Irenicus took it all from you. I saw the mechanisms he assembled in Spellhold. He tried to steal your divinity and succeeded. */
END
++ @21 /* I know that already, thank you very much. */ EXTERN O#ROSLIN r1.6
++ @22 /* This much is true. Go on. */ EXTERN O#ROSLIN r1.6

CHAIN O#ROSLIN r1.6
@23 /* There is one fact you do not know. Imoen and yourself were not the first ones Irenicus experimented on. */
== O#ROSLIN @24 /* A young girl, Dora, my old apprentice, was his first victim. She... lived afterwards, but there wasn't much left of her after he was finished. */
== O#ROSLIN @25 /* Yet her situation is not hopeless. There are mysteries in Spellhold, old devices that can unravel Irenicus' dark rituals. Alas, only the last wielder can operate them. */
END
++ @26 /* The last wielder? */ EXTERN O#ROSLIN r1.7
++ @27 /* Who is that? */ EXTERN O#ROSLIN r1.7

CHAIN O#ROSLIN r1.7
@28 /* You. You were the last who touched Irenicus' mechanisms. Your presence is the key. */
== O#ROSLIN IF ~!Dead("Imoen2") !Dead("C6Bodhi")~ THEN @847 /* Your friend Imoen was also there, but the devices remember you. And Imoen's soul is bound with Bodhi, deep down in the crypts of Athkatla's graveyard... but you probably know this already. */
== O#ROSLIN IF ~!Dead("Imoen2") Dead("C6Bodhi")~ THEN @848 /* Your friend Imoen was also there, but the devices remember you. And Imoen is now hale and restored, as far as I am aware. I need you. */
== O#ROSLIN @29 /* I want your help, <CHARNAME>. Dora was everything to me, my star apprentice and my friend, and I can't see her wasting away. */
== O#ROSLIN @30 /* Sail with me to Brynnlaw. Help me save Dora. Awaken the ancient magic, and together we shall be able to return your soul. */
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @31 /* Sail to B-Brynnlaw? Again? But what about Irenicus, <CHARNAME>? The elves need our help! */
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @32 /* A difficult choice, my friend. Yet this quest is noble, and I see little honor in refusing the deed. */
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @33 /* Irenicus' rituals were dark and unnatural. Will you allow this wizard to follow in his footsteps? */
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @34 /* Ha! A fine way to gather more power. (And quickly, before more monkeys arrive on the island in search for knowledge!) */
== HAERDAJ IF ~InParty("Haerdalis") InMyArea("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @35 /* A new adventure, aye, my raven? The choice is yours, as always. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @36 /* Can he truly return your soul? I don't know... but I will follow you to the Abyss if he can. */
== O#ROSLIN @37 /* This is what I'm offering you. The decision is yours. */
END
++ @38 /* Can I get my soul without confronting Irenicus? Is it truly possible? */ EXTERN O#ROSLIN r1.8
++ @39 /* I am still not convinced. You want to go against your brethren - to help me? */ EXTERN O#ROSLIN r1.9
++ @40 /* Very well, I agree. What exactly do you propose? */ EXTERN O#ROSLIN r1.10
++ @41 /* No. I am sorry, but this is my final word. */ EXTERN O#ROSLIN r1.4

CHAIN O#ROSLIN r1.8
@42 /* I do not know. But travelling to Brynnlaw would be much less costly than confronting Irenicus, his allies and his army. */
END
++ @43 /* I see. Very well, I am willing to take this chance. I am with you. */ EXTERN O#ROSLIN r1.10
++ @44 /* No, confronting Irenicus is the only way. I refuse your offer. */ EXTERN O#ROSLIN r1.4

CHAIN O#ROSLIN r1.9
@45 /* I want nothing from my 'brethren'. They abandoned Dora, and when they returned to the isle, they wanted to take her back to Amn for their experiments. I no longer care what they think. */
END
++ @46 /* I believe you. Tell me what needs to be done. */ EXTERN O#ROSLIN r1.10
++ @47 /* No. I still do not trust you. */ EXTERN O#ROSLIN r1.4

CHAIN O#ROSLIN r1.10
@48 /* You will go to Brynnlaw. A pirate captain, Jeremy, awaits you outside of the Five Flagons Inn. */
== O#ROSLIN @49 /* Once on the island, I will find you. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",5) AddJournalEntry(@10014,QUEST)~
END
++ @50 /* Anything else? */ EXTERN O#ROSLIN r1.11
++ @51 /* I understand. */ EXTERN O#ROSLIN r1.11

CHAIN O#ROSLIN r1.11
@52 /* We shall see each other soon. Remember: from this point on you are exposed. Cowled Wizards will soon know of our conversation and will come after you. */
== O#ROSLIN @53 /* Find Jeremy outside of the Five Flagons. Be careful. */
DO ~ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

// Jeremy, Pirate captain, journey to Brynnlaw

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",6)~ THEN O#JEREMY j1
@54 /* You're the Bhaalspawn, then? */
END
++ @55 /* I am. */ EXTERN O#JEREMY j1.1
++ @56 /* And you're the captain. */ EXTERN O#JEREMY j1.1

CHAIN O#JEREMY j1.1
@57 /* Good. The wind favors us, and I've grown tired of waiting. Are you ready to go? */
END
++ @58 /* Let's set sail. */ EXTERN O#JEREMY j1.2
++ @59 /* Not yet. */ EXTERN O#JEREMY j1.3

CHAIN O#JEREMY j1.2
@60 /* Finally. Follow me. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",8)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#Bryn1")~
EXIT

CHAIN O#JEREMY j1.3
@61 /* Blast it. You have one day to pick up your doilies and get your ass back here. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",7)~
== O#JEREMY @62 /* And don't bother having breakfast. It never ends well. */
EXIT

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",7)~ THEN O#JEREMY j2
@63 /* Well? */
END
++ @64 /* I am ready now. */ EXTERN O#JEREMY j1.2
++ @65 /* Just passing through. */ EXTERN O#JEREMY j2.1

CHAIN O#JEREMY j2.1
@66 /* One. Blasted. Day. Then I'm out of here. Understand? */
EXIT

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",8)~ THEN O#JEREMY j3
@67 /* Here is our lady. "Adventure" I call her, and don't you dare say that it stinks! */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",9)~
== O#JEREMY @68 /* Welcome aboard. Stay out of the way and try not to puke on the deck. */
DO ~EraseJournalEntry(@10014)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#Bryn2")~
EXIT

/* =============================================================== 

		MAIN QUEST: BRYNNLAW

   =============================================================== */

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",9)~ THEN O#JEREMY j4
@69 /* Here we are. Good news: Roslin paid for your passage from Athkatla and back. Bad news: no sane captain will take you back, including myself. You're aiding Roslin, a renegade, and there is a price on your head. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",10)~
== O#JEREMY @70 /* The Cowled Wizards of Spellhold are not a merciful bunch, and nobody wants to cross them. Speaking of which, I should get going, lest someone sees us together and torches my ship. */
== O#JEREMY @71 /* Wait. Are these?.. */
DO ~EscapeArea()~
EXIT

// Ambush off Jeremy's ship, Berlin

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",11)~ THEN O#BERLIN b1
@72 /* Bhaalspawn. Somehow I knew you'd already be here. */
END
++ @2 /* Who are you? */ EXTERN O#BERLIN b1.1
++ @73 /* Great, more Cowled Wizards to kill. */ EXTERN O#BERLIN b1.1
++ @74 /* We don't need to fight. */ EXTERN O#BERLIN b1.0

CHAIN O#BERLIN b1.0
@75 /* Don't we? I beg to differ. */
END
IF ~~ EXTERN O#BERLIN b1.1

CHAIN O#BERLIN b1.1
@76 /* My name is Berlin, and I lead the Cowled Wizards on this island. As for the rest... but you don't actually need to know that, do you? You seek to aid Roslin and enter Spellhold, I seek to prevent it. It's as simple as that. */
== O#BERLIN @77 /* What are you gaping at, idiots? Attack <PRO_HIMHER>! */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",12)
ActionOverride("O#BerlG1",Enemy())
ActionOverride("O#BerlG2",Enemy())
ActionOverride("O#BerlG3",Enemy())
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

// Roslin's appearance

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",13)~ THEN O#ROSLIN r2
@78 /* <CHARNAME>! It is good to see you alive and whole... well, relatively, anyway. And with dead Cowled Wizards all around you. An impressive job. */
END
++ @79 /* I could've used your help. */ EXTERN O#ROSLIN r2.0
++ @80 /* These Cowled Wizards were intent on killing me. */ EXTERN O#ROSLIN r2.1

CHAIN O#ROSLIN r2.0
@81 /* Well, by now you should know that it never goes quite like this, alas. */
END
IF ~~ EXTERN O#ROSLIN r2.1

CHAIN O#ROSLIN r2.1
@82 /* I should apologize to you. I didn't mention that your captain would only be willing to provide passage back to Athkatla once the Cowled Wizards were no longer a threat. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",14) AddExperienceParty(30000)~
== O#ROSLIN @83 /* But we must get rid of them anyway, to bring my apprentice, Dora, to sanity and to rip your soul from Irenicus' chest. So, a lie of omission it was, but not truly a harmful one. */
END
++ @84 /* Let me be the judge of that. */ EXTERN O#ROSLIN r2.2
++ @85 /* Perhaps. What should we do now? */ EXTERN O#ROSLIN r2.3

CHAIN O#ROSLIN r2.2
@86 /* Of course. Again, my apologies. */
END
IF ~~ EXTERN O#ROSLIN r2.3

CHAIN O#ROSLIN r2.3
@87 /* Sadly, just like the last time, Spellhold is closed to us. The  front door is locked, old wardstones are disabled, and I cannot obtain a new one without being noticed and slaughtered on the spot. */
== O#ROSLIN @88 /* I will try to approach my old contacts, though I cannot be sure they'll even want to talk. In the meantime, I have a task for you. */
== O#ROSLIN @89 /* There is a matter of my former apprentice, Dora. She has lost her soul, but she is far from helpless. */
== O#ROSLIN @90 /* Dora created her own mercenary band, and her people roam all over the island. They kill people, <CHARNAME>. They claim they only kill 'bad' people, like pirates and brothel clients and rowdy drunks, but it makes Dora's band just as dangerous as any bandit group. And the Cowled Wizards help them, I fear. */
== O#ROSLIN @91 /* You need to find Dora and talk to her. You both suffered at Irenicus' hands. Perhaps you will succeed where I have not. */
END
++ @92 /* Where can I find her? */ EXTERN O#ROSLIN r2.5
++ @93 /* I can try, but I doubt that she'll listen. */ EXTERN O#ROSLIN r2.5
++ @94 /* Can't we just kill her, if she's a murderer who leads murderers? */ EXTERN O#ROSLIN r2.4

CHAIN O#ROSLIN r2.4
@95 /* Would you kill your own daughter, if she killed someone? Could you? */
END
IF ~~ EXTERN O#ROSLIN r2.5

CHAIN O#ROSLIN r2.5
@96 /* Dora's headquarters are in the Pirate Lord's old residence. If she's not there, she can be with her people at the former brothel, or with her people at the eastern part of the town. */
== O#ROSLIN @97 /* One more thing. Sion and Ketta, two opportunists of note, took residence in the shop. They have certain magical means of escaping this island. Remember that if you suddenly decide to return to Athkatla. */
== O#ROSLIN @98 /* Search the brothel, the Pirate Lord's house and the eastern side of Brynnlaw for Dora's people. They will likely attack, but it's unavoidable. */
== O#ROSLIN @99 /* Perhaps Dora will find you if you kill enough of her people. After you've found her and talked to her, find me in the tavern. */
DO ~AddJournalEntry(@10015,QUEST) ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

// Dora's guy, brothel

CHAIN IF ~Global("O#BrynnlawBrothel","GLOBAL",0)~ THEN O#DORAB1 b1
@100 /* Look what the cat dragged in! Is it male or female? */
DO ~SetGlobal("O#BrynnlawBrothel","GLOBAL",1)~
== O#DORAB1 @101 /* Hey, you! What's under these clothes, eh? Two figs and a small sausage or just 'some bushy wetness? */
END
++ @102 /* Are you talking to me? */ EXTERN O#DORAB1 b1.0
++ @103 /* Are you so intent on picking your teeth with broken arms? */ EXTERN O#DORAB1 b1.0
++ @104 /* Who's whining over there? A whiny unwashed urchin, I'd wager. */ EXTERN O#DORAB1 b1.0

CHAIN O#DORAB1 b1.0
@105 /* It can talk! Well, no matter. I don't talk with the likes of you. Every client of every brothel in Brynnlaw must die! Starting with you. */
= @106 /* Let's get to it, boys! Everyone, listen: <PRO_HISHER> boots are MINE! */
EXIT

// Dora's guy, the Pirate Lord's house

CHAIN IF ~Global("O#BrynnlawPirateLord","GLOBAL",0)~ THEN O#DORAB2 b2
@107 /* What do we have here? Another good-for-nothing pirate? */
END
++ @108 /* You hunt pirates, do you? */ EXTERN O#DORAB2 b2.1
++ @109 /* Do you want to kill all pirates on this island? */ EXTERN O#DORAB2 b2.1
++ @110 /* I need to talk to Dora. */ EXTERN O#DORAB2 b2.0

CHAIN O#DORAB2 b2.0
@111 /* Tough luck. */
END
IF ~~ EXTERN O#DORAB2 b2.1

CHAIN O#DORAB2 b2.1
@112 /* Every pirate on this island must die! That's what Dora says, and I'm not about to disagree with her. This one came on Jeremy's ship, so <PRO_HIMHER> is a pirate's ally! Kill <PRO_HIMHER>! */
DO ~SetGlobal("O#BrynnlawPirateLord","GLOBAL",1)~
EXIT

// Dora's guy, the eastern part of Brynnlaw.

CHAIN IF ~Global("O#BrynnlawEastern","GLOBAL",0)~ THEN O#DORAB3 b3
@113 /* The Bhaalspawn is here, guys! Seems like our prey came calling! */
END
++ @114 /* And why precisely am I your 'prey'? */ EXTERN O#DORAB3 b3.1
++ @115 /* I'm no prey. */ EXTERN O#DORAB3 b3.1
++ @116 /* (sigh) Do I have to kill you all, too? */ EXTERN O#DORAB3 b3.1

CHAIN O#DORAB3 b3.1
@117 /* We shall stand for no more thugs and ruffians in the streets, entering homes of decent people and taking whatever they please. You've robbed many people blind, Bhaalspawn, and not all of them were pirates and slavers. */
DO ~SetGlobal("O#BrynnlawEastern","GLOBAL",1)~
== O#DORAB3 @118 /* Which means that you die. Right about now. */
EXIT

// Dora, after meeting all three bands

CHAIN IF ~Global("O#DoraSpeaks","GLOBAL",1)~ THEN O#DORA d1
@119 /* You! You've been killing my men! Stop at once, or I'll - */
DO ~SetGlobal("O#DoraSpeaks","GLOBAL",2) AddExperienceParty(30000)~
== O#DORA @120 /* Wait. I recognize you. You're that young <PRO_GIRLBOY> from Spellhold. You came for your half-sister, Imoen. */
END
++ @121 /* Yes, that's me. You must be Dora. */ EXTERN O#DORA d1.1
++ @122 /* I've heard you've suffered from Irenicus, too. I'm sorry. */ EXTERN O#DORA d1.1
++ @123 /* And you're a bandit and a murderer. */ EXTERN O#DORA d1.0

CHAIN O#DORA d1.0
@124 /* Yes. I won't shrink from it. But I believe in what we're doing. */
END
IF ~~ EXTERN O#DORA d1.1

CHAIN O#DORA d1.1
@125 /* I envy you and Imoen, you know. You came for her. You fought for each other, even if there's little love between you. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @126 /* <CHARNAME> came for me, and I'll always be grateful to <PRO_HIMHER>. But you're not alone, either. Remember your old teacher? Roslin cares about you. */
== O#DORA @127 /* No one came for me. Roslin tried, but he was too late. By the time he got on the island, Irenicus was already done with me. That madman took something from me and threw it away - I was just an experiment, an appetizer before the main meal. */
= @128 /* And I had no divine blood to draw strength from. I don't even know how I survived. */
= @129 /* But I built myself back anew. Brynnlaw is my home now, and these are my people. We'll clean this town from brigands and pirates. In a year, there will be no whores and beggars, no smugglers and thieves, no layabouts and no slaves. */
END
++ @130 /* And how are you going to do that? Kill anyone who disagrees with you? */ EXTERN O#DORA d1.2
++ @131 /* What do the Cowled Wizards have to say about it? */ EXTERN O#DORA d1.2

CHAIN O#DORA d1.2
@132 /* The Cowled Wizards are on my side. Berlin, their leader, gave me permission. They understand what must be done. Ten percent of this island's people poison the lives of the rest. This cannot continue. */
= @133 /* When we're done, this will be a calm, quiet town. No rowdy songs in the middle of the night, no drunk pirates and common slatterns. And if someone tries the old ways again, he'll meet our blades. */
END
++ @134 /* I actually agree with you. This town must be cleansed. */ EXTERN O#DORA d1.4
++ @135 /* This is madness! If you start cleansing Athkatla this way, there'll be no one left alive! */ EXTERN O#DORA d1.3
++ @136 /* It sounds suspiciously like genocide. */ EXTERN O#DORA d1.3

CHAIN O#DORA d1.3
@137 /* And I see nothing wrong with it. */
END
IF ~~ EXTERN O#DORA d1.4

CHAIN O#DORA d1.4
@138 /* Bandits and pirates terrorized the isle of Brynnlaw for years. Young girls were forced into prostitution, men were killed and terrorized. People couldn't sleep at night because of drunk ruffians under their windows. */
= @139 /* This had to stop. I am the new force in this town, and my judgement is going to be swift. */
= @140 /* But it need not concern you any longer, <CHARNAME>. The Cowled Wizards will find you and kill you very soon. You are helping Roslin, a renegade, which means there's a price on your head. */
END
++ @141 /* Roslin is your teacher, and he cares about you. Doesn't it mean anything? */ EXTERN O#DORA d1.5
++ @142 /* And you're going to claim this price, I take it? */ EXTERN O#DORA d1.5

CHAIN O#DORA d1.5
@143 /* Roslin was my mentor, and I loved him, but I'm not that girl anymore. And I can't oppose the Cowled Wizards, or my band will be wiped out. That's what I told Roslin when we met, and that's what I'm telling you. */
== O#DORA @144 /* I'm sorry, <CHARNAME>. Roslin tried, but there's no saving me, there's no changing me - and there's no mercy for you. Run, while you can, or be destroyed. */
DO ~EscapeArea()~
EXIT

// Roslin, the tavern

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",14)~ THEN O#ROSLIN r3
@145 /* You have found me, I see. Have you seen Dora? */
END
+ ~Global("O#DoraSpeaks","GLOBAL",2)~ + @146 /* I have, but she escaped. Her men attacked me. */ EXTERN O#ROSLIN r3.1
++ @147 /* No, I haven't. */ EXTERN O#ROSLIN r3.2

CHAIN O#ROSLIN r3.1
@148 /* I see. She is working against us, then. And the Cowled Wizards on this island are making matters even worse. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",15)
AddExperienceParty(55000)~
= @149 /* But no matter. We must find a way to get to Spellhold. */
= @150 /* One of Dora's men is a Cowled Wizard, brought here to Brynnlaw to spy on her. He has the key we need. */
= @151 /* Tonight and probably the next night he's going to be in the docks. Go there after dark. Stop him, kill his men, and find the wardstone. With it you can head straight to Spellhold. I'll follow you inside. */
DO ~EraseJournalEntry(@10015)
AddJournalEntry(@10016,QUEST)
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

CHAIN O#ROSLIN r3.2
@152 /* Her man are at the former brothel, in the eastern part of town and in the Pirate Lord's former residence. Once you deal with them all, Dora will appear, I am sure. */
EXIT

// Berlin, after acquiring the wardstone

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",17)~ THEN O#BERLIN b2
@153 /* What is going on here? Who is killing my mages? */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",18)~
= @154 /* Ah, a Child of Bhaal. We meet again. I should have known. */
= @155 /* Step one foot into Spellhold on your own peril. The Cowled Wizards know how to deal with the likes of you! */
DO ~ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

/* =============================================================== 

		MAIN QUEST: SPELLHOLD

   =============================================================== */

// Spellhold is closed

CHAIN IF ~Global("O#WIZSPESpeaks","GLOBAL",0)~ THEN O#WIZSPE w1
@156 /* Turn back! The entry to this place is blocked, and no one can pass. */
END
++ @157 /* Is there any other way? */ EXTERN O#WIZSPE w1.1
++ @158 /* What if I have a wardstone? */ EXTERN O#WIZSPE w1.1

CHAIN O#WIZSPE w1.1
@159 /* Hear me, fool. We created an impenetrable wall around the asylum for your own good. Go back to your petty squabbles or be punished. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @160 /* I'm... temped to follow his advice, <CHARNAME>. But I'm with you. */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @161 /* No! A path to <CHARNAME>'s soul resides inside, and you will let us pass! */
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @162 /* Ho-ho. And you think your grim-looking cowls and stern looks will make us turn back, will you? */
== KELDORJ IF ~InParty("Keldorn")InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @163 /* This is a matter of life and death. I do not wish to fight, but neither will I let <CHARNAME> perish. */
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @164 /* Ready yer magics, wizard! */
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @165 /* We are here in the name of all that is good and right, to help our friend recover his soul! Let us pass! */
== O#WIZSPE @166 /* Wait. */
= @167 /* I know your face. I saw you at the Promenade! You were with the girl, Imoen! You! */
END
++ @168 /* <CHARNAME>, at your service. */ EXTERN O#WIZSPE w1.2
++ @169 /* So what? You imprisoned and tortured an innocent girl. It is you who should be ashamed. */ EXTERN O#WIZSPE w1.2
++ @170 /* Yes, and you let Irenicus go. Do you know what he's done to me? */ EXTERN O#WIZSPE w1.2

CHAIN O#WIZSPE w1.2
@171 /* It was you Irenicus was after! He demolished Spellhold, killed many of our number, imprisoned Wanev - all because of you! Nothing of it would've happened if not for him - and you! */
END
++ @172 /* Now wait here just a minute! */ EXTERN O#WIZSPE w1.3
++ @173 /* You dare accuse me? */ EXTERN O#WIZSPE w1.3
++ @174 /* You are being unreasonable. Calm down, and we'll talk. */ EXTERN O#WIZSPE w1.3

CHAIN O#WIZSPE w1.3
@175 /* We have nothing more to talk about. Our new orders are to attack you on sight. Do it! */
DO ~SetGlobal("O#WIZSPESpeaks","GLOBAL",1)
ActionOverride("O#WIZSP1",Enemy())
ActionOverride("O#WIZSP2",Enemy())
Enemy()
ChangeAIScript("O#BRCOW2",OVERRIDE)~
EXIT

// Dora, Spellhold, outside, party has the wardstone

CHAIN IF ~Global("O#DoraSpeaks","GLOBAL",3)~ THEN O#DORA d2
@176 /* Hold! I have a warning for you. */
DO ~SetGlobal("O#DoraSpeaks","GLOBAL",4)~
== O#DORA @177 /* Roslin was dear to me once, so I'll say this much: don't enter Spellhold, <CHARNAME>. Whatever you're planning, you'll be overwhelmed. Berlin prepared well. */
END
++ @178 /* Really? Then how come I've acquired the wardstone to Spellhold so quickly? */ EXTERN O#DORA d2.1
++ @179 /* You can't expect me just to turn around and go. */ EXTERN O#DORA d2.1
++ @180 /* He can't be worse than Irenicus. */ EXTERN O#DORA d2.1

CHAIN O#DORA d2.1
@181 /* You don't understand. Spellhold is a trap. Berlin is a powerful mage, he studied Irenicus' devices, he knows about divine power in your blood! Even drained of your soul, you're still of interest to him! */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @182 /* Looks like this Berlin really wants to fill Irenicus' shoes. What do we do, <CHARNAME>? */
== O#DORA @183 /* I've warned you. Do what you got to do. Just know that if you get Roslin killed, his blood will be on your hands. */
DO ~EscapeArea()~
EXIT

// Roslin, Spellhold, near the entrance

CHAIN IF ~Global("O#RoslinSpeaks","GLOBAL",1)~ THEN O#ROSLIN r4
@184 /* <CHARNAME>. You've got the stone. And I have some bad news. */
END
++ @185 /* Somehow I'm not surprised. */ EXTERN O#ROSLIN r4.1
++ @186 /* You've been one of the bad guys all along? */ EXTERN O#ROSLIN r4.0
++ @187 /* Spit it out. */ EXTERN O#ROSLIN r4.1

CHAIN O#ROSLIN r4.0
@188 /* An intriguing hypothesis, but no. I truly want to save Dora, and I sincerely believe we can try and restore your soul via Irenicus' machinery. Or a part of it, at least... (sigh) We have to try. */
END
IF ~~ EXTERN O#ROSLIN r4.1

CHAIN O#ROSLIN r4.1
@189 /* You've met Berlin, I believe. He is currently in charge of Spellhold's defenses. And he's a surprisingly competent wizard. */
DO ~SetGlobal("O#RoslinSpeaks","GLOBAL",2)~
== O#ROSLIN @190 /* Berlin won't let you near the basement, <CHARNAME>. Not peacefully. */
END
++ @191 /* You mean I'll basically have to kill him and all the Cowled Wizards I see? */ EXTERN O#ROSLIN r4.2
++ @192 /* I'll enjoy searching his corpse, then. */ EXTERN O#ROSLIN r4.2
++ @193 /* He sounded like a smart man. Isn't there any way to reason with him? */ EXTERN O#ROSLIN r4.2

CHAIN O#ROSLIN r4.2
@194 /* I wish there was a peaceful solution. However... */
= @195 /* Ten years ago, when Dora just began her studies, Berlin became her first mentor. He gave her tasks she didn't like very much: launder his things, clean the floors, light his fires. Not widely practiced, but not terrible, either. */
= @196 /* Dora refused. She came to learn magic, she said, not to scrub desks. Next thing I knew, she was gliding through halls like a shadow, doing Berlin's tasks without protest. I realized what was wrong only four days later. */
END
++ @197 /* What happened? */ EXTERN O#ROSLIN r4.3
++ @198 /* It is obvious. Berlin used an enchantment spell on her. */ EXTERN O#ROSLIN r4.3
++ @199 /* Domination? */ EXTERN O#ROSLIN r4.3

CHAIN O#ROSLIN r4.3
@200 /* Berlin cast a dire charm on her, washed away her willpower. He treated her like a thing. Like a golem. */
= @201 /* He may be a mighty and a learned wizard, but Berlin doesn't like those who disagree with him. And he never listens. To anyone. */
= @202 /* Be careful, <CHARNAME>. I'll try to sneak to the basement and get the devices going. Once Berlin is dead, his Cowled Wizards will disperse. I hope Dora will join us then. */
= @203 /* Good luck to us all. */
DO ~ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

// Kill Berlin's body double

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",19)~ THEN O#BERLIN b3
@204 /* We meet again. Aren't you getting tired of chases and conversations? Why don't we end it here and now? */
DO ~EraseJournalEntry(@10016)
AddJournalEntry(@10017,QUEST)
SetGlobal("O#BrynnQuest","GLOBAL",20)~
= @205 /* If you win, you'll have the run of Spellhold. If you lose... why, you'll enjoy the hospitality of the Cowled Wizards. */
END
++ @206 /* The first part sounds good to me. */ EXTERN O#BERLIN b3.1
++ @207 /* You probably know much more about Spellhold than I do. Why don't we work together? */ EXTERN O#BERLIN b3.2
++ @208 /* DIE! */ EXTERN O#BERLIN b3.3
+ ~Class(Player1,MAGE_ALL)~ + @209 /* I have only two words for you. Chain Contingency. */ EXTERN O#BERLIN b3.4
+ ~Class(Player1,MAGE_ALL)~ + @210 /* I have only two words for you. No, eight. Chain Contingency: Horrid Wilting, Horrid Wilting, Horrid Wilting. */ EXTERN O#BERLIN b3.4

CHAIN O#BERLIN b3.1
@211 /* Believe me, you'll enjoy the second. */
DO ~ActionOverride("O#WIZSP3",Enemy())
ActionOverride("O#WIZSP4",Enemy())
ActionOverride("O#WIZSP5",Enemy())
Enemy()~
EXIT

CHAIN O#BERLIN b3.2
@212 /* What for? I can just take you for my purposes. */
DO ~ActionOverride("O#WIZSP3",Enemy())
ActionOverride("O#WIZSP4",Enemy())
ActionOverride("O#WIZSP5",Enemy())
Enemy()~
EXIT

CHAIN O#BERLIN b3.3
@213 /* After you. */
DO ~ActionOverride("O#WIZSP3",Enemy())
ActionOverride("O#WIZSP4",Enemy())
ActionOverride("O#WIZSP5",Enemy())
Enemy()~
EXIT

CHAIN O#BERLIN b3.4
@214 /* Oh, crap... */
DO ~ActionOverride("O#WIZSP3",Enemy())
ActionOverride("O#WIZSP4",Enemy())
ActionOverride("O#WIZSP5",Enemy())
Enemy()~
EXIT

/* =============================================================== 

		MAIN QUEST: SPELLHOLD BASEMENT

   =============================================================== */

// Spellhold, lower level

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",21)~ THEN O#BERLIN b4
@215 /* Precisely on time. Did you enjoy battling my magical double upstairs? He played his role well, I trust. Come closer, all of you. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",22)
AddExperienceParty(15500)
EraseJournalEntry(@10017)
AddJournalEntry(@10018,QUEST_DONE)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#Bryn8")~ 
EXIT

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",23)~ THEN O#BERLIN b4.a
@216 /* And Dora, my dear. Impeccable timing, as usual. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",24)~
== O#ROSLIN @217 /* Was she working for you the entire time? */
== O#BERLIN @218 /* She is no longer your apprentice, Roslin. She is mine. She and her rag-tag band. And you, I fear, are helpless to do anything about it. Do you feel the wards I've placed on you? Your magic is blocked while I live. */
== O#BERLIN @219 /* Nice, isn't it? Brynnlaw inhabitants cowed into submission, troublemakers dead, hunted or corralled into Dora's little band, believing they're doing the right thing... and nobody disturbs me and my work. */
== O#ROSLIN @220 /* And which work would that be? */
== O#BERLIN @221 /* Irenicus resided within these walls, Roslin. His experiments are here, within grasp, within reach. And our reach needn't exceed our grasp any longer. Especially with the Child of Bhaal standing right before me. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @222 /* Uh-huh. I think this is our cue to attack. */
== O#BERLIN @223 /* Don't fight, <CHARNAME>. It's hopeless. Whatever force is keeping your alive will be mine. Just one short, incredible ritual - and I am GOD. */
END
++ @224 /* Ahem. Are you sure you haven't forgotten "Myahaha"? */ EXTERN O#BERLIN b4.1
++ @225 /* Not again! You'll die again before laying a finger on me! */ EXTERN O#BERLIN b4.2
++ @226 /* Not a chance. You are a stinking traitor, Dora. And you, Berlin, are crazy. */ EXTERN O#BERLIN b4.3
++ @227 /* Sure, I'll just stand here, shall I? */ EXTERN O#BERLIN b4.4

CHAIN O#BERLIN b4.1
@228 /* Quite sure. But if you insist - MYAHAHAHAHAHA! Now I'd like to continue. */
END
IF ~~ EXTERN O#ROSLIN b4.5

CHAIN O#BERLIN b4.2
@229 /* Oh, I intend to do much more than that. */
END
IF ~~ EXTERN O#ROSLIN b4.5

CHAIN O#BERLIN b4.3
@230 /* Me? Crazy? You wound me. Then again, I don't particularly care. */
END
IF ~~ EXTERN O#ROSLIN b4.5

CHAIN O#BERLIN b4.4
@231 /* Please do. Yes. Just like that. */
END
IF ~~ EXTERN O#ROSLIN b4.5

CHAIN O#ROSLIN b4.5
@232 /* I do not believe it. Dora, you wouldn't help this monster, would you? He is Irenicus in miniature, abusing the power of the Cowled Wizards! Can't you see it? Dora! Just say a word! */
== O#BERLIN @233 /* Oh, bother. Dora won't answer you, Roslin. I placed a domination spell over her. */
== O#ROsLIN @842 /* You- */
== O#BERLIN @841 /* Quite. After I'm done with <CHARNAME>, she will cease to be useful. I'll probably place one of my Cowled Wizards in charge of her vigilante band. */
== O#BERLIN @843 /* Now get out of my way! Dora, guard him in my chambers. I will deal with you after <CHARNAME> lies subdued at my feet. */
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#Bryn3")~
EXIT

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",25)~ THEN O#DORA b5
@237 /* He's dead. Berlin is dead, and his enchantments are gone. I know it's true, but I still can't believe it. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",26)~
== O#ROSLIN @238 /* Berlin spent much of his powers sustaining his double, I believe. Even so, he was a formidable foe. If not for <CHARNAME>, we could never hope to overwhelm him. */
== O#ROSLIN @239 /* Speaking of which... I've spent some time here before Berlin ambushed me, and I believe I know how to work the devices, now that my magic has returned. */
== O#ROSLIN @844 /* Are you prepared, <CHARNAME>? Or do you wish to loot the bodies first? You may not get the opportunity later. */
END
++ @234 /* Definitely loot the bodies first. */ EXTERN O#ROSLIN b6.0
++ @235 /* I've looted everything already. Let's begin the ritual. */ EXTERN O#ROSLIN b6.00

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",26)~ THEN O#DORA b6
@236 /* Speak to Roslin, <CHARNAME>. You saved our lives, but you killed my people. I suspect you and I don't have much to say to each other. */
EXIT

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",26)~ THEN O#ROSLIN b6
@240 /* Are you ready, <CHARNAME>? Or do you need more time? We may have to teleport straight out of here afterewards. */
END
++ @241 EXTERN O#ROSLIN b6.00 /* Ready. Let's begin the ritual. */
++ @242 EXTERN O#ROSLIN b6.0 /* I still need a minute. */

CHAIN O#ROSLIN b6.0
@243 /* Remember, we don't have much time. Come back soon. */
EXIT

CHAIN O#ROSLIN b6.00
@244 /* Irenicus used captured Shadow Thieves, their life essence. I'm going to use some of my own essence instead. */
== O#DORA @245 /* WHAT? Are you crazier than Berlin? */
== O#ROSLIN @246 /* We all return to the Weave in the end, Dora. Magic lives on. Besides, I'm not planning to die. Only a little of my life essence is needed. I'll live. */
== O#ROSLIN @247 /* And you'll receive your soul first. This way I'll be sure that you are going to be all right, and <CHARNAME> will learn that this is no trick. Are you ready, Dora? */
== O#DORA @248 /* No! */
== O#ROSLIN @249 /* That's my girl. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",27)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#Bryn4")~
EXIT

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",28)~ THEN O#DORA b6
@250 /* Roslin... Roslin? I'm alive? This... all this feels like a dream... Am I waking up? */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",29)~
== O#ROSLIN @251 /* You are yourself again. Your soul was lingering here, discarded, washed to the darkest depths of Spellhold. Now it's yours again, Dora. But as for <CHARNAME>... */
END
++ @252 /* What of me? */ EXTERN O#ROSLIN b6.1
++ @253 /* I knew it. You can't do it, can you? */ EXTERN O#ROSLIN b6.1
++ @254 /* What? You won't be able to return my soul because Irenicus has it? */ EXTERN O#ROSLIN b6.1

CHAIN O#ROSLIN b6.1
@255 /* Irenicus is too far away. Even if I had every Cowled Wizard of Spellhold standing here and willing to assist me, we would not be able to tie him to the device, not from such distance. I see it now. */
= @256 /* But a small fragment of your spirit lingers here, Child of Bhaal. Do you remember the day you lost your soul? Was there an exchange of sorts, perhaps, before Irenicus took what was left? */
END
++ @257 /* I had a dream about Candlekeep. I had to sacrifice a part of me to pass through. */ EXTERN O#ROSLIN b6.2
++ @258 /* A demon appeared to me in a dream. I had to sacrifice some of my health, wits, mind or agility. */ EXTERN O#ROSLIN b6.2
++ @259 /* There was. What of it? */ EXTERN O#ROSLIN b6.2
++ @260 /* I don't remember. */ EXTERN O#ROSLIN b6.2

CHAIN O#ROSLIN b6.2
@261 /* That part of you is still here, in the castle's stone and magic. You helped me to save Dora's life, and I shall return a piece of your soul to you. */
== O#ROSLIN @845 /* Again I shall have to sacrifice some of my life energy. You have to decide whether you want it. */ 
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @262 /* This is your soul, <CHARNAME>. I can't tell you what to do. But is it worth Roslin's life? */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @263 /* No! Surely it is just a small piece and our good friend will not risk good wizard's life for it! Even Boo doesn't want Roslin to spend all his blood here and die! */
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @264 /* Some magics have a heavy price, <CHARNAME>. This is one of them. Roslin volunteered, but his life is at great risk. Please, please, don't let him die. */
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @265 /* You need your soul, not some fragment of it. Leave Spellhold behind, <CHARNAME>. Irenicus awaits you. Let's turn our backs on this cursed place and never return. */
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @266 /* This is your chance! The wizard owes you a debt. Press him while he's vulnerable! With luck, you'll extract much more than you've ever hoped! */
== O#ROSLIN @267 /* The decision is yours and yours alone. Do you want to do the exchange? */
END
++ @268 /* Yes. Let's do it. */ EXTERN O#ROSLIN b6.3
++ @269 /* No. I refuse. Don't sacrifice your life force for my sake. */ EXTERN O#ROSLIN b6.4
++ @270 /* You owe me more than a piece of my soul. You will use all your life, all your magic, to reverse Irenicus' ritual, or Dora dies here, now. Is that clear? */ EXTERN O#ROSLIN b6.5

CHAIN O#ROSLIN b6.3
@271 /* Prepare yourself. */
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#Bryn5")~
EXIT

CHAIN O#ROSLIN b6.4
@272 /* I... I didn't expect such generosity out of you, to be honest. I thank you. */
END
IF ~~ DO ~AddExperienceParty(300000)
SetGlobal("O#BrynnlawGood","GLOBAL",1)
SetGlobal("O#BrynnQuest","GLOBAL",31)~ EXTERN O#DORA b7.1

CHAIN O#ROSLIN b6.5
@273 /* You... would you actually do this? But of course you would. You are devoid of your soul, after all. */
= @274 /* I may not succeed. Even so, this will require... more of my life essence. All of it, in fact. */
== O#DORA @275 /* No! Don't you even think - */
== O#ROSLIN @276 /* Dora, don't. */
== O#DORA @277 /* Please... */
== O#ROSLIN @278 /* Goodbye. */
DO ~SetGlobal("O#BrynnlawEvil","GLOBAL",1)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#Bryn5")~
EXIT

// The ritual

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",30)~ THEN O#ROSLIN b7
@279 /* Child of Bhaal. You wish to know yourself once more. Your desire will be granted. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",31)~
= @280 /* I shall return some of what was lost. Choose, and receive that which is yours by right. */
END
+ ~Global("O#BrynnlawEvil","GLOBAL",1)~ + @281 /* My strength. */ DO ~ReallyForceSpell(Player1,HELL_GAIN_STR) AddJournalEntry(@10020,QUEST_DONE)~ EXTERN O#ROSLIN b7.0
+ ~Global("O#BrynnlawEvil","GLOBAL",1)~ + @282 /* My agility. */ DO ~ReallyForceSpell(Player1,HELL_GAIN_DEX) AddJournalEntry(@10020,QUEST_DONE)~ EXTERN O#ROSLIN b7.0
+ ~Global("O#BrynnlawEvil","GLOBAL",1)~ + @283 /* My health. */ DO ~ReallyForceSpell(Player1,HELL_GAIN_CON) AddJournalEntry(@10020,QUEST_DONE)~ EXTERN O#ROSLIN b7.0
+ ~!Global("O#BrynnlawEvil","GLOBAL",1)~ + @284 /* My mind. */ DO ~ReallyForceSpell(Player1,HELL_GAIN_INT) AddJournalEntry(@10019,QUEST_DONE)~ EXTERN O#ROSLIN b7.0
+ ~!Global("O#BrynnlawEvil","GLOBAL",1)~ + @285 /* My wisdom. */ DO ~ReallyForceSpell(Player1,HELL_GAIN_WIS) AddJournalEntry(@10019,QUEST_DONE)~ EXTERN O#ROSLIN b7.0
+ ~!Global("O#BrynnlawEvil","GLOBAL",1)~ + @286 /* My charm. */ DO ~ReallyForceSpell(Player1,HELL_GAIN_CHR) AddJournalEntry(@10019,QUEST_DONE)~ EXTERN O#ROSLIN b7.0

CHAIN O#ROSLIN b7.0
@287 /* Then receive the gift, and know that you are one step closer to your rebirth, Child of Bhaal. */
== O#DORA @288 /* Roslin! */
END
IF ~~ EXTERN O#ROSLIN b7.norm
IF ~Global("O#BrynnlawEvil","GLOBAL",1)~ EXTERN O#ROSLIN b7.evil

CHAIN O#ROSLIN b7.norm
@289 /* I feel... a little weak, but I'll get better. Everything is all right, Dora. Everything will be all right. */
END
IF ~~ EXTERN O#DORA b7.1

CHAIN O#ROSLIN b7.evil
@290 /* I... */
DO ~ActionOverride("O#Roslin",Kill(Myself))~
== O#DORA @291 /* You live, Child of Bhaal. It seems you've gotten what you wanted. Roslin lies dead, and you barely care. */
= @292 /* Your captain probably waits for you in the harbor. As for me... I hope we'll never meet again, Bhaalspawn, or I'll greet you with a blade between your eyes. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",33)
AddJournalEntry(@10021,QUEST)
EscapeArea()~
EXIT

CHAIN O#DORA b7.1
@293 /* I'm... relieved. I'm so relieved, you have no idea. And Brynnlaw is free: Cowled Wizards rule Spellhold no more. This is... astonishing. */
== O#ROSLIN @294 /* Although some things will have to change, I hope. */
== O#DORA @295 /* They will. */
== O#ROSLIN @296 /* Then it is time for us all to leave this place, before my strength fails me entirely. Brace yourselves. */
DO ~AddJournalEntry(@10021,QUEST)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#Bryn9")~
EXIT

/* =============================================================== 

		MAIN QUEST: GOODBYES

   =============================================================== */

// Roslin and Dora, back in Brynnlaw, after teleportation

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",32)~ THEN O#ROSLIN b8.0
@823 /* Well. It was quite an adventure, I'd say. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",33)~
== O#DORA @824 /* Seconded. */
END
++ @825 EXTERN O#ROSLIN b8.00 /* Thirded. */ 
++ @826 EXTERN O#DORA b8.1 /* It could be longer. Better. With bigger rewards. You know the drill. */ 
++ @827 EXTERN O#DORA b8.2 /* Are you two going to be all right now? */ 

CHAIN O#DORA b8.1
@828 /* If you don't like the rewards, you can always share. I wouldn't say no to a pair of nice bracers. An ioun stone would come handy, too. Kidding. */
END
IF ~~ EXTERN O#ROSLIN b8.00

CHAIN O#DORA b8.2
@829 /* If we were normal people, I'd say our relationship needed some mending. But Roslin's way too forgiving. So, yes, <CHARNAME>. We are going to be all right. */
END
IF ~~ EXTERN O#ROSLIN b8.00

CHAIN O#ROSLIN b8.00
@830 /* <CHARNAME>, I will gladly see you off at the harbor, but first I need to check Dora's condition. There's an Ilmater's shrine nearby. */
== O#DORA @831 /* I'm fine! You should visit a cleric, yourself. I need to see my people. */
== O#ROSLIN @832 /* And I need to be sure that you are all right. Come on, do it for me. */
== O#DORA @833 /* (sigh) In the name of Mystra... All right. But only a short visit. */
== IMOeN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @846 /* That was sweet. Kind of like Puffguts and me in Candlekeep, no? Or you and Gorion... */
== O#DORA @834 /* And... thank you, <CHARNAME>. For saving Roslin and me. For everything. */
END
++ @835 EXTERN O#DORA b8.3 /* You're welcome. Take care of your soul. */
++ @836 EXTERN O#DORA b8.3 /* Stop killing people, and we'll be even. */
++ @837 EXTERN O#DORA b8.3 /* Just be careful around guys like Berlin next time. */

CHAIN O#DORA b8.3
@838 /* I will. After all, Roslin came for me, didn't he? I do not want to let him down. */
== O#ROSLIN @839 /* You never could. Come, the healer awaits. I shall see you soon, <CHARNAME>. */
== O#DORA @840 /* Goodbye, Child of Bhaal. Thank you. */
DO ~ActionOverride("O#Roslin",ApplySpell(Myself,DRYAD_TELEPORT))
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

// Roslin, back in Brynnlaw, near the ship

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",33) Global("O#BrynnRoslinGoodbye","GLOBAL",0)~ THEN O#ROSLIN b8
@297 /* Time for a short goodbye, I believe. I hope your return journey will be swift. */
END
++ @298 /* I'm glad I came. */ EXTERN O#ROSLIN b8.1
++ @299 /* Same to you. */ EXTERN O#ROSLIN b8.1
++ @300 /* Where's Dora? */ EXTERN O#ROSLIN b8.1

CHAIN O#ROSLIN b8.1
@301 /* Dora's with her men. She says they are going to become a true force for good. That is, they're going to stop killing everyone... probably. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @302 /* That's nice. So... Brynnlaw is going to return back to normal? */
== O#ROSLIN @303 /* Dora mentioned that they are going to remain an *effective* force, so I wouldn't attempt engaging in any criminal activities while you're here. */
== O#ROSLIN @304 /* By the way, Dora asked you to punch Irenicus for her. Double the number for me, if you can. */
== O#ROSLIN @305 /* Again, good luck. I hope your soul returns to you very soon. After all, how can it not? You're the hero. */
DO ~SetGlobal("O#BrynnRoslinGoodbye","GLOBAL",1)~
EXIT

CHAIN IF ~Global("O#BrynnRoslinGoodbye","GLOBAL",1)~ THEN O#ROSLIN b8
@306 /* Goodbye, <CHARNAME>. */
EXIT

// Jeremy, return to Athkatla

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",33)~ THEN O#JEREMY j5
@307 /* So, you're ready to head home? */
END
++ @308 /* Why not? Villains slain, maidens rescued, rewards reaped! */ EXTERN O#JEREMY j5.1
++ @309 /* Sure. */ EXTERN O#JEREMY j5.1
++ @59 /* Not yet. */ EXIT

CHAIN O#JEREMY j5.1
@310 /* Get on board, then. And... hey. It's a great job you've done. Brynnlaw is going to become a lot more peaceful now. Maybe we'll even do some honest trade. */
= @311 /* But anyone who's going to puke in my cabin will go straight overboard, is that clear? Set sail! */
DO ~EraseJournalEntry(@10021)
EraseJournalEntry(@10024)
EraseJournalEntry(@10026)
EraseJournalEntry(@10027)
EraseJournalEntry(@10029)
EraseJournalEntry(@10031)
EraseJournalEntry(@10033)
EraseJournalEntry(@10035)
EraseJournalEntry(@10037)
EraseJournalEntry(@10038)
EraseJournalEntry(@10040)
EraseJournalEntry(@10041)
EraseJournalEntry(@10086)
EraseJournalEntry(@10088)
AddJournalEntry(@10022,QUEST_DONE)
SetGlobal("O#BrynnQuest","GLOBAL",34)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#Bryn6")~
EXIT

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",34)~ THEN O#JEREMY j6
@312 /* The journey's over. I think I'll stick here for a while. Good luck to you, wherever you're going. */
DO ~SetGlobal("O#BrynnQuest","GLOBAL",35)~
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @313 /* Thanks! It... was a good adventure, wasn't it? I'm glad we came back safely. */
== O#JEREMY @314 /* Take care. But I probably need to say that to your enemies instead. Heh. See you sometime. */
EXIT

CHAIN IF ~Global("O#BrynnQuest","GLOBAL",35)~ THEN O#JEREMY j7
@315 /* Hey there. The seas are calm. Good time for another voyage, eh? Not today, though. */
EXIT

/* =============================================================== 

		SUBQUEST 1: SION AND KETTA

   =============================================================== */

// Sion and Ketta

CHAIN IF ~True()~ THEN O#KETTA k2
@316 /* Not me, dear. Talk to Sion. Today he calls the shots. */
EXIT

CHAIN IF ~Global("O#BrynnSion","GLOBAL",0)~ THEN O#SION s1
@317 /* A familiar face! My, but isn't it <CHARNAME> the Bhaalspawn? The one we were contracted to kill some time ago, eh, Ketta? */
DO ~SetGlobal("O#BrynnSion","GLOBAL",2)~
== O#KETTA @318 /* The very same. */
== O#SION @319 /* Interesting. So, I presume you're not here to break your head against the wall? State your business, then, and quickly. My fingers are itching for some death magic. */
== O#KETTA @320 /* Sion… wait. We could use <PRO_HIMHER>, don't you think? */
== O#SION @321 /* Hmm? Actually, yes. <CHARHAME>, will you sit down for a minute? */
END
+ ~OR(2) Dead("HLSion") Dead("HLKetta")~ + @322 /* You are Sion and Ketta from the Temple District, aren't you? Why aren't you dead? */ EXTERN O#SION s1.1
++ @323 /* What do you want? */ EXTERN O#SION s1.3
++ @324 /* I prefer to kill you instead. */ EXTERN O#SION s1.2
++ @325 /* I need safe passage from this island. */ EXTERN O#SION s1.passage

CHAIN O#SION s1.passage
@326 /* We can talk about it later. Right now I have an interesting proposal for you. */
END
IF ~~ EXTERN O#SION s1.3

CHAIN O#SION s1.1
@327 /* <CHARNAME>, please! We've been killed so many times it's not even funny. */
== O#KETTA @328 /* And painful, too. Where *is* my invisibility potion supply, by the way? It cost me a small fortune. */
END
IF ~~ EXTERN O#SION s1.3

CHAIN O#SION s1.2
@329 /* And throw away a wonderful adventure? I thought folks like you welcomed danger, not shrank from it. */
== O#KETTA @330 /* Maybe <PRO_HESHE> is getting old… */
END
IF ~~ EXTERN O#SION s1.3

CHAIN O#SION s1.3
@331 /* Long ago there was an elven archmage by the name of Larrel. He had done many things: been cursed by the elven gods themselves, raised armies and wove intricate spells, became a lich... */
DO ~AddJournalEntry(@10024,QUEST)~
== O#KETTA @332 /* But it's no concern of yours. What matters is that he created an astrolabe with incredible aquamarine lenses. And we're going to recreate his work. */
END
IF ~~ EXTERN O#SION s1.3a

CHAIN O#SION s1.3a
@333 /* To make the new lens, we need four pieces of the finest aquamarine in Brynnlaw. I know at least one is in Spellhold, one is in Perth's former home, and two are in the docks. Will you bring us all four? Three thousand gold is meager pay, but I'm sure you'll find other things that will make your trip worthwhile. */
END
+ ~ NumItemsPartyGT("MISC33",3)~ + @334 /* I have all the pieces already. */ EXTERN O#SION s2.0
++ @335 /* All right, I can do that. */ EXTERN O#KETTA s1.7
++ @336 /* I don't want to run errands for you. */ EXTERN O#KETTA s1.5

CHAIN O#KETTA s1.5
@337 /* A pity. Do we kill <PRO_HIMHER> now? */
== O#SION @338 /* Not yet, dear. <CHARNAME>, if you change your mind, you know where to find us. I trust you will find the way out? */
EXIT

CHAIN O#KETTA s1.7
@339 /* Good luck. Oh, and watch out for fireballs, will you? I'd hate your backside to get fried. */
EXIT

CHAIN IF ~Global("O#BrynnSion","GLOBAL",2)~ THEN O#SION s2
@340 /* <CHARNAME>, I needn't remind you that we are a little busy today. Do you have four pieces of aquamarine? */
END
+ ~NumItemsPartyGT("MISC33",3)~  + @341 /* I do, all of them. */ EXTERN O#SION s2.0
++ @342 /* Not all of them. */ EXTERN O#SION s2.1
++ @343 /* What do I do again? */ EXTERN O#SION s1.3a
++ @344 /* Actually, I need safe passage from this island. */ EXTERN O#SION s3.ready
++ @345 /* Never mind. */ EXTERN O#SION s2.2

CHAIN O#SION s2.1
@346 /* Thank you for trying, truly, but find the rest. We need all four. */
EXIT

CHAIN O#SION s2.2
@347 /* Thank you for wasting our time. That will be all, I hope? */
EXIT

CHAIN O#SION s2.0
@348 /* Let me see… Excellent! I must say, I am amazed. */
== O#SION @349 /* And here is your gold. Well done. If you need us for anything else, <CHARNAME>, feel free to come back. Agreed? */
DO ~EraseJournalEntry(@10024)
AddJournalEntry(@10025,QUEST_DONE)
TakePartyItem("MISC33")
TakePartyItem("MISC33")
TakePartyItem("MISC33")
TakePartyItem("MISC33")
GiveGoldForce(3000)
AddExperienceParty(55000)
SetGlobal("O#BrynnSion","GLOBAL",3)~
END
++ @350 /* Goodbye, then. */ EXTERN O#SION s2.3
++ @351 /* We'll see. */ EXTERN O#SION s2.3

CHAIN O#SION s2.3
@352 /* See you around. */
EXIT

CHAIN IF ~Global("O#BrynnSion","GLOBAL",3)~ THEN O#SION s3
@353 /* What is it you need now, <CHARNAME>? */
END
++ @325 /* I need safe passage from this island. */ EXTERN O#SION s3.ready
++ @354 /* Nothing yet. */ EXTERN O#SION s2.2

CHAIN O#SION s3.ready
@355 /* Indeed? Well, then, I see no reason not to help our good dear friend <CHARNAME>. Do you, Ketta? */
== O#KETTA @356 /* Me? Oh, certainly. Aside from... mmm... a few accidents. */
== O#SION @357 /* Are you sure, <CHARNAME>? It's not like you'll be able to return. */
END
++ @358 /* Let me think about this. */ EXTERN O#SION s2.3
++ @359 /* I am sure. */ EXTERN O#SION s3.yes

CHAIN O#SION s3.yes
@360 /* Well, then. Not like we have much else to do here. Ready, Ketta? */
== O#KETTA @361 /* Always, my pet. */
== O#SION @362 /* Hold tight, everyone! Next stop, Athkatla! */
DO ~AddJournalEntry(@10023,QUEST_DONE)
EraseJournalEntry(@10015)
EraseJournalEntry(@10016)
EraseJournalEntry(@10017)
EraseJournalEntry(@10021)
EraseJournalEntry(@10024)
EraseJournalEntry(@10026)
EraseJournalEntry(@10027)
EraseJournalEntry(@10029)
EraseJournalEntry(@10031)
EraseJournalEntry(@10033)
EraseJournalEntry(@10035)
EraseJournalEntry(@10037)
EraseJournalEntry(@10038)
EraseJournalEntry(@10040)
EraseJournalEntry(@10041)
EraseJournalEntry(@10086)
EraseJournalEntry(@10088)
SetGlobal("O#BrynnSion","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#Bryn7")~
EXIT

CHAIN IF ~Global("O#BrynnSion","GLOBAL",4)~ THEN O#SION s6
@363 /* This is it. Good luck, Bhaalspawn. And I'd stay away from certain inhabited buildings if I were you. */
END
++ @364 /* I will take your position into consideration. */ EXTERN O#SION s6.1
++ @365 /* Yes, yes, whatever. */ EXTERN O#SION s6.1
++ @366 /* Where are you two going? */ EXTERN O#SION s6.1

CHAIN O#SION s6.1
@367 /* Hmm, let me think. To Neverwinter now? */
== O#KETTA @368 /* Of course. */
== O#SION @369 /* Be seeing you! */
DO ~SetGlobal("O#BrynnSion","GLOBAL",5)
ActionOverride("O#KETTA",ApplySpell(Myself,DRYAD_TELEPORT))
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

/* =============================================================== 

		SUBQUEST 2: FATHER GONI

   =============================================================== */

// Father Goni, gnome

CHAIN IF ~Global("O#BrynnGoni","GLOBAL",0)~ THEN O#GONI g1
@370 /* Hello, young <PRO_MANWOMAN>. I am Father Goni. Welcome to Loviatar's shrine. */
END
++ @371 /* I do not see a shrine. */ EXTERN O#GONI g1.1
++ @372 /* Loviatar?! The Maiden of Pain? */ EXTERN O#GONI g1.2
++ @373 /* What are you doing here? */ EXTERN O#GONI g1.3

CHAIN O#GONI g1.1
@374 /* Well... it isn't here. But it could be, and, were you my disciple, I would lay you down on it and whip you well and proper! */
END
IF ~~ EXTERN O#GONI g1.3

CHAIN O#GONI g1.2
@375 /* Some say she's not really a maiden these days, eh? But don't tell her I said that! */
END
IF ~~ EXTERN O#GONI g1.3

CHAIN O#GONI g1.3
@376 /* (sigh) Look, you seem a clever person. Have you seen this island? Madness everywhere, Cowled Wizards seizing victims for their experiments, Dora's blades killing 'bad people' left and right... I want to get out of here. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @377 /* Sounds sensible. Huh, why is everybody trying to get out, and we're trying to get in? */
== O#GONI @378 /* And I'm not alone. See these beautiful maidens? You may be surprised, but the glorious path of whoredom, laden with drunk sailors, beatings and diseases does not appeal to them anymore. */
= @379 /* They've agreed to become disciples of Loviatar, and I'm taking them away. WOULD take them away, but I haven't got a ship. Mayhap you know some captain who needs a capable priest on board? */
END
++ @380 /* I'll ask around. */ EXTERN O#GONI g1.5
++ @381 /* There's a small ship in the docks... */ EXTERN O#GONI g1.5
++ @382 /* Why should I help you? Loviatar is not a benevolent deity. */ EXTERN O#GONI g1.6

CHAIN O#GONI g1.5
@383 /* Speak to the captain on our behalf, won't you? */
END
IF ~~ EXTERN O#GONI g1.6

CHAIN O#GONI g1.6
@384 /* We can help each other. Rumors spread fast: I know you're a Bhaalspawn, and a war of the gods is coming. Help us, and maybe the Maiden of Pain could distract Cyric when he's looking your way. And he's an attentive guy, I give him that. */
DO ~SetGlobal("O#BrynnGoni","GLOBAL",1)
AddJournalEntry(@10026,QUEST)~
EXIT

// Goni's apprentices

CHAIN IF ~RandomNum(3,1)~ THEN O#GONIW1 g1
@385 /* I feel pain. But it no longer bothers me. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#GONIW1 g2
@386 /* It's hard to lie with men. They hurt you. Now, with the goddess on my side, I will hurt them. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#GONIW1 g3
@387 /* I had a child, once. Maybe she's still alive, I don't know. Do you think she remembers me? */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#GONIW2 g1
@388 /* Have you ever felt pain? True pain? It makes you feel dirty, strong, and alive. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#GONIW2 g2
@389 /* I don't want to be a whore any longer. Father Goni says I'll be a princess. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#GONIW2 g3
@390 /* Loviatar loves me, and I shall deal out punishment in Her name, for I am worthy. */
EXIT

// Goni's captain

CHAIN IF ~OR(2) !Global("O#BrynnGoni","GLOBAL",1) Global("O#BrynnGoniGo","GLOBAL",2)~ THEN O#GONICA c1
@391 /* The seas are sure rough this time of year. */ 
EXIT

CHAIN IF ~Global("O#BrynnGoni","GLOBAL",1) Global("O#BrynnGoniGo","GLOBAL",0)~ THEN O#GONICA c2
@392 /* Nothing like some time ashore... all I need is some grog and a good lass on my lap. What? */ 
END
++ @393 /* Erm, nothing. */ DO ~SetGlobal("O#BrynnGoniGo","GLOBAL",1)~ EXTERN O#GONICA c2.no
++ @394 /* Actually, there's a gnome priest with two female apprentices that really need your help to get off this island. */ DO ~SetGlobal("O#BrynnGoniGo","GLOBAL",1)~ EXTERN O#GONICA c2.2

CHAIN O#GONICA c2.2
@395 /* Hah! A priest, eh? */
= @396 /* Wait... a gnome priest? You can't mean that Loviatar fellow! He's trouble, he is! And his 'apprentices' are damn whores! */
END
++ @397 /* Be it as it may, they've hurt no one, and just want to escape. */ EXTERN O#GONICA c2.3
++ @398 /* You have a ship, they need passage. Is anything wrong? */ EXTERN O#GONICA c2.3
++ @399 /* So what? */ EXTERN O#GONICA c2.3

CHAIN O#GONICA c2.3
@400 /* The Maiden of Pain is trouble. Just like you, Child of Bhaal. Yes, I know who you are, so you'd better clear out. I won't deal with that gnome, and that's my final word. */
END
+ ~PartyGoldGT(999)~ +  @401 /* Won't a thousand gold change your mind? */ DO ~TakePartyGold(1000)~ EXTERN O#GONICA c2.4
+ ~CheckStatGT(Player1,15,CHR)~ + @402 /* Come on, don't you think a priest can be a very welcome member of the crew? Trust me, these sahuagin ambushes can be very tricky. */ EXTERN O#GONICA c2.4
++ @403 /* Please? */ EXTERN O#GONICA c2.no
++ @404 /* All right. We'll speak later. */ EXTERN O#GONICA c2.no

CHAIN O#GONICA c2.no
@405 /* Shove off. */
EXIT

CHAIN O#GONICA c2.4
@406 /* Hmm. All right. I'll give that gnome a chance. But he'd better be the real deal! */
DO ~AddExperienceParty(15500)
AddJournalEntry(@10027,QUEST)
SetGlobal("O#BrynnGoniGo","GLOBAL",2)~
EXIT

CHAIN IF ~Global("O#BrynnGoni","GLOBAL",1) Global("O#BrynnGoniGo","GLOBAL",1)~ THEN O#GONICA c3
@407 /* You again. What? Is it about the gnome? I told you, I'm not dealing with you godly types. Bhaalspawn, Loviatar's clergy, Cyric's madmen... you're all the same to me. */
END
++ @408 /* Won't you reconsider? */ EXTERN O#GONICA c2.3
++ @409 /* All right, I'll leave you alone. */ EXTERN O#GONICA c2.no

// Goni, back

CHAIN IF ~Global("O#BrynnGoni","GLOBAL",1)~ THEN O#GONI g2
@410 /* Ah, my good and dear friend! The Maiden of Pain welcomes you back! */
= @411 /* You know, they say she and the Lady of Pain are distant cousins. Then there was this story about a turnip and a hairpin... All right, all right, I see you are not paying attention. So, do you have any news? */
END
+ ~Global("O#BrynnGoniGo","GLOBAL",2)~ + @412 /* I have, actually. Captain Rivers will take you in. */ EXTERN O#GONI g2.1
++ @59 /* Not yet. */ EXIT
++ @345 /* Never mind. */ EXIT

CHAIN O#GONI g2.1
@413 /* Glorious news! Come, my panthers! Let us make Loviatar's teaching shine! If somebody asks you for a backrub, you know what to do. */
DO ~EraseJournalEntry(@10026)
EraseJournalEntry(@10027)
AddJournalEntry(@10028,QUEST_DONE)
SetGlobal("O#BrynnGoni","GLOBAL",2)
AddExperienceParty(22500)
ActionOverride("O#GONIW1",EscapeArea())
ActionOverride("O#GONIW2",EscapeArea())
ActionOverride("O#GONICA",EscapeArea())
EscapeArea()~
EXIT

/* =============================================================== 

		SUBQUEST 3: DIARY

   =============================================================== */

// Tavern

CHAIN IF ~Global("O#BrynnAlia","GLOBAL",0)~ THEN O#ALIA a1
@414 /* (This woman definitely looks sick. Her clothes are in disarray, her eyes are puffed and red, and she keeps touching a plain golden ring on her finger.) */ 
END
++ @415 /* Hello. Can I help you? */ EXTERN O#ALIA a1.1
++ @416 /* (Leave the woman alone) */ EXIT

CHAIN O#ALIA a1.1
@417 /* (She raises her head, and her eyes suddenly light up.) */
DO ~SetGlobal("O#BrynnAlia","GLOBAL",1)~
= @418 /* You are <CHARNAME>. The one who s-stopped a war in the north! */
END
++ @419 /* I am, but I am hardly a hero. */ EXTERN O#ALIA a1.2
++ @420 /* Yes, I am <CHARNAME>. */ EXTERN O#ALIA a1.2
++ @421 /* How do you know this? */ EXTERN O#ALIA a1.2
++ @422 /* What do you want, woman? */ EXTERN O#ALIA a1.2

CHAIN O#ALIA a1.2
@423 /* I recognized you. When my husband was still alive, we lived in Baldur's Gate, across the street from the palace. Paul earned good money then... */
DO ~AddJournalEntry(@10029,QUEST)~
= @424 /* My name is Alia. My husband died, you see. Died in Spellhold, like so many others. */
= @425 /* I... I tried to go there, but the entrance was blocked. They told me they dumped my husband's body to the sea and then they shoved me away. I wanted to see his cell, to see if... if he let anything behind, but they did not let me. */
== O#ALIA @426 /* Please, help me! I have some money... not much, but I will give it to you, if only you go to Spellhold and bring me his things. At least find his diary! Paul... his last thoughts were important to me. */
= @427 /* (She starts crying.) I am sorry. I am so alone now, and I do not know anyone to turn to. */
END
+ ~PartyHasItem("O#BrynnD")~ + @428 /* I have his diary right here. */ EXTERN O#ALIA a2.2
+ ~PartyHasItem("O#BrynnD")~ + @429 /* I've read his diary, and I don't like what it about you. */ EXTERN O#ALIA a2.2a
++ @430 /* I will help you. But how am I to get inside Spellhold? */ EXTERN O#ALIA a1.3
++ @431 /* I understand. I will do my best. */ EXTERN O#ALIA a1.3a
++ @432 /* Sorry, I do not have time for this. */ EXTERN O#ALIA a1.4

CHAIN O#ALIA a1.3
@433 /* I... I do not know. But you stopped a war! Surely... surely there is a way? */
END
IF ~~ EXTERN O#ALIA a1.3a

CHAIN O#ALIA a1.3a
@434 /* Please! I lost my husband, at least let me have something! You are my only hope. */
EXIT

CHAIN O#ALIA a1.4
@435 /* But... all right. I understand. If you find his journal, though, I will wait here. */
EXIT

CHAIN IF ~Global("O#BrynnAlia","GLOBAL",1)~ THEN O#ALIA a2
@436 /* Do you have it? Have you found his diary? */
END
+ ~PartyHasItem("O#BrynnD")~ + @437 /* I have. Here it is. */ EXTERN O#ALIA a2.2
+ ~PartyHasItem("O#BrynnD")~ + @438 /* Yes, I have. Paul had quite a few things to say about you. */ EXTERN O#ALIA a2.2a
++ @439 /* Not yet, Alia. */ EXTERN O#ALIA a2.1

CHAIN O#ALIA a2.1
@440 /* (sigh) I see. Thank you for your efforts. */
EXIT

CHAIN O#ALIA a2.2
@441 /* Ah, here it is! Oh, excellent! And the deed for the house is still inside! */
DO ~TakePartyItem("O#BrynnD")~
= @442 /* Now Paul's house is mine! Eighty thousand gold! It was worth a trip to this place, wasn't it? Hahaha! Oh, I feel so sensual and rich now, you have no idea! */
= @443 /* You've never read the diary and never noticed the deed to the house within? Poor dear. I indeed tried to poison my husband to inherit his house and his money. And now, at long last, both are mine! */
= @444 /* As for you... You see, Paul was a mage. And I am a very good sorceress. */
END
++ @445 /* So much for "desperate widow" act. */ EXTERN O#ALIA a2.3
++ @446 /* And you intend to kill me now. */ EXTERN O#ALIA a2.3
++ @447 /* Do your worst. */ EXTERN O#ALIA a2.3

CHAIN O#ALIA a2.2a
@448 /* Did... did he? You do not mean to say that *he* went insane in that horrible place, too? Oh... */
END
++ @449 /* I am sorry, Alia. Take the diary. */ EXTERN O#ALIA a2.2
++ @450 /* I do not trust you. I still think you betrayed your husband. */ EXTERN O#ALIA a2.3a

CHAIN O#ALIA a2.3a
@451 /* (sigh) And you would be right. Paul's house costs eighty thousand gold. This kind of money deserves some betrayal, doesn't it? */
END
++ @445 /* So much for "desperate widow" act. */ EXTERN O#ALIA a2.3
++ @452 /* I am not giving you the book back. */ EXTERN O#ALIA a2.4a
++ @453 /* What are you going to do now? */ EXTERN O#ALIA a2.4a

CHAIN O#ALIA a2.4a
@454 /* I think now is when our cooperation ends. Imprisonment has always been one of my favorite spells. Too bad for you I always have it memorized. */
END
IF ~~ EXTERN O#ALIA a2.3

CHAIN O#ALIA a2.3
@455 /* Everybody betrays everybody, <CHARNAME>. It is only a matter of time. */
DO ~EraseJournalEntry(@10029)
AddJournalEntry(@10030,QUEST_DONE)
AddExperienceParty(22500)
SetGlobal("O#BrynnAlia","GLOBAL",2)
Enemy()~
EXIT

/* =============================================================== 

		SUBQUEST 4: SLAVER

   =============================================================== */

// Tavern: a crazy mage asks you to help him transfer slaves

CHAIN IF ~Global("O#BrynnRevin","GLOBAL",0)~ THEN O#REVIN r1
@456 /* Looks like the end of the world is near. Mages are taking over, pirates fleeing, whores on the streets in broad daylight... ah, what would the boys say? My sweet little boys... */
END
++ @345 /* Never mind. */ EXIT
++ @457 /* Excuse me, I've got to go. I have a rule of not trying to talk to crazy people. Doesn't work so well, though. */ EXIT
++ @458 /* Which boys are you talking about? */ EXTERN O#REVIN r1.1

CHAIN O#REVIN r1.1
@459 /* Ah, you should not expect to see good types here, my good <MANWOMAN>. There are no good people here at all. Only good old Revin, heh heh. */
DO ~SetGlobal("O#BrynnRevin","GLOBAL",1)~
= @460 /* Listen here. Listen! Do not leave. I have a task for you. A nice, pretty, shiny task. */
= @461 /* Revin deals in slaves. Young boys, yes, young and pretty. Not cheap, no! Thousands of gold, and twice as much for the willing ones. But the isle is dangerous. Sluts, cutpurses, ruffians... yes? */
== O#REVIN @462 /* I need a helping hand. Will you meet me at the docks? If the slavers see a powerful <PRO_MANWOMAN> with shiny weapons, they will not attack. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @463 /* (whisper) Let's pretend to help him. This way we'll free the boys! */
== O#REVIN @464 /* I can pay you much. Two, no, three thousand gold - if I get my pretty, willing, innocent boys. */
END
++ @465 /* You disgust me. No! */ EXTERN O#REVIN r1.2
++ @466 /* What is to stop me from killing you here and now, slaver? */ EXTERN O#REVIN r1.2
++ @467 /* These children must be freed! Tell me where you meet, and tell me at once! */ EXTERN O#REVIN r1.2
++ @468 /* Very well, you have a deal. */ EXTERN O#REVIN r1.3

CHAIN O#REVIN r1.2
@469 /* Ah, so impatient you are. Revin was a hero himself, long ago. Didn't pay well. */
= @470 /* You can walk away. Or you can kill me. But without Revin you will never find out about pretty, pretty boys, yes? */
= @471 /* Come with me. Come. You will not want to free them once you look into their eyes. Black Lotus empowers them. Makes them smile... makes them weep. They will not come with you. */
END
++ @472 /* You are mad. I will come with you and ensure that these children are freed and given proper care! */ EXTERN O#REVIN r1.4
++ @473 /* (lie) Of course. I will come to you and help you obtain your pretty, pretty boys. */ EXTERN O#REVIN r1.3
++ @474 /* Very well, I will come with you. */ EXTERN O#REVIN r1.3
++ @475 /* Do you think I'll really help a slaver? */ EXTERN O#REVIN r1.4

CHAIN O#REVIN r1.3
@476 /* Good! Meet me down in the docks tonight, when it's dark and dangerous. Revin will be waiting. */
DO ~AddJournalEntry(@10031,QUEST)
SetGlobal("O#BrynnRevin","GLOBAL",2)
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

CHAIN O#REVIN r1.4
@477 /* Too impatient. No, Revin will not deal with you. */
DO ~ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

// Docks (slaver - barbarian, two archers)

CHAIN IF ~Global("O#BrynnRevin","GLOBAL",3) AreaCheck("O#1600")~ THEN O#REVIN r2
@478 /* You have come at last! Our friends are already here. WITHOUT MY SWEET BOYS! Where are they?  */
DO ~GiveItemCreate("scrl9d","O#REVIN",1,0,0) GiveItemCreate("scrl8w","O#REVIN",1,0,0)~
== O#REVINS @479 /* Damned nuisances fell ill. Two of my men died. Had to throw 'em all overboard. */
DO ~SetGlobal("O#BrynnRevin","GLOBAL",4)~
== O#REVIN @480 /* What? My... my poor boys. My poor, tender boys... No. It cannot be. It must be a joke, a cruel, cruel joke. */
== O#REVINS @481 /* (shrugs) Can't endanger the crew. So, where is my money? */
== O#REVIN @482 /* What? WHAT? Money? You demand money after... after killing my boys? */
== O#REVINS @483 /* Transfer fees. Commissions. The usual. */
END
++ @484 /* Did you really threw those children overboard? */ EXTERN O#REVINS r3.1
++ @485 /* You two deserve each other. */ EXTERN O#REVINS r3.1
++ @486 /* I cannot believe my own ears. */ EXTERN O#REVINS r3.1
++ @487 /* Stop it, you two! Where is MY money, hmm? */ EXTERN O#REVINS r3.1

CHAIN O#REVINS r3.1
@488 /* Eh? Who is this? */
== O#REVIN @489 /* My guard. */
END
++ @490 /* Damn right, and I demand gold for my services! */ EXTERN O#REVINS r3.2
++ @491 /* I have nothing to do with you! I would much rather kill you both!  */ EXTERN O#REVINS r3.2
++ @492 /* (remain silent) */ EXTERN O#REVINS r3.2

CHAIN O#REVINS r3.2
@493 /* I don't like the look of ye, <PRO_GIRLBOY>. Walk away and nobody gets hurt. */
END
++ @494 /* No. */ EXTERN O#REVINS r3.3
++ @495 /* Very well. */ EXTERN O#REVINS r3.4

CHAIN O#REVINS r3.3
@496 /* Too bad for you. I think I'll deal with your employer first. */
DO ~EraseJournalEntry(@10031)
AddJournalEntry(@10032,QUEST_DONE)
AddExperienceParty(22500)
ActionOverride("O#Revin",Kill(Myself))
ActionOverride("O#ReviS1",Enemy())
ActionOverride("O#ReviS2",Enemy())
ActionOverride("O#ReviS3",Enemy())
ActionOverride("O#ReviS4",Enemy())

Enemy()~
EXIT

CHAIN O#REVINS r3.4
@497 /* Wait, I changed my mind. Stand still... No, I think I'll deal with your employer first. */
DO ~EraseJournalEntry(@10031)
AddJournalEntry(@10032,QUEST_DONE)
AddExperienceParty(22500)
ActionOverride("O#Revin",Kill(Myself))
ActionOverride("O#ReviS1",Enemy())
ActionOverride("O#ReviS2",Enemy())
ActionOverride("O#ReviS3",Enemy())
ActionOverride("O#ReviS4",Enemy())
Enemy()~
EXIT

/* =============================================================== 

		SUBQUEST 5: WHORES

   =============================================================== */

// Kvas

CHAIN IF ~Global("O#BrynnKvas","GLOBAL",0)~ THEN O#KVAS k1
@498 /* You look like a fine mercenary looking for a fine job, my friend. I could offer you one. */
END
++ @499 /* Oh? */ EXTERN O#KVAS k1.1
++ @500 /* Tell me about it. */ EXTERN O#KVAS k1.1
++ @501 /* Not interested, thanks. */ EXTERN O#KVAS k1.2

CHAIN O#KVAS k1.1
@502 /* I am, for lack of a better word, a... procurer. There are six girls all over Brynnlaw that belong to ME. Their wages are my wages, their breasts are my breasts. And right now, these breasts need milking. */
= @503 /* Here's how it works. I'll give you a note saying you're my representative, and you'll go and collect money from all six. You can, of course, try to escape with the money, but you won't like the consequences. */
END
++ @504 /* Not my thing. */ EXTERN O#KVAS k1.2
++ @505 /* What's my reward? */ EXTERN O#KVAS k1.3
++ @506 /* Sounds like an easy task. */ EXTERN O#KVAS k1.3

CHAIN O#KVAS k1.2
@507 /* Come back if you change your mind. There might be a pair of magical boots involved. */
DO ~SetGlobal("O#BrynnKvas","GLOBAL",1)~
EXIT

CHAIN O#KVAS k1.3
@508 /* Bring the money to me, and I'll reward you with a lovely pair of magical boots. There was an old token mechanism in Spellhold maze, you see, and my nephew is now operating it. */
= @509 /* Here's the note. You'll find all my girls on the streets of Brynnlaw at night. Good luck! */
DO ~AddJournalEntry(@10033,QUEST)
GiveItemCreate("O#KVASN",Player1,1,0,0)
SetGlobal("O#BrynnKvas","GLOBAL",2)~
EXIT

CHAIN IF ~Global("O#BrynnKvas","GLOBAL",1)~ THEN O#KVAS k2
@510 /* Back again? Interested in the job now? */
END
++ @511 /* I might be. */ EXTERN O#KVAS k1.1
++ @59 /* Not yet. */ EXTERN O#KVAS k1.2

CHAIN IF ~Global("O#BrynnKvas","GLOBAL",2)~ THEN O#KVAS k3
@512 /* So, how about my money? */
END
++ @513 /* I'm not finished with the task yet. */ EXTERN O#KVAS k3.1
+ ~PartyGoldGT(2999) Global("O#BrynnKvasWhores","GLOBAL",6)~ + @514 /* Sure. Here you go. */ DO ~TakePartyGold(3000) AddExperienceParty(55000)~ EXTERN O#KVAS k3.2

CHAIN O#KVAS k3.1
@515 /* Be careful, my mercenary friend. I'll wait, but I won't wait forever. */
EXIT

CHAIN O#KVAS k3.2
@516 /* Three thousand gold, to the last coin! Good. You can keep the note, by the way. Or burn it, I don't care. Just don't dump it somewhere where anyone can see how much I'm worth. */
DO ~EraseJournalEntry(@10033)
AddJournalEntry(@10034,QUEST_DONE)
GiveItemCreate("O#BRBOOT",Player1,1,0,0)
SetGlobal("O#BrynnKvas","GLOBAL",3)~
= @517 /* So, your reward, eh? Like I've said, I have a pair of magical boots for you. Wear them well. */
= @518 /* And now... now I really have to go to my wife and lovely daughters. Thankfully, they are good, obliging, shy young women. Not some slatterns whoring themselves, the shame! Upstanding citizens should do something about these whores, don't you think? */
DO ~EscapeArea()~
EXIT

// Kvas' whores

CHAIN IF ~OR(2) !Global("O#BrynnKvas","GLOBAL",2) Global("O#BrynnKvasDone","LOCALS",1) RandomNum(4,1)~ THEN O#KVASW w1
@519 /* Hey, sexy. Do ya wanna take a look at me diddeys? */ 
EXIT

CHAIN IF ~OR(2) !Global("O#BrynnKvas","GLOBAL",2) Global("O#BrynnKvasDone","LOCALS",1) RandomNum(4,2)~ THEN O#KVASW w2
@520 /* If ya wants to go strapping with this nab, you'll first have ta give up the socket money. */ 
EXIT

CHAIN IF ~OR(2) !Global("O#BrynnKvas","GLOBAL",2) Global("O#BrynnKvasDone","LOCALS",1) RandomNum(4,3)~ THEN O#KVASW w3
@521 /* I'm a fine lookin' strumpet, ain't I? */ 
EXIT

CHAIN IF ~OR(2) !Global("O#BrynnKvas","GLOBAL",2) Global("O#BrynnKvasDone","LOCALS",1) RandomNum(4,4)~ THEN O#KVASW w4
@522 /* Are you interested in some thrills, darling? */ 
EXIT

CHAIN IF ~Global("O#BrynnKvas","GLOBAL",2) Global("O#BrynnKvasDone","LOCALS",0)~ THEN O#KVASW w5
@523 /* Hello, darlin'. */ 
END
+ ~PartyHasItem("O#KVASN")~ + @524 /* I'm here to get money for Kvas. */ EXTERN O#KVASW w5.1
+ ~!PartyHasItem("O#KVASN")~ + @524 /* I'm here to get money for Kvas. */ EXTERN O#KVASW w5.2
+ ~Gender(Player1,MALE)~ + @525 /* How about some sweet and special time together? */ EXTERN O#KVASW w5.3
++ @345 /* Never mind. */ EXIT

CHAIN O#KVASW w5.1
@526 /* Ah, I see the note. Here you go, honey. */
DO ~GiveGoldForce(500)
IncrementGlobal("O#BrynnKvasWhores","GLOBAL",1)
SetGlobal("O#BrynnKvasDone","LOCALS",1)~
EXIT

CHAIN O#KVASW w5.2
@527 /* Do you have a note? You should show me a note from Kvas, honey. No note - no gold. */
EXIT

CHAIN O#KVASW w5.3
@528 /* Sorry, honey, but I'm waiting for a guy from Kvas. If I leave this spot, he'll skin me. */
EXIT

/* =============================================================== 

		SUBQUEST 6: PIRATES

   =============================================================== */

// Pirates

CHAIN IF ~RandomNum(3,1)~ THEN O#PIRAT1 p1
@529 /* Damned wizards. Damned winds. Damned weather. Damned everything. You - whatcha looking at? */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#PIRAT1 p2
@530 /* Gotta move faster. There's a storm coming. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#PIRAT1 p3
@531 /* Have you heard about Dora's band? This girl is going to get into serious trouble with the Cowled Wizards, mark my words. */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#PIRAT2 p1
@532 /* What? Can't you see I'm busy? */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#PIRAT2 p2
@533 /* We are leaving this wretched isle. Desharik is dead. Now Cowled Wizards call the shots. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#PIRAT2 p3
@534 /* You don't want to find yourself face-to-face with that Dora slut. She's got two wicked blades and a mean temper. */
EXIT

// Captain Woll

CHAIN IF ~Global("O#BrynnWoll","GLOBAL",0)~ THEN O#WOLL w1
@535 /* You. Bhaalspawn. What do you want? */
END
++ @536 /* What are you doing? */ EXTERN O#WOLL w1.1
++ @537 /* Have we met before? */ EXTERN O#WOLL w1.2
++ @538 /* Where are all other ships? */ EXTERN O#WOLL w1.3

CHAIN O#WOLL w1.1
@539 /* Getting away from the Cowled Wizards. When you left the island, they killed many of our number, and there's Dora with her crazy band. I have no desire to become next. They've given us a few more days: we load the cargo and leave. */
END
IF ~~ EXTERN O#WOLL w1.4

CHAIN O#WOLL w1.2
@540 /* I saw you when you arrived on Havarian's ship. I sure as hell hope you got what you wanted, because today this place is a magnet for scavengers. And most of them are mages, so honest steel does not have a chance. */
= @541 /* Not to say my men never tried. But this is not for you to know. Go away. */
END
IF ~~ EXTERN O#WOLL w1.4

CHAIN O#WOLL w1.3
@542 /* Far away from here, that's for sure! */
= @543 /* Last year, the wizards minded their own business. Today, they mind everybody else's. There's no way for us to stay. No way in the whole damned world. */
END
IF ~~ EXTERN O#WOLL w1.4

CHAIN O#WOLL w1.4
@544 /* Look... I'm sorry for being abrupt with you. We're going to set sail in a few hours, but there's a problem - my former first mate is trying to raise my own people against me. */
DO ~SetGlobal("O#BrynnWoll","GLOBAL",1) AddJournalEntry(@10035,QUEST)~
== O#WOLL @545 /* He's over by Caiya's former house with his supporters. If you kill him, our problems are over, and I'll owe you a drink besides. Or something more substantial, if you prefer. Gold is always fine, I hear. */
END
++ @546 /* I'll think about it. */ EXTERN O#WOLL w1.5
++ @547 /* I'm not sure I like this idea. */ EXTERN O#WOLL w1.5
++ @548 /* Your former first mate is going to feed the sharks very soon. */ EXTERN O#WOLL w1.6

CHAIN O#WOLL w1.5
@549 /* You go and think about it. Nothing ventured, nothing gained, eh? */
EXIT

CHAIN O#WOLL w1.6
@550 /* That's the spirit! */
EXIT

CHAIN O#WOLL w1.7
@551 /* Hah! That's him, all right. Your reward is well-earned, I must say. Here. */
DO ~EraseJournalEntry(@10035)
AddJournalEntry(@10036,QUEST_DONE)
GiveItemCreate("MISC43",Player1,2,0,0)
GiveGoldForce(1500)
AddExperienceParty(30000)
SetGlobal("O#BrynnWoll","GLOBAL",2)~
== O#WOLL @552 /* We'll be setting sail soon. Fair winds to you, friend. */
EXIT

CHAIN IF ~Global("O#BrynnWoll","GLOBAL",1)~ THEN O#WOLL w2
@553 /* So, how's my first mate doing? Feeding crabs yet? */
END
++ @554 /* Not yet. Give me some time. */ EXIT
+ ~Dead("O#WollFM")~ + @555 /* I met some son of a bitch who yelled about stealing my head and cutting off your ship. Or was it another way around? */ EXTERN O#WOLL w1.7

CHAIN IF ~Global("O#BrynnWoll","GLOBAL",2)~ THEN O#WOLL w3
@556 /* Thank you for getting rid of my rotten first mate. Fair winds to you, friend. And take care. */
EXIT

/* =============================================================== 

		SUBQUEST 7: GRANDCHILD'S GHOST

   =============================================================== */

// Beggar-grandfather

CHAIN IF ~Global("O#BrynnGrandfather","GLOBAL",0)~ THEN O#GHOSTG g1
@557 /* Please, won't you help me, my <PRO_LADYLORD>? I've lost all hope... */ 
END
++ @558 /* What ails you, good man? */ EXTERN O#GHOSTG g1.1
++ @559 /* Are you all right? */ EXTERN O#GHOSTG g1.1

CHAIN O#GHOSTG g1.1
@560 /* The Cowled Wizards took my grandchild, Monroe. He is my only family... I sold my house and bought passage here, but the wizards refused to let me in to see the boy, and now I'm begging on the streets. */
== O#GHOSTG @561 /* Please, my <PRO_LADYLORD>, would you go to Spellhold and find out if my boy lives? I... I cannot go on without knowing. */
DO ~AddJournalEntry(@10037,QUEST) SetGlobal("O#BrynnGrandfather","GLOBAL",1)~
END
+ ~Global("O#BrynnGhost","GLOBAL",1)~ + @562 /* I've seen your grandchild. He's become a ghost. */ EXTERN O#GHOSTG g2.1
++ @563 /* I do what I can. */ EXTERN O#GHOSTG g1.2
++ @564 /* Maybe. I can't promise anything. */ EXTERN O#GHOSTG g1.2
++ @565 /* Are you crazy? You're sending me to Spellhold, of all places! */ EXTERN O#GHOSTG g1.2

CHAIN O#GHOSTG g1.2
@566 /* You're stronger than anyone I have seen... If someone can force open the gates, it is you. */
= @567 /* Find my boy. I have one last family heirloom left... it is yours when you bring me the news. */
EXIT

CHAIN IF ~Global("O#BrynnGrandfather","GLOBAL",1)~ THEN O#GHOSTG g2
@568 /* Have you been to Spellhold and returned? Do you have any news of my grandchild? */
END
+ ~Global("O#BrynnGhost","GLOBAL",1)~ + @569 /* Sorry, grandpa. The boy's a ghostly ghost. */ EXTERN O#GHOSTG g2.1
+ ~Global("O#BrynnGhost","GLOBAL",1)~ + @570 /* He became a ghost. I am sorry. */ EXTERN O#GHOSTG g2.1
++ @571 /* I haven't found anything yet. */ EXIT

CHAIN O#GHOSTG g2.1
@572 /* He is... a ghost? But... does it mean that he'll never know peace? Always wander the halls of Spellhold? Suffer for the... the whole eternity? */
DO ~AddExperienceParty(22500)
EraseJournalEntry(@10037)
EraseJournalEntry(@10038)
AddJournalEntry(@10039,QUEST_DONE)~
END
++ @573 /* He's a ghost in a haunted castle. He's having fun for the first time in his life. */ EXTERN O#GHOSTG g2.2
++ @574 /* Actually, he seeks knowledge and talks to the inhabitants of the past. He is at peace. */ EXTERN O#GHOSTG g2.2
++ @575 /* I do not know. But he did not seem unhappy. */ EXTERN O#GHOSTG g2.2

CHAIN O#GHOSTG g2.2
@576 /* I... I see. The halls of Spellhold have always been haunted, they say. Perhaps it is time for me to see my grandchild in earnest. I was afraid, but... if he still lives on, in a way, he needs me. And, ghost or no, he is family. I shall always love him. */
== O#GHOSTG @577 /* Thank you, my <PRO_LADYLORD>. May Ilmater's light shine on you. */
DO ~GiveItemCreate("O#BRGLOV",Player1,1,0,0)
EscapeArea()~
EXIT

// Boy ghost

CHAIN IF ~Global("O#BrynnGhost","GLOBAL",0)~ THEN O#GHOST g0
@578 /* Oh, hello. You must be Imoen's <PRO_BROTHERSISTER>. */
END
++ @579 /* How do you know that? */ EXTERN O#GHOST g0.1
++ @580 /* You've met Imoen? Here? */ EXTERN O#GHOST g0.1
++ @581 /* I am. Who are you? */ EXTERN O#GHOST g0.1

CHAIN O#GHOST g0.1
@582 /* I'm Monroe. The Cowled Wizards brought me here a year ago. They... hurt me, but it wasn't so bad. And then I died. */
== O#GHOST @583 /* I remember Imoen. She was very sad. Like something important was taken from her, but she didn't remember. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @584 /* I remember now. Don't worry about me. With a <PRO_BROTHERSISTER> like <CHARNAME>, I'll be all right. */
== O#GHOST @585 /* And I saw you coming here before. The Child of Bhaal. You were drugged and helpless, and your hand dangled from the stretcher. That leather man, Irenicus, didn't even want to strip you of your gear. He wasn't afraid of his sister's used playthings, he said. */
END
++ @586 /* That bastard. */ EXTERN O#GHOST g0.2
++ @587 /* What else do you remember? */ EXTERN O#GHOST g0.2

CHAIN O#GHOST g0.2
@588 /* I haven't seen much else. Now that I'm a ghost, I'm wandering this castle. It's great! It has floors and stairwells beyond counting, and they are so wonderful! */
= @589 /* And there are books I can read just by touching them, and other ghosts - they don't appear in front of the living, but they talk to me, and it's amazing! */
= @590 /* I wish my father and mother were alive... but they died when I was taken to Spellhold. They fought. The wizards said my parents shouldn't have fought. But they were my parents! Of course they had to fight for me! */
= @591 /* My grandfather should still be alive. I'll probably never see him again. That, and he'd be frightened of me. But I wish he knew I was all right. */
END
+ ~Global("O#BrynnGrandfather","GLOBAL",1)~ + @592 /* Actually, I've met him in Brynnlaw. I can tell him about you, if you want. */ EXTERN O#GHOST g0.3
+ ~Global("O#BrynnGrandfather","GLOBAL",1)~ + @593 /* He's alive. And he wanted to find you, only the Cowled Wizards didn't let him in. */ EXTERN O#GHOST g0.3
++ @594 /* I'm not sure where he is, boy, but he must be thinking of you, too. */ EXTERN O#GHOST g0.3
++ @595 /* I'll tell him if I find him. */ EXTERN O#GHOST g0.3

CHAIN O#GHOST g0.3
@596 /* Really? Oh! Maybe we'll see each other again! But even if we don't, please, please tell him that I'm happy. It sounds strange, I know, but it's peaceful here. And I'm not afraid any more. */
= @597 /* I... I should go. Be careful here, all right? Cowled Wizards aren't very friendly. */
DO ~AddJournalEntry(@10038,QUEST)
AddExperienceParty(15500)
SetGlobal("O#BrynnGhost","GLOBAL",1)
EscapeArea()~
EXIT

/* =============================================================== 

		SUBQUEST 8: BROTHEL'S PRISONER

   =============================================================== */

// Slava, Cania's house

CHAIN IF ~Global("O#BrynnGalvena","GLOBAL",0)~ THEN O#SLAVA s1
@598 /* Oh. I didn't know I had guests. I'm sorry, it's not very clean here - I didn't have any time - */
DO ~SetGlobal("O#BrynnGalvena","GLOBAL",1)~
== O#SLAVA @599 /* You... you're the Bhaalspawn, aren't you? I'm Slava, Caiya's niece. I've heard you help people in need. Would you... would you help me? */
END
++ @600 /* What is the problem? */ EXTERN O#SLAVA s1.1
++ @601 /* Depends on the reward. */ EXTERN O#SLAVA s1.1
++ @602 /* Somehow I'm not surprised... */ EXTERN O#SLAVA s1.1

CHAIN O#SLAVA s1.1
@603 /* It's my brother, Yasen. A powerful and rich woman, Lady Galvena, fell in love with him. But... she wasn't a very good woman. She owned a brothel and tortured people. And... and my brother didn't return her feelings. */
DO ~AddJournalEntry(@10040,QUEST)~
= @604 /* I thought she'd just leave him alone, but soon afterwards her men broke into our home and kidnapped him. I haven't heard from him since, but I believe he's kept in Lady Galvena's former brothel. There's a secret door behind the wall that leads to the dungeons. If you wait for long enough, you'll see it. */
= @605 /* I tried to enter the dungeon, myself, but some ruffians tore my dress and... well, I barely escaped. */
= @606 /* Please, will you bring me back my brother? He's probably sick, exhausted, they must be doing terrible things to him, and I... I'm helpless. I'll give you all the gold I have, I swear! */
END
++ @607 /* No need for that. I'll help your brother, Slava. */ EXTERN O#SLAVA s1.2
++ @608 /* I'll see what I can do. */ EXTERN O#SLAVA s1.2
++ @609 /* I don't like this. */ EXTERN O#SLAVA s1.3

CHAIN O#SLAVA s1.2
@610 /* Thank you. I shall wait here. */
EXIT

CHAIN O#SLAVA s1.3
@611 /* From what I know of my brother, Lady Galvena hasn't broken him. Not in that way. But she would torture him or deny him water, and he may die. And he's my only brother. */
= @612 /* Please... you're my only hope. */
EXIT

CHAIN IF ~Global("O#BrynnGalvena","GLOBAL",2)~ THEN O#SLAVA s2
@613 /* Thank you for saving my brother, truly! May the sun always shine on you! */
DO ~EraseJournalEntry(@10040)
EraseJournalEntry(@10041)
AddJournalEntry(@10042,QUEST_DONE)
SetGlobal("O#BrynnGalvena","GLOBAL",3)~
== O#SLAVA @614 /* Here is the reward I promised. I hope you'll find it useful on your travels. And good luck. */
DO ~AddExperienceParty(22500) 
GiveGoldForce(2500)~
EXIT

CHAIN IF ~!Global("O#BrynnGalvena","GLOBAL",2)~ THEN O#SLAVA s3
@615 /* Good luck on your travels. */
EXIT

// Galvena, brothel

CHAIN IF ~Global("O#BrynnGalvenaTort","GLOBAL",0)~ THEN O#GALVEN g1
@616 /* Look at this! <CHARNAME> with <PRO_HISHER> whores! A sight for sore eyes! */
DO ~SetGlobal("O#BrynnGalvenaTort","GLOBAL",1)~
== O#GALVEN @617 /* I thought you'd never dare come here! But the gossip was true. Not that it's important, but you've got me sweating and curious and hot and bothered. Why have you come? */
END
++ @618 /* Lady Galvena? Haven't we met before? */ EXTERN O#GALVEN g1.1
++ @619 /* Who are you and what are you doing in this dungeon? */ EXTERN O#GALVEN g1.3
+ ~Global("O#BrynnGalvena","GLOBAL",1)~ + @620 /* I'm here for Yasen, a boy you kidnapped. */ EXTERN O#GALVEN g1.2

CHAIN O#GALVEN g1.1
@621 /* Pah. So many people tried to kill me over the years that I've lost count. */
END
IF ~~ EXTERN O#GALVEN g1.3

CHAIN O#GALVEN g1.2
@622 /* That imbecile? Pah! We broke his legs and he still wouldn't break. A pretty boy, and a virgin, at that. */
= @623 /* (sigh) I could've made a fortune breaking him in. A pity. */
END
IF ~~ EXTERN O#GALVEN g1.3

CHAIN O#GALVEN g1.3
@624 /* Things have changed in Brynnlaw, you know. Once I was a woman of means, and now I'm hiding in my own dungeon with my last men, hiding from that slut Dora and her whelps. Bah! */
= @625 /* I suppose I could still change my standing. You are The Bhaalspawn, after all, and your head is worth a fortune to the Cowled Wizards. All I need is to cut it off. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @626 /* Don't even think about it. <CHARNAME> has won over the likes of you thrice over. */
== O#GALVEN @627 /* You may beg for mercy, though. I might change my mind once I see you on your knees. Come, tie my shoelaces. Lick my boots. I am waiting... */
= @628 /* No? Thought so. Well, then, time to break your kneecaps and slash your throat! */
DO ~ActionOverride("O#GALV1",Enemy())
ActionOverride("O#GALV2",Enemy())
Enemy()~
EXIT

// Yasen, brothel

CHAIN IF ~GlobalLT("O#BrynnGalvena","GLOBAL",2)~ THEN O#YASEN y1
@629 /* Who... who are you? */
END
+ ~Global("O#BrynnGalvena","GLOBAL",1)~ + @630 /* Your sister sent me, Yasen. */ EXTERN O#YASEN y1.1
+ ~Dead("O#Galven")~ + @631 /* Oh, I was just passing by, really. Saw Galvena, killed Galvena, found you. */ EXTERN O#YASEN y1.2
+ ~Dead("O#Galven")~ + @632 /* A person who just killed Lady Galvena. Again. */ EXTERN O#YASEN y1.2
++ @633 /* I'm <CHARNAME>. You are free now. */ EXTERN O#YASEN y1.3
++ @634 /* Does it matter? Not an enemy, I suppose. */ EXTERN O#YASEN y1.3

CHAIN O#YASEN y1.1
@635 /* Slava? I hoped... but then I've forgotten how to hope, it seems. */
END
IF ~~ EXTERN O#YASEN y1.3

CHAIN O#YASEN y1.2
@636 /* I shouldn't be happy about this announcement, I know, but... I'm relieved she won't come back. */
END
IF ~~ EXTERN O#YASEN y1.3

CHAIN O#YASEN y1.3
@637 /* You set me free, and I thank you. I... ah! Galvena's people broke my legs, and though she sent down a healer later, I can only hop, not walk. She didn't even bother locking my cell... Still, it is better than crawling. */
= @638 /* Again, I thank you. Please, come and visit us in our home. It's just up the hill. We'll be happy to reward you. */
DO ~SetGlobal("O#BrynnGalvena","GLOBAL",2)
AddJournalEntry(@10041,QUEST)
AddExperienceParty(15500)
EscapeArea()~
EXIT

CHAIN IF ~GlobalGT("O#BrynnGalvena","GLOBAL",1)~ THEN O#YASEN y2
@639 /* It is good to be home again. Thank you. */
EXIT

/* =============================================================== 

		MISC DIALOGUE

   =============================================================== */

// Shop

CHAIN IF ~Global("O#BRYNTTalked","GLOBAL",0)~ THEN O#BRYNT t1
@640 /* Hello, <CHARNAME>! The previous owner of this shop had a... nasty accident. I saved most of his wares, however. Do you want... to take a look? */
END
++ @641 /* Sure. Show me. */ DO ~SetGlobal("O#BRYNTTalked","GLOBAL",1) StartStore("ppstor01",LastTalkedToBy())~ EXIT
++ @642 /* Not this time. */ DO ~SetGlobal("O#BRYNTTalked","GLOBAL",1)~ EXTERN O#BRYNT t1.1

CHAIN O#BRYNT t1.1
@643 /* Your loss. */
EXIT

CHAIN IF ~Global("O#BRYNTTalked","GLOBAL",1)~ THEN O#BRYNT t2
@644 /* And hello again. Do you want to... take a look at my wares? Sell something, perhaps? My prices are quite fair. */
END
++ @645 /* I do. */ DO ~StartStore("ppstor01",LastTalkedToBy())~ EXIT
++ @646 /* Perhaps later. */ EXTERN O#BRYNT t1.1

// Barkeep 

CHAIN IF ~Global("O#BRYNBTalked","GLOBAL",0)~ THEN O#BRYNB b1
@647 /* Not you again! Please, keep your assassinations and soul-stealing to a minimum. By Umberlee's lush bottom, I don't want more trouble than I already have. */
END
++ @648 /* Show me your services. */ DO ~SetGlobal("O#BRYNBTalked","GLOBAL",1) StartStore("ppinn01",LastTalkedToBy())~ EXIT
++ @649 /* I wonder if you'd tell Irenicus the same? */ DO ~SetGlobal("O#BRYNBTalked","GLOBAL",1)~ EXTERN O#BRYNB b1.1
++ @345 /* Never mind. */ DO ~SetGlobal("O#BRYNBTalked","GLOBAL",1)~ EXTERN O#BRYNB b1.2

CHAIN O#BRYNB b1.1
@650 /* Are you kidding? I'd jump right out of the window. */
END
IF ~~ EXTERN O#BRYNB b1.2

CHAIN O#BRYNB b1.2
@651 /* All the same, please don't kill anyone. I've got few clients as is. */
EXIT

CHAIN IF ~Global("O#BRYNBTalked","GLOBAL",1)~ THEN O#BRYNB b2
@652 /* Looking for a place to stay? I hope not. */
END
++ @653 /* I am, actually. Show me what you have. */ DO ~StartStore("ppinn01",LastTalkedToBy())~ EXIT
++ @654 /* Maybe another time. */ EXTERN O#BRYNB b1.2

/* =============================================================== 

		IMOEN'S DIALOGUE

   =============================================================== */

APPEND IMOEN2J

// 1. Going to Brynnlaw

IF WEIGHT #-1 ~Global("O#BrynnImoen","GLOBAL",2)~ i1
SAY @655 /* Brynnlaw again. Somehow even the sea smells differently here. It makes me a little sad. */
++ @656 /* Why? */ + i1.1
++ @657 /* Does it remind you of Spellhold? */ + i1.2
++ @658 /* The sea makes me sad, too. */ + i1.3
END

IF ~~ i1.1
SAY @659 /* I think of Candlekeep, seagulls and warm stone. The way ships passed in the night, white sails billowing against a starry sky. The way you laughed, when you still hadn't known. When I hadn't known. */
= @660 /* But it's behind is, isn't it? We can never go home again. */
++ @661 /* We can make our own home, Imoen. */ + i1.5
++ @662 /* We're powerful now. You'll have your own guild or a castle if you want. */ + i1.4
++ @663 /* True. I miss our childhood days, too. */ + i1.5
END

IF ~~ i1.2
SAY @664 /* You can't actually smell the sea from Spellhold, only see it from the windows. Spellhold smells of electricity... magic... blood. No, I don't want to think about it. */
IF ~~ + i1.1
END

IF ~~ i1.3
SAY @665 /* Does it? I thought nothing rattles you. It's good to know. */
IF ~~ + i1.1
END

IF ~~ i1.4
SAY @666 /* Yeah... but I don't want it. Not really. Me, secretly ruling a thieves' guild? Imagine that! */
IF ~~ + i1.5
END

IF ~~ i1.5
SAY @667 /* I guess it doesn't matter if we have each other. We're family, wherever we are. And nobody can take our memories from us. Irenicus couldn't. */
= @668 /* I'm just hoping this girl, Dora, isn't beyond help yet. Irenicus... he can make you live in the darkness. I've almost forgotten you. */
++ @669 /* I remember. What matters is that you're all right now. */ + i1.6
++ @670 /* We'll help Dora. I promise. */ + i1.7
++ @671 /* Irenicus will pay for his crimes. */ + i1.8
END

IF ~~ i1.6
SAY @672 /* Am I? Sometimes I'm not so sure. */
IF ~~ + i1.9
END

IF ~~ i1.7
SAY @673 /* I'm glad you're not giving up on her. And that you haven't given up on me. */
IF ~~ + i1.9
END

IF ~~ i1.8
SAY @674 /* He will. Maybe I don't know mighty magic like he does, but together we'll beat him. No matter what. */
IF ~~ + i1.9
END

IF ~~ i1.9
SAY @675 /* I like the smell of the sea. It's beautiful. Let's just stand outside and enjoy it for a minute. */
IF ~~ DO ~SetGlobal("O#BrynnImoen","GLOBAL",3)~ EXIT
END

// 2. Inside Spellhold

IF WEIGHT #-1 ~Global("O#BrynnImoen","GLOBAL",4)~ i2
SAY @676 /* I... I kind of feel at home here. It's scary, isn't it? But I've gotten used to the routine. The cell... the food... even the people. */
++ @677 /* It does sound a little scary. */ + i2.1
++ @678 /* It's Irenicus' fault, not yours. */ + i2.1
++ @679 /* I know what you mean. You've spent a lot of time here. */ + i2.1
END

IF ~~ i2.1
SAY @680 /* I've spent days and nights here. Played cards with Tiax, learnt a cookie recipe from Dradeel, played hide and seek with Dili. */
= @681 /* And now it's all empty... everyone's gone. I remember dead bodies in the hall... Irenicus, stepping into the portal, and I want to scream. But it won't help, will it? */
++ @682 /* Try it. Maybe it does. */ + i2.2
++ @683 /* I don't know. */ + i2.3
++ @684 /* Probably not. */ + i2.3
END

IF ~~ i2.2
SAY @685 /* All right... */
= @686 /* AAAAAAAAAGH! */
= @687 /* Huh. Maybe a little. */
IF ~~ + i2.3
END

IF ~~ i2.3
SAY @688 /* A part of me wants to blast this place to smithereens. And another part wants to find my old cell and go to sleep. And wake up in Candlekeep, old Puffguts greeting me with fried cheese and eggs. And cookies. He had the best cookies in the world... */
= @689 /* Sorry. Candlekeep is different now, I know it. But I miss it all the same. */
++ @690 /* When all of this is over, we can go there together. */ + i2.4
++ @691 /* Yeah, me too. */ + i2.5
++ @692 /* I don't, but I understand how you feel. */ + i2.5
++ @693 /* I never liked it as much as you did. */ + i2.6
END

IF ~~ i2.4
SAY @694 /* I'd like that. You and me... maybe some others, too, if they want. */
IF ~~ + i2.5
END 

IF ~~ i2.5
SAY @695 /* You've always understood me better than myself. I'm glad that you're here with me. */
IF ~~ DO ~SetGlobal("O#BrynnImoen","GLOBAL",5)~ EXIT
END

IF ~~ i2.6
SAY @696 /* I know. But you were there for me just the same. */
IF ~~ + i2.5
END 

// 3. After the ritual's done or averted

IF WEIGHT #-1 ~Global("O#BrynnImoen","GLOBAL",6)~ i3
SAY @697 /* Spellhold. I remember standing in the tube, all alone. And Irenicus, speaking an incantation. Then... darkness. */
IF ~~ DO ~SetGlobal("O#BrynnImoen","GLOBAL",7)~ + i3.n
IF ~Global("O#BrynnlawEvil","GLOBAL",1)~ DO ~SetGlobal("O#BrynnImoen","GLOBAL",7)~ + i3.e
IF ~Global("O#BrynnlawGood","GLOBAL",1)~ DO ~SetGlobal("O#BrynnImoen","GLOBAL",7)~ + i3.g
END

IF ~~ i3.e
SAY @698 /* And now Roslin is dead, too, gone in exchange for a piece of your soul. Why, <CHARNAME>? I just feel so broken... I don't understand. */
++ @699 /* You don't have to. Let's just go. */ + i3.1
++ @700 /* I needed this piece of my soul, Imoen. */ + i3.1
++ @701 /* What's there to understand? He's dead, and I'm stronger for it. */ + i3.1
END

IF ~~ i3.g
SAY @702 /* I'm glad you didn't make Roslin sacrifice his own soul. Or life force. Whatever. I've always looked up to you, you know? It's good I can keep doing that. */
++ @703 /* I'm honored you feel this way. */ + i3.2
++ @704 /* Admiration sounds nice. I like cookies, too. */ + i3.2
++ @705 /* I'm glad, as well. It was a right choice. */ + i3.3
END

IF ~~ i3.n
SAY @706 /* I'm glad Roslin is okay. He sacrificed a lot for Dora and you. Just like you sacrificed a lot for me. */
++ @707 /* Those sacrifices were worth it, Imoen. I had to rescue you. */ + i3.3
++ @708 /* It had nothing to do with you. I needed to reach Irenicus. */ + i3.4
++ @709 /* Of course I came! I couldn't abandon you to Irenicus! */ + i3.3
END

IF ~~ i3.1
SAY @710 /* I know it's between you and him, but... It's not just your soul, <CHARNAME>. You didn't seem to care about Roslin's life at all! It looked scary, like someone replaced you with a doppelganger. */
= @711 /* I'll stick by you no matter what, but that really hit me. I just... don't want to talk about this anymore. */
IF ~~ EXIT
END 

IF ~~ i3.2
SAY @712 /* Oh, shush, you! */
IF ~~ + i3.5
END

IF ~~ i3.3
SAY @713 /* And I'm proud of you, big <PRO_BROTHERSISTER>. */
IF ~~ + i3.5
END

IF ~~ i3.4
SAY @714 /* All the same, I needed you, and you came. I'll never forget that. */
IF ~~ + i3.5
END

IF ~~ i3.5
SAY @715 /* Thank you. For rescuing me, for coming for me... for everything. I am really glad I met you at Candlekeep all those years ago. */
++ @716 /* Aww. Hugs? */ + i3.6
++ @717 /* ... You need something from me, don't you? */ + i3.7
++ @718 /* Look how well that turned out. Sarevok, Bodhi, Irenicus... */ + i3.8
END

IF ~~ i3.6
SAY @719 /* You betcha! */
IF ~~ + i3.9
END

IF ~~ i3.7
SAY @720 /* Tee-hee! Guess again! */
IF ~~ + i3.9
END

IF ~~ i3.8
SAY @721 /* And we're together again! Isn't it more important than a dozen of crazy mages? */
IF ~~ + i3.9
END

IF ~~ i3.9
SAY @722 /* Now let's leave Brynnlaw and never come back. Come on! Race you to the harbor? */
IF ~~ EXIT
END

END

/* =============================================================== 

		SUBQUEST 9: IRENE'S REVENGE

   =============================================================== */

// First talk

CHAIN IF ~Global("O#BrynnIrene","GLOBAL",0)~ THEN O#IRENE i1
@723 /* Don't touch me! */ 
DO ~SetGlobal("O#BrynnIrene","GLOBAL",1)~
== O#IRENE @724 /* Oh, it's you. I didn't recognize you at first. <CHARNAME>, isn't it? I'm Irene. */
END
++ @725 /* I recognize you. You were the messenger near the Adventurer's Mart. */ EXTERN O#IRENE i1.1
++ @726 /* Why did you just flinch? Did someone hurt you? */ EXTERN O#IRENE i1.2
++ @727 /* Nice to meet you. */ EXTERN O#IRENE i1.3

CHAIN O#IRENE i1.1
@728 /* So I was. Nice of you to remember. */
END
IF ~~ EXTERN O#IRENE i1.3

CHAIN O#IRENE i1.2
@729 /* Yes. That's why I'm here in Brynnlaw, in fact. */
END
IF ~~ EXTERN O#IRENE i1.3

CHAIN O#IRENE i1.3
@730 /* Roslin dragged you to the island, too, I see. He's good at offering people what they want. When he told me he was going to go against Berlin, I agreed to pass you the message without a second thought. */
= @731 /* Berlin is the head of the Cowled Wizards here in Spellhold, in case you're wondering. But you've probably met him. */
END
+ ~Dead("O#Berlin") !Dead("O#Berli1")~  + @732 /* Actually, we killed him. */ EXTERN O#IRENE i1.4
+ ~Dead("O#Berli1")~  + @732 /* Actually, we killed him. */ EXTERN O#IRENE i1.5
+ ~Dead("O#Berli1")~  + @733 /* Trust me, he's very dead. */ EXTERN O#IRENE i1.5
+ ~GlobalLT("O#BrynnQuest","GLOBAL",20)~  + @734 /* Of course. The bastard set his Cowled Wizards on me and teleported away. */ EXTERN O#IRENE i1.6
++ @735 /* I probably have, but I don't remember. Too many villains around. */ EXTERN O#IRENE i1.6

CHAIN O#IRENE i1.4
@736 /* No, you didn't. Trust me on this. Until you have searched his corpse for his unique ioun stone and found it, you can safely assume Berlin is very much alive. */
END
IF ~~ EXTERN O#IRENE i1.6

CHAIN O#IRENE i1.5
@737 /* No! I heard the rumor, but... did you really? Truly? */
== O#IRENE @738 /* You did, didn't you? Oh, this is a moment to remember for the ages! */
DO ~GiveItemCreate("scrl9q",Player1,1,0,0)
GiveItemCreate("scrl8o",Player1,1,0,0)
GiveGoldForce(5000)
AddExperienceParty(30000)
EraseJournalEntry(@10086)
AddJournalEntry(@10087,QUEST_DONE)
SetGlobal("O#BrynnIrene","GLOBAL",1)~
== O#IRENE @739 /* I am so, so grateful to you. Here. This is the best bounty I can offer. If you find it sufficient, good. If not, just sell the scrolls and become a little richer. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @740 /* Yay! Dibs on the chain contingency scroll! */
== O#IRENE @741 /* The bastard who tried to force me to do unspeakable things is gone. I can finally breathe freely... */
== O#IRENE @742 /* Thank you, <CHARNAME>. May we meet in better times. */
DO ~ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

CHAIN O#IRENE i1.6
@743 /* Berlin is a cunning son of a bitch. Other Cowled Wizards respect him well, but the apprentices... they are helpless before him, and Berlin can do whatever he likes to them. */
== O#IRENE @744 /* When I was a young girl, I had the misfortune of becoming his pupil. Berlin tried to enchant me on the second night. */
== O#IRENE @745 /* Luckily, I had an amulet on my breast, but it didn't help me much: he conjured a dagger out of thin air and shoved it up under my chin. I still remember that moment... */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @746 /* What a creep. We are going to do something about him, aren't we, <CHARNAME>? */
== O#IRENE @747 /* Never mind. I escaped his 'care' soon enough - my grandmother wasn't a Red Wizard for nothing. But I want him punished. I want Berlin dead. */
DO ~AddJournalEntry(@10086,QUEST)~
== O#IRENE @748 /* Sadly, I don't have the strength to kill him myself. The bastard uses magical doubles - simulacra or some such. Kill him, and he just rises again. But Berlin is not immortal. Would you be interested in disposing of him for me, <CHARNAME>? */
END
++ @749 /* Why not? I'll probably end up killing him anyway. */ EXTERN O#IRENE i1.8
++ @750 /* What do you mean, Berlin uses magical doubles? */ EXTERN O#IRENE i1.7
++ @751 /* Can't promise anything, but I'll remember your offer. */ EXTERN O#IRENE i1.8

CHAIN O#IRENE i1.7
@752 /* I don't know how he does it. You see his body on the ground, coins, slipping from his purse, his bloody robes, and you think you've won. And an hour later he just walks by, smiling. Trust me, I've seen that. */
END
IF ~~ EXTERN O#IRENE i1.8

CHAIN O#IRENE i1.8
@753 /* I would place a decent bounty on his head, and throw in a pair of expensive scrolls. */
= @754 /* Come back when you're done, but conduct yourself with care. I wouldn't want you to become yet another of his victims. */
EXIT

// Talk again

CHAIN IF ~Global("O#BrynnIrene","GLOBAL",1)~ THEN O#IRENE i2
@755 /* Ah, it's you again. How is our mutual friend? */ 
END
+ ~Dead("O#Berlin") !Dead("O#Berli1")~  + @756 /* Dead. Very dead. */ EXTERN O#IRENE i2.1
+ ~Dead("O#Berli1")~  + @756 /* Dead. Very dead. */ EXTERN O#IRENE i1.5
+ ~Dead("O#Berli1")~  + @757 /* I killed him. */ EXTERN O#IRENE i1.5
++ @758 /* He lives... for now. */ EXTERN O#IRENE i2.2
++ @759 /* No idea. I'll let you know if there's any progress. */ EXTERN O#IRENE i2.3

CHAIN O#IRENE i2.1
@760 /* I cannot sense his death with my instruments. I fear you've killed another magical double. I'm sorry, <CHARNAME>. */
EXIT

CHAIN O#IRENE i2.2
@761 /* I like this expression. 'For now'. It sounds so promising, doesn't it? */
EXIT

CHAIN O#IRENE i2.3
@762 /* Please do. Or you can just, you know, kill him. */
EXIT

/* =============================================================== 

		SUBQUEST 10: FOREL'S WAND

   =============================================================== */

// First talk

CHAIN IF ~Global("O#BrynnForel","GLOBAL",0)~ THEN O#FOREL f1
@763 /* Oh, hello. You're the Bhaalspawn everyone is hunting, aren't you? Just so you know, there's a bounty on your head. */ 
DO ~SetGlobal("O#BrynnForel","GLOBAL",1)~
END
++ @764 /* Are you going to claim this bounty? */ EXTERN O#FOREL f1.1
++ @765 /* Let them try. I am not an easy target. */ EXTERN O#FOREL f1.2
++ @766 /* Who are you? */ EXTERN O#FOREL f1.3

CHAIN O#FOREL f1.1
@767 /* Do I look like a suicide monger to you? No, thanks. */
END
IF ~~ EXTERN O#FOREL f1.3

CHAIN O#FOREL f1.2
@768 /* So I've heard. Say, can you do something for me? It might be a little dangerous, but not for a great adventurer like you. */
END
IF ~~ EXTERN O#FOREL f1.3

CHAIN O#FOREL f1.3
@769 /* I'm Forel, a researcher. Recently I've done some fascinating work on the Cloudkill spell. When cast from a wand, it becomes an spell of incredible power: passes through all resistances and leaves no survivors. */
DO ~AddJournalEntry(@10088,QUEST)~
== O#FOREL @770 /* Sadly, my wand ran out of charges and broke. I wanted to buy another, but the local store does not trade in magical goods, and the Cowled Wizards are not eager to sell to outsiders. Will you give me a hand? */
END
+ ~PartyHasItem("wand13")~ + @771 /* Here you go. One Wand of Cloudkill, mint condition. */ EXTERN O#FOREL f1.3a
++ @772 /* You need a Wand of Cloudkill? */ EXTERN O#FOREL f1.4
++ @773 /* I have to warn you. Early versions of the wand were powerful, but it was modified later. Now you might just as well cast it from your spellbook. */ EXTERN O#FOREL f1.5
++ @774 /* What do you want me to do, steal you a wand? */ EXTERN O#FOREL f1.6

CHAIN O#FOREL f1.3a
@775 /* Seldarine! I've been blessed! */
DO ~AddExperienceParty(15500)
TakePartyItem("wand13")
GiveItemCreate("scrl2e",Player1,1,0,0)
GiveItemCreate("scrl7r",Player1,1,0,0)
GiveItemCreate("scrl9e",Player1,1,0,0)
EraseJournalEntry(@10088)
AddJournalEntry(@10089,QUEST_DONE)
SetGlobal("O#BrynnForel","GLOBAL",2)~
== O#FOREL @776 /* Here. Here. And here. And my thanks. YAAAAY, I HAVE A WAND! Ahem. Sorry. */
END
IF ~~ EXTERN O#FOREL f1.7

CHAIN O#FOREL f1.4
@777 /* That's what I said. */
END
IF ~~ EXTERN O#FOREL f1.7

CHAIN O#FOREL f1.5
@778 /* What? Modified? What kind of villain would do such a thing? Some gibberling or other, no doubt. */
= @779 /* Nevertheless, I still want the wand. */
END
IF ~~ EXTERN O#FOREL f1.7

CHAIN O#FOREL f1.6
@780 /* Well... not *steal*, exactly, more like borrow. Or lend. Or trade. Or... */
= @781 /* All right, steal. But I didn't say that. */
END
IF ~~ EXTERN O#FOREL f1.7

CHAIN O#FOREL f1.7
@782 /* You came here with Roslin, right? He's a good guy, I studied fire spells under him. Dora was his apprentice back then: a nice girl. Who would've thought she'd snap and start killing people? */
END
++ @783 /* It's not her fault. She lost her soul to Irenicus. */ EXTERN O#FOREL f1.8
++ @784 /* You knew Roslin and Dora? */ EXTERN O#FOREL f1.9
++ @786 /* Yes, yes, very sad. I got to go. */ EXTERN O#FOREL f1.end

CHAIN O#FOREL f1.8
@787 /* I guess becoming evil is better than dying... but murdering a guy just for stealing a few coins? Kind of cruel. */
END
IF ~~ EXTERN O#FOREL f1.10

CHAIN O#FOREL f1.9
@788 /* I did. Not very well, but I enjoyed working with them. */
END
IF ~~ EXTERN O#FOREL f1.10

CHAIN O#FOREL f1.10
@789 /* Back when I studied with Roslin, I envied him and Dora. I wish my father and I had a connection like that. Laughing all the time, discussing new spells, sharing ideas... */
= @790 /* Now it's all gone, though. Unless you can bring the old Dora back... but is this even possible? If you lose a soul, it's forever, right? */
= @791 /* Anyway, sorry for detaining you. You probably got people to kill and stuff. */
END
+ ~GlobalLT("O#BrynnQuest","GLOBAL",29) Global("O#BrynnForelBadRoslinDora","GLOBAL",0)~ + @792 /* Can you tell me anything else about Roslin and Dora? */ DO ~SetGlobal("O#BrynnForelBadRoslinDora","GLOBAL",1)~ EXTERN O#FOREL f2.3
+ ~GlobalGT("O#BrynnQuest","GLOBAL",28) Global("O#BrynnForelGoodRoslinDora","GLOBAL",0)~ + @793 /* In case you didn't know, Berlin is dead and Dora is back to normal again. */ DO ~SetGlobal("O#BrynnForelGoodRoslinDora","GLOBAL",1)~ EXTERN O#FOREL f2.4
++ @794 /* Oh, yes, I do. */ EXTERN O#FOREL f1.end
++ @795 /* You wouldn't believe how many. */ EXTERN O#FOREL f1.end
++ @796 /* Definitely 'stuff'. Goodbye. */ EXTERN O#FOREL f1.end

CHAIN O#FOREL f1.end
@797 /* See you. If you happen to meet some Cowled Wizards, search their corpses thoroughly! */
EXIT

// Talk again

CHAIN IF ~Global("O#BrynnForel","GLOBAL",1)~ THEN O#FOREL f2
@798 /* Hello, stranger. Any news about that wand of mine? Well, not mine, strictly speaking, but you know what I mean. */ 
END
+ ~PartyHasItem("wand13")~ + @799 /* Here you go. */ EXTERN O#FOREL f2.1
++ @800 /* Not yet, sorry. */ EXTERN O#FOREL f2.2
+ ~GlobalLT("O#BrynnQuest","GLOBAL",29) Global("O#BrynnForelBadRoslinDora","GLOBAL",0)~ + @792 /* Can you tell me anything else about Roslin and Dora? */ DO ~SetGlobal("O#BrynnForelBadRoslinDora","GLOBAL",1)~ EXTERN O#FOREL f2.3
+ ~GlobalGT("O#BrynnQuest","GLOBAL",28) Global("O#BrynnForelGoodRoslinDora","GLOBAL",0)~ + @793 /* In case you didn't know, Berlin is dead and Dora is back to normal again. */ DO ~SetGlobal("O#BrynnForelGoodRoslinDora","GLOBAL",1)~ EXTERN O#FOREL f2.4

CHAIN O#FOREL f2.1
@801 /* I've got the wand! I've got the WAND! I'VE GOT THE WAND! Oh, wait, your reward. */
DO ~AddExperienceParty(15500)
TakePartyItem("wand13")
GiveItemCreate("scrl2e",Player1,1,0,0)
GiveItemCreate("scrl7r",Player1,1,0,0)
GiveItemCreate("scrl9e",Player1,1,0,0)
EraseJournalEntry(@10088)
AddJournalEntry(@10089,QUEST_DONE)
SetGlobal("O#BrynnForel","GLOBAL",2)~
== O#FOREL @802 /* Here you go. Not as wonderful as my new wand - who'd need that stupid Incendiary Cloud, anyway? - but still good. And thanks. Thank you very much. */
END
++ @803 /* No problem. */ EXTERN O#FOREL f2.end
+ ~GlobalLT("O#BrynnQuest","GLOBAL",29) Global("O#BrynnForelBadRoslinDora","GLOBAL",0)~ + @792 /* Can you tell me anything else about Roslin and Dora? */ DO ~SetGlobal("O#BrynnForelBadRoslinDora","GLOBAL",1)~ EXTERN O#FOREL f2.3
+ ~GlobalGT("O#BrynnQuest","GLOBAL",28) Global("O#BrynnForelGoodRoslinDora","GLOBAL",0)~ + @793 /* In case you didn't know, Berlin is dead and Dora is back to normal again. */ DO ~SetGlobal("O#BrynnForelGoodRoslinDora","GLOBAL",1)~ EXTERN O#FOREL f2.4

CHAIN O#FOREL f2.end
@804 /* Ahhh... my wonderful, wonderful wand. My beauty. My preciousss... */
EXIT

CHAIN O#FOREL f2.2
@805 /* I've, um, heard that Berlin has one in his chambers. I can't exactly *advise* you to go there, but... well, that's one opportunity, if you're reckless enough. */
EXIT

CHAIN O#FOREL f2.3
@806 /* Dora didn't become Roslin's apprentice right away. When she just started among the Cowled Wizards, she was assigned to Berlin, the evil guy who rules the Spellhold now. And there was some nastiness. */
= @807 /* Roslin found out, pulled some strings, and made Berlin release her. Dora became Roslin's apprentice, and everybody was happy... except Berlin, of course. */
= @808 /* Until Berlin requested Dora's presence in Spellhold. Her and her alone. And when she teleported there, Berlin was safely away and Irenicus was already in control. */
= @809 /* The rest you know. Irenicus had broken Dora somehow, and afterwards she started her own band of mercenaries and killers. Word is she's working for Berlin again. */
= @810 /* That's all I know. If you're going to get in the middle of it, good luck. */
EXIT

CHAIN O#FOREL f2.4
@811 /* Oh. That's great to hear! And Roslin? How is he? */
END
+ ~Dead("O#Roslin")~ + @812 /* Dead. */ EXTERN O#FOREL f2.5
+ ~!Dead("O#Roslin")~ + @813 /* Friends with Dora again, I guess. */ EXTERN O#FOREL f2.6
++ @814 /* I don't know. */ EXTERN O#FOREL f2.7

CHAIN O#FOREL f2.5
@815 /* Ah. I think I'm going to cry. Leave me alone for a minute, please? */
EXIT

CHAIN O#FOREL f2.6
@816 /* That's almost *too* sweet. And I suddenly need my handkerchief. (sniff) Talk to you later? */
EXIT

CHAIN O#FOREL f2.7
@817 /* Best of luck to them all, I suppose, wherever they are. Except for Berlin. I really don't want to picture that villain's afterlife. Ugh. Excuse me, I think I'm going to retch somewhere in the corner. */
EXIT

// Quest done

CHAIN IF ~Global("O#BrynnForel","GLOBAL",2)~ THEN O#FOREL f3
@818 /* Thanks for the wand! Sorry, I have the experiments to plan. Yesss, it is time for more... experimentsss. */ 
END
++ @819 /* Just be careful. */ EXTERN O#FOREL f3.1
++ @820 /* Good luck, Forel. */ EXTERN O#FOREL f3.2
+ ~GlobalLT("O#BrynnQuest","GLOBAL",29) Global("O#BrynnForelBadRoslinDora","GLOBAL",0)~ + @792 /* Can you tell me anything else about Roslin and Dora? */ DO ~SetGlobal("O#BrynnForelBadRoslinDora","GLOBAL",1)~ EXTERN O#FOREL f2.3
+ ~GlobalGT("O#BrynnQuest","GLOBAL",28) Global("O#BrynnForelGoodRoslinDora","GLOBAL",0)~ + @793 /* In case you didn't know, Berlin is dead and Dora is back to normal again. */ DO ~SetGlobal("O#BrynnForelGoodRoslinDora","GLOBAL",1)~ EXTERN O#FOREL f2.4

CHAIN O#FOREL f3.1
@821 /* Careful? I'm always careful! Well, except for that one time with a troll, a drunk vampire and a succubus... but let's not go into details. */
EXIT

CHAIN O#FOREL f3.2
@822 /* Same to you! Now, where to find a horde of drow when you need one? */
EXIT
