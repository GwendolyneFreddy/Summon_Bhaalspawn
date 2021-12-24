/* ============ *
 *  Intro Talk  *
 * ============ */
BEGIN BHALSPW

IF ~NumTimesTalkedTo(0)~ THEN BEGIN WhereAmI
  SAY @0
  IF ~ReputationLT(LastTalkedToBy,5)~ THEN GOTO Fight
  IF ~ReputationGT(LastTalkedToBy,4)
      IsValidForPartyDialog("Imoen")~ THEN REPLY @1 GOTO ExplainImoen
  IF ~ReputationGT(LastTalkedToBy,4)
      !IsValidForPartyDialog("Imoen")~ THEN REPLY @1 GOTO Explain
END

IF ~True()~ THEN BEGIN Restart
  SAY @2
  IF ~ReputationLT(LastTalkedToBy,5)~ THEN GOTO Fight
  IF ~ReputationGT(LastTalkedToBy,4)
      Global("BhaalSpawnJoined","LOCALS",0)~ THEN REPLY @3 GOTO JoinUp
  IF ~ReputationGT(LastTalkedToBy,4)~ THEN REPLY @4 GOTO ByeBye
END

IF ~~ THEN BEGIN ByeBye
  SAY @5
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Fight
  SAY @6
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN Explain
  SAY @7
  IF ~~ THEN REPLY @8 GOTO Explain2
END

IF ~~ THEN BEGIN ExplainImoen
  SAY @9
  IF ~~ THEN REPLY @8 GOTO Explain2
END

IF ~~ THEN BEGIN Explain2
  SAY @10
  IF ~~ THEN GOTO Explain3
END

IF ~~ THEN BEGIN Explain3
  SAY @11
  IF ~~ THEN REPLY @12 GOTO Explain4
END

IF ~~ THEN BEGIN Explain4
  SAY @13
  IF ~~ THEN REPLY @14 GOTO JoinUp
  IF ~~ THEN REPLY @15 GOTO StayAwhile
  IF ~~ THEN REPLY @16 GOTO Leave
END

IF ~~ THEN BEGIN JoinUp
  SAY @17
  IF ~~ THEN DO ~SetGlobal("BhaalSpawnJoined","LOCALS",1) JoinParty()~ EXIT
END

IF ~~ THEN BEGIN StayAwhile
  SAY @18
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Leave
  SAY @19
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END


/* ============ *
 *  Leave Talk  *
 * ============ */
BEGIN BHALSPWP

IF ~Global("BhaalSpawnJoined","LOCALS",1)
    ReputationLT(LastTalkedToBy,5)~ THEN BEGIN KickoutFight
  SAY @20
  IF ~~ THEN DO ~SetGlobal("BhaalSpawnJoined","LOCALS",0) Enemy()~ EXIT
END

IF ~GlobalLT("BSBalance","GLOBAL",-2)~ THEN BEGIN UnbalancedFight
	SAY @21
	IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~GlobalGT("BSWhiner","LOCALS",2)~ THEN BEGIN WhinerFight
	SAY @22
	IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~Global("BhaalSpawnJoined","LOCALS",1)
    ReputationGT(LastTalkedToBy,4)~ THEN BEGIN Kickout
  SAY @23
  IF ~~ THEN REPLY @24 DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @25 DO ~SetGlobal("BhaalSpawnJoined","LOCALS",0) SetDialog("BHALSPW")~ GOTO Farewell
END

IF ~~ THEN BEGIN Farewell
  SAY @26
  IF ~~ THEN EXIT
END


/* ========= *
 *  Banters  *
 * ========= */
BEGIN BHALSPWJ

IF ~True()~ THEN BEGIN WorryTalk
	SAY @27
	IF ~~ THEN REPLY @28 GOTO WorryTalk2
END

IF ~~ THEN BEGIN WorryTalk2
	SAY @29
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN HellTalk
	SAY @30
	COPY_TRANS Player1 25
END

IF ~~ THEN BEGIN AvatarAppearsTalk
	SAY @31
	IF ~~ THEN REPLY @32 GOTO AvatarAppearsTalk2
END

IF ~~ THEN BEGIN AvatarAppearsTalk2
	SAY @33
	IF ~~ THEN REPLY @34 GOTO AvatarAppearsTalk3
END

IF ~~ THEN BEGIN AvatarAppearsTalk3
	SAY @35
	COPY_TRANS Player1 5
END

IF ~~ THEN BEGIN IrenicusDead
	SAY @36
	COPY_TRANS Player1 16
END

IF ~~ THEN BEGIN TreeTalk
	SAY @37 = @38
	COPY_TRANS Player1 33
END

IF ~~ THEN BEGIN KeldornBanter
	SAY @39
	IF ~~ THEN EXTERN Keldor BhaalSpawnBanter
END

IF ~~ THEN BEGIN KeldornBanter2
	SAY @40
	IF ~~ THEN EXTERN Keldor BhaalSpawnBanter2
END

IF ~~ THEN BEGIN KeldornBanter3
	SAY @41
	IF ~~ THEN EXTERN Keldor BhaalSpawnBanter3
END

IF ~~ THEN BEGIN OisigTalk
	SAY @42
	IF ~~ THEN EXTERN Bhoisig SeeingEyeBanter
END

IF ~~ THEN BEGIN OisigTalk2
	SAY @43
	IF ~~ THEN EXTERN Bhoisig SeeingEyeBanter2
END

IF ~~ THEN BEGIN RyanInterject
	SAY @44
	IF ~~ THEN EXTERN KAYL2 BSInterject
END

IF ~~ THEN BEGIN RyanInterject2
	SAY @45
	IF ~~ THEN EXTERN KAYL2 BSInterject2
END

IF ~~ THEN BEGIN RyanInterject3
	SAY @46
	IF ~~ THEN EXTERN KAYL2 BSInterject3
END

IF ~~ THEN BEGIN NotSoSimple
	SAY @47
	COPY_TRANS PPIRENI1 4
END

IF ~~ THEN BEGIN DivineRemoval
	SAY @48
	COPY_TRANS PPIRENI2 35
END

IF ~~ THEN BEGIN YoshimoBetrayal
	SAY @49
	COPY_TRANS YOSHJ 113
END

IF ~~ THEN BEGIN MoreSoul
	SAY @50
	IF ~!IsValidForPartyDialog("Jaheira")
		!IsValidForPartyDialog("Minsc")
		!IsValidForPartyDialog("Imoen2")~ THEN EXIT
	IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN JAHEIRAJ 480
	IF ~!IsValidForPartyDialog("Jaheira")
		IsValidForPartyDialog("Minsc")~ THEN EXTERN MINSCJ 176
	IF ~!IsValidForPartyDialog("Jaheira")
		!IsValidForPartyDialog("Minsc")
		IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2J 30
END

IF ~~ THEN BEGIN FinalTalk
	SAY @51
	COPY_TRANS HELLJON 7
END

IF ~~ THEN BEGIN ViconiaTalk
	SAY @52
	IF ~~ THEN EXTERN VICONI BSRebuttal
END

IF ~~ THEN BEGIN ViconiaTalk2
	SAY @53
	COPY_TRANS VICONI 2
END

IF ~~ THEN BEGIN FrankieTalk
	SAY @54
	COPY_TRANS COPGREET 1
END

IF ~~ THEN BEGIN HendakTalk1
	SAY @55
	COPY_TRANS HENDAK 4
END

IF ~~ THEN BEGIN HendakTalk2
	SAY @56
	COPY_TRANS HENDAK 7
END

IF ~~ THEN BEGIN HendakTalk3
	SAY @57
	COPY_TRANS HENDAK 19
END

IF ~~ THEN BEGIN NoMessNeed
	SAY @58
	IF ~~ THEN EXTERN SBSMESS PoliteGoodbye
END

IF ~~ THEN BEGIN WordQuestStart
	SAY @59
	IF ~~ THEN EXTERN SBSMESS MessQuest1
END

IF ~~ THEN BEGIN WordQuest1
	SAY @60
	IF ~~ THEN EXTERN SBSMESS MessQuest2
END

IF ~~ THEN BEGIN WordQuest2
	SAY @61
	IF ~~ THEN EXIT
END


/* ================ *
 *  External Files  *
 * ================ */

// Player1
// -------
EXTEND_BOTTOM Player1 25
	IF ~IsValidForPartyDialog("BHAALSPW")
	    Global("BhaalSpawnHellTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnHellTalk","GLOBAL",1)~ EXTERN BHALSPWJ HellTalk
END

EXTEND_BOTTOM Player1 5
	IF ~IsValidForPartyDialog("BHAALSPW")
	    Global("BhaalSpawnAvatarTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnAvatarTalk","GLOBAL",1)~ EXTERN BHALSPWJ AvatarAppearsTalk
END

EXTEND_BOTTOM Player1 16
	IF ~IsValidForPartyDialog("BHAALSPW")
	    Global("BhaalSpawnIrenicusDead","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnIrenicusDead","GLOBAL",1)~ EXTERN BHALSPWJ IrenicusDead
END

EXTEND_BOTTOM Player1 33
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BhaalSpawnTreeTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnTreeTalk","GLOBAL",1)~ GOTO BhaalTreeTalk
END

APPEND Player1
	IF ~~ THEN BEGIN BhaalTreeTalk
		SAY @62
		IF ~~ THEN REPLY @63 EXTERN ~BHALSPWJ~ TreeTalk
		IF ~~ THEN REPLY @64 EXTERN ~BHALSPWJ~ TreeTalk
		IF ~~ THEN REPLY @65 EXTERN ~BHALSPWJ~ TreeTalk
	END
END

// Keldorn
// -------
APPEND Keldor
	IF WEIGHT #-1 ~IsValidForPartyDialog("BHAALSPW")
		NumTimesTalkedTo(0)~ THEN BEGIN KeldornBhaalSpawnBanter
		SAY @66
		IF ~!IsValidForPartyDialog("BHAALSPW")~ THEN GOTO 0
		IF ~IsValidForPartyDialog("BHAALSPW")~ THEN EXTERN BHALSPWJ KeldornBanter
	END

	IF ~~ THEN BEGIN BhaalSpawnBanter
		SAY @67
		IF ~~ THEN EXTERN BHALSPWJ KeldornBanter2
	END

	IF ~~ THEN BEGIN BhaalSpawnBanter2
		SAY @68
		IF ~~ THEN EXTERN BHALSPWJ KeldornBanter3
	END

	IF ~~ THEN BEGIN BhaalSpawnBanter3
		SAY @69
		IF ~~ THEN REPLY #8257 DO ~SetGlobalTimer("KeldornMetPlayer","GLOBAL",FIFTY_DAYS)~ GOTO 17
		IF ~~ THEN REPLY #8259 DO ~SetGlobalTimer("KeldornMetPlayer","GLOBAL",FIFTY_DAYS)~ GOTO 18
		IF ~~ THEN REPLY @70 DO ~SetGlobalTimer("KeldornMetPlayer","GLOBAL",FIFTY_DAYS)~ GOTO 23
	END

END

// High Waiter Oisig
// -----------------
EXTEND_BOTTOM Bhoisig 9
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BhaalSpawnOisigBanter","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnOisigBanter","GLOBAL",1)~ EXTERN BHALSPWJ OisigTalk
END

APPEND Bhoisig
	IF ~~ THEN BEGIN SeeingEyeBanter
		SAY @71
		IF ~~ THEN EXTERN BHALSPWJ OisigTalk2
	END

	IF ~~ THEN BEGIN SeeingEyeBanter2
		SAY @72
		IF ~~ THEN GOTO 11
	END

END

// Sir Ryan Trawl
// --------------
EXTEND_BOTTOM KAYL2 10
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BhaalSpawnRyanBanter","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnRyanBanter","GLOBAL",1)~ EXTERN BHALSPWJ RyanInterject
END

APPEND KAYL2

	IF ~~ THEN BEGIN BSInterject
		SAY @73
		IF ~~ THEN EXTERN BHALSPWJ RyanInterject2
	END

	IF ~~ THEN BEGIN BSInterject2
		SAY @74
		IF ~~ THEN EXTERN BHALSPWJ RyanInterject3
	END

	IF ~~ THEN BEGIN BSInterject3
		SAY @75
		COPY_TRANS KAYL2 10
	END

END

// Main Irenicus Plot
// ------------------
EXTEND_BOTTOM PPIRENI1 4
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSSimpleObjection","GLOBAL",0)~ THEN DO ~SetGlobal("BSSimpleObjection","GLOBAL",1)~ EXTERN BHALSPWJ NotSoSimple
END

EXTEND_BOTTOM PPIRENI2 35
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSRemoveDivine","GLOBAL",0)~ THEN DO ~SetGlobal("BSRemoveDivine","GLOBAL",1)~ EXTERN BHALSPWJ DivineRemoval
END

EXTEND_BOTTOM YOSHJ 113
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSYoshimoBetrayal","GLOBAL",0)~ THEN DO ~SetGlobal("BSYoshimoBetrayal","GLOBAL",1)~ EXTERN BHALSPWJ YoshimoBetrayal
END

EXTEND_BOTTOM SUJON 14
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSMoreSoul","GLOBAL",0)~ THEN DO ~Enemy() SetGlobal("BSMoreSoul","GLOBAL",1)~ EXTERN BHALSPWJ MoreSoul
END

EXTEND_BOTTOM HELLJON 7
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSFinalTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BSFinalTalk","GLOBAL",1)~ EXTERN BHALSPWJ FinalTalk
END

EXTEND_BOTTOM HELLJON 8
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSFinalTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BSFinalTalk","GLOBAL",1)~ EXTERN BHALSPWJ FinalTalk
END

EXTEND_BOTTOM HELLJON 9
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSFinalTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BSFinalTalk","GLOBAL",1)~ EXTERN BHALSPWJ FinalTalk
END

EXTEND_BOTTOM HELLJON 10
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSFinalTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BSFinalTalk","GLOBAL",1)~ EXTERN BHALSPWJ FinalTalk
END

// Viconia
// -------
EXTEND_BOTTOM VICONI 2
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSViconiaJoin","GLOBAL",0)~ THEN DO ~SetGlobal("BSViconiaJoin","GLOBAL",1)~ EXTERN BHALSPWJ ViconiaTalk
END

APPEND VICONI
	IF ~~ THEN BEGIN BSRebuttal
		SAY @76
		IF ~~ THEN EXTERN BHALSPWJ ViconiaTalk2
	END
END

// Frankie, the Copper Coronet Greeter
// -----------------------------------
EXTEND_BOTTOM COPGREET 1
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSFrankie","GLOBAL",0)~ THEN DO ~SetGlobal("BSFrankie","GLOBAL",1)~ EXTERN BHALSPWJ FrankieTalk
END

// Hendak the Gladiator
// --------------------
EXTEND_BOTTOM HENDAK 4
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSHendak1","GLOBAL",0)~ THEN DO ~SetGlobal("BSHendak1","GLOBAL",1)~ EXTERN BHALSPWJ HendakTalk1
END

EXTEND_BOTTOM HENDAK 7
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSHendak2","GLOBAL",0)~ THEN DO ~SetGlobal("BSHendak2","GLOBAL",1)~ EXTERN BHALSPWJ HendakTalk2
END

EXTEND_BOTTOM HENDAK 19
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("BSHendak3","GLOBAL",0)~ THEN DO ~SetGlobal("BSHendak3","GLOBAL",1)~ EXTERN BHALSPWJ HendakTalk3
END

// Radiant Heart Messenger
// -----------------------
BEGIN SBSMESS

IF ~True()~ THEN BEGIN Welcome
	SAY @77
	IF ~!IsValidForPartyDialog("BHAALSPW")~ THEN EXIT
	IF ~IsValidForPartyDialog("BHAALSPW")
		!Global("WordSendQuest","GLOBAL",2)~ THEN EXTERN BHALSPWJ NoMessNeed
	IF ~IsValidForPartyDialog("BHAALSPW")
		Global("WordSendQuest","GLOBAL",2)~ THEN EXTERN BHALSPWJ WordQuestStart
END

IF ~~ THEN BEGIN PoliteGoodbye
	SAY @78
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MessQuest1
	SAY @79
	IF ~~ THEN EXTERN BHALSPWJ WordQuest1
END

IF ~~ THEN BEGIN MessQuest2
	SAY @80
	IF ~~ THEN DO ~SetGlobal("WordSendQuest","GLOBAL",3) IncrementGlobal("BSBalance","GLOBAL",1)~ EXTERN BHALSPWJ WordQuest2
END
