BEGIN BBHALSPW

// Bhaalspawn Interjection file for talking to Player 1 and other characters
// -------------------------------------------------------------------------
IF ~See("Imoen2")
	!Dead("Imoen2")
	!StateCheck("Imoen2",STATE_SLEEPING)
	Global("ImoenBSInterject","LOCALS",1)
	CombatCounter(0)~ THEN BEGIN ImoenInterject
	SAY @0
	IF ~~ THEN DO ~SetGlobal("ImoenBSInterject","LOCALS",2)~ EXTERN BIMOEN2 BhaalspawnTalk
END

IF ~See("Imoen2")
	!Dead("Imoen2")
	!StateCheck("Imoen2",STATE_SLEEPING)
	Global("ImoenBSInterject","LOCALS",3)
	CombatCounter(0)~ THEN BEGIN AbilitiesTalk
	SAY @1
	IF ~~ THEN DO ~SetGlobal("ImoenBSInterject","LOCALS",4)~ EXTERN BIMOEN2 BSATalk
END

// Divine Soul
// -----------
IF ~Global("GainDivineSoul","GLOBAL",1)~ THEN BEGIN GainDivineSoul
	SAY @2 = @3 = @4
	IF ~~ THEN DO ~ReallyForceSpell(Myself,3838)
				   ReallyForceSpell(Myself,3135)
				   SetGlobal("GainDivineSoul","GLOBAL",2)~ EXIT
END

IF ~Global("GainDivineSoul","GLOBAL",2)~ THEN BEGIN DivineSoulExplain
	SAY @5
	IF ~~ THEN REPLY @6 GOTO DivineSoulExplain2
	IF ~~ THEN REPLY @7 EXIT
END

// Banters
// -------
IF ~Global("BSInterjects","LOCALS",2)~ THEN BEGIN Confess
	SAY @8
	IF ~~ THEN REPLY @9 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO Confess2
	IF ~~ THEN REPLY @10 GOTO ConfessPre
	IF ~~ THEN REPLY @11 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",4)~ THEN BEGIN Plan
	SAY @12 = @13
	IF ~~ THEN EXIT
END

IF ~Global("BSInterjects","LOCALS",6)~ THEN BEGIN Seriousness
	SAY @14 = @15 = @16
	IF ~~ THEN EXIT
END

IF ~Global("BSInterjects","LOCALS",8)~ THEN BEGIN Hometown
	SAY @17
	IF ~~ THEN REPLY @18 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO Waterdeep
	IF ~~ THEN REPLY @19 GOTO NoWaterdeep
	IF ~~ THEN REPLY @20 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",10)~ THEN BEGIN Whattodo
	SAY @21
	IF ~~ THEN REPLY @22 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO Goodanswer
	IF ~~ THEN REPLY @23 GOTO Neutralanswer
	IF ~~ THEN REPLY @24 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO Evilanswer
	IF ~~ THEN REPLY @25 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",12)~ THEN BEGIN Ironic
	SAY @26
	IF ~~ THEN REPLY @27 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO IronicGood
	IF ~~ THEN REPLY @28 GOTO Tyrbetter
	IF ~~ THEN REPLY @29 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO Bhaalbetter
	IF ~~ THEN REPLY @30 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",14)~ THEN BEGIN OtherSpawn
	SAY @31
	IF ~GlobalGT("CHAPTER","GLOBAL",4)
		InParty("Imoen2")~ THEN REPLY @32 GOTO Sarevok
	IF ~GlobalGT("CHAPTER","GLOBAL",4)
		!InParty("Imoen2")~ THEN REPLY @33 GOTO Sarevok
	IF ~GlobalLT("CHAPTER","GLOBAL",5)~ THEN REPLY @34 GOTO Sarevok
	IF ~~ THEN REPLY @35 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",16)~ THEN BEGIN Trouble
	SAY @36
	IF ~~ THEN REPLY @37 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO StopBhaal
	IF ~~ THEN REPLY @38 GOTO DeserveDeath
	IF ~~ THEN REPLY @39 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO AllowBhaal
	IF ~~ THEN REPLY @40 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",18)~ THEN BEGIN Helmites
	SAY @41
	IF ~~ THEN REPLY @42 GOTO Helmites2
	IF ~~ THEN REPLY @43 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",20)~ THEN BEGIN Chafing
	SAY @44
		=
	@45
	IF ~~ THEN EXIT
END

IF ~Global("BSInterjects","LOCALS",22)~ THEN BEGIN IllWind
	SAY @46
	IF ~~ THEN EXIT
END

IF ~Global("BSInterjects","LOCALS",24)~ THEN BEGIN RichOrPoor
	SAY @47
	IF ~~ THEN REPLY @48 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO Greed
	IF ~~ THEN REPLY @49 GOTO MiddleClass
	IF ~~ THEN REPLY @50 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO Selfless
	IF ~~ THEN REPLY @51 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",26)~ THEN BEGIN UnusualSuspects
	SAY @52
	IF ~~ THEN REPLY @53 GOTO SuspectStory
	IF ~~ THEN REPLY @54 GOTO SheJinx
	IF ~~ THEN REPLY @55 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",28)~ THEN BEGIN Teacher
	SAY @56
	IF ~~ THEN REPLY @57 GOTO MrWilson
	IF ~~ THEN REPLY @58 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",30)
	GlobalLT("Chapter","GLOBAL",5)~ THEN BEGIN IrenicusBefore
	SAY @59
	IF ~~ THEN REPLY @60 GOTO IrenicusTaint
	IF ~~ THEN REPLY @61 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO IrenicusJustice
	IF ~~ THEN REPLY @62 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO IrenicusBad
	IF ~~ THEN REPLY @63 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",30)
	GlobalGT("Chapter","GLOBAL",4)~ THEN BEGIN IrenicusAfter
	SAY @64
	IF ~~ THEN REPLY @65 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO IrenicusJustice
	IF ~~ THEN REPLY @66 GOTO IrenicusTaint
	IF ~~ THEN REPLY @67 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO IrenicusBad
	IF ~~ THEN REPLY @63 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",32)~ THEN BEGIN SeeAmn
	SAY @68
	IF ~~ THEN REPLY @69 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO IrenicusThankful
	IF ~~ THEN REPLY @70 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO PaladinStructure
	IF ~~ THEN REPLY @71 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",34)~ THEN BEGIN Paladins
	SAY @72
	IF ~~ THEN EXIT
END

IF ~Global("BSInterjects","LOCALS",36)~ THEN BEGIN Slavery
	SAY @73
	IF ~~ THEN REPLY @74 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO SlaveNonsense
	IF ~~ THEN REPLY @75 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO SlaveThanks
	IF ~~ THEN REPLY @76 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO SlaveQuestion
	IF ~~ THEN REPLY @77 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",38)~ THEN BEGIN Power
	SAY @78
	IF ~~ THEN REPLY @79 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO PowerGood
	IF ~~ THEN REPLY @80 GOTO PowerNeutral
	IF ~~ THEN REPLY @81 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO PowerEvil
	IF ~~ THEN REPLY @82 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",40)~ THEN BEGIN Ditty
	SAY @83 = @84 = @85
	IF ~~ THEN REPLY @86 GOTO DittyMine
	IF ~~ THEN REPLY @87 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO DittyHumble
	IF ~~ THEN REPLY @88 GOTO DittyExcuse
	IF ~~ THEN REPLY @89 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",42)~ THEN BEGIN TyrsBlessing
	SAY @90 = @91
	IF ~~ THEN DO ~ReallyForceSpell(Player1,CLERIC_BLESS)~ EXIT
END

IF ~Global("BSInterjects","LOCALS",44)~ THEN BEGIN FriendsBehind
	SAY @92 = @93
	IF ~~ THEN REPLY @94 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO WaterdeepReturn
	IF ~~ THEN REPLY @95 GOTO ConfirmLeave
	IF ~~ THEN REPLY @96 DO ~IncrementGlobal("BSBalance","GLOBAL",1) SetGlobal("WordSendQuest","GLOBAL",1)~ GOTO SendWord
	IF ~~ THEN REPLY @97 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO FriendConcern
	IF ~~ THEN REPLY @98 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",46)~ THEN BEGIN Fashion
	SAY @99
	IF ~~ THEN EXIT
END

IF ~Global("BSInterjects","LOCALS",48)~ THEN BEGIN Whys
	SAY @100
	IF ~~ THEN REPLY @101 GOTO Friends
	IF ~~ THEN REPLY @102 GOTO Harm
	IF ~~ THEN REPLY @103 GOTO World
	IF ~~ THEN REPLY @104 GOTO Possess
	IF ~~ THEN REPLY @105 GOTO Whiner
END

IF ~Global("BSInterjects","LOCALS",50)~ THEN BEGIN Final
	SAY @106
	IF ~!Global("GainDivineSoul","GLOBAL",0)~ THEN DO ~SetGlobal("BSInterjects","LOCALS",51)~ GOTO Changed
	IF ~Global("GainDiveSoul","GLOBAL",0)
		GlobalGT("BSBalance","GLOBAL",10)~ THEN DO ~SetGlobal("BSInterjects","LOCALS",51)~ GOTO Encouraging
	IF ~Global("GainDiveSoul","GLOBAL",0)
		GlobalLT("BSBalance","GLOBAL",11)
		GlobalGT("BSBalance","GLOBAL",5)~ THEN DO ~SetGlobal("BSInterjects","LOCALS",51)~ GOTO CloseTo
	IF ~Global("GainDiveSoul","GLOBAL",0)
		GlobalLT("BSBalance","GLOBAL",6)
		GlobalGT("BSBalance","GLOBAL",0)~ THEN DO ~SetGlobal("BSInterjects","LOCALS",51)~ GOTO EvenKeel
	IF ~Global("GainDiveSoul","GLOBAL",0)
		GlobalLT("BSBalance","GLOBAL",1)~ THEN DO ~SetGlobal("BSInterjects","LOCALS",51)~ GOTO EdgeOfEvil
END

//----------------------------------------------------------------------------

IF ~~ THEN BEGIN Changed
	SAY @107
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Encouraging
	SAY @108
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN CloseTo
	SAY @109
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN EvenKeel
	SAY @110
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN EdgeOfEvil
	SAY @111
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Friends
	SAY @112
	IF ~~ THEN REPLY @113 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO FriendYes
	IF ~~ THEN REPLY @114 DO ~SetGlobal("BSBalance","GLOBAL",-3)~ GOTO FriendNo
END

IF ~~ THEN BEGIN FriendYes
	SAY @115
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN FriendNo
	SAY @116
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Harm
	SAY @117
	IF ~~ THEN REPLY @118 GOTO Proactive
	IF ~~ THEN REPLY @119 DO ~IncrementGlobal("BSBalance","GLOBAL",-5)~ GOTO Revenge
END

IF ~~ THEN BEGIN Proactive
	SAY @120
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Revenge
	SAY @121
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN World
	SAY @122
	IF ~~ THEN REPLY @123 GOTO City
	IF ~~ THEN REPLY @124 GOTO Wilds
	IF ~~ THEN REPLY @125 DO ~IncrementGlobal("BSBalance","GLOBAL",-5)~ GOTO Underbelly
	IF ~~ THEN REPLY @126 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO ThePeople
END

IF ~~ THEN BEGIN City
	SAY @127
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Wilds
	SAY @128
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Underbelly
	SAY @129
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ThePeople
	SAY @130
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Possess
	SAY @131
	IF ~~ THEN REPLY @132 DO ~SetGlobal("BSBalance","GLOBAL",-3)~ GOTO PossessPower
	IF ~~ THEN REPLY @133 DO ~IncrementGlobal("BSBalance","GLOBAL",-5)~ GOTO PossessGold
	IF ~~ THEN REPLY @134 GOTO PossessLove
END

IF ~~ THEN BEGIN PossessPower
	SAY @135
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PossessGold
	SAY @136
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PossessLove
	SAY @137
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN WaterdeepReturn
	SAY @138
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ConfirmLeave
	SAY @139
	IF ~~ THEN REPLY @140 GOTO MoreJourney
	IF ~~ THEN REPLY @141 GOTO GoodbyeThen
END

IF ~~ THEN BEGIN MoreJourney
	SAY @142
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN GoodbyeThen
	SAY @143
	IF ~~ THEN DO ~LeaveParty() EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN SendWord
	SAY @144
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN FriendConcern
	SAY @145
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN DittyMine
	SAY @146
	IF ~~ THEN EXIT
END

IF ~~ THEN DittyHumble
	SAY @147
	IF ~~ THEN EXIT
END

IF ~~ THEN DittyExcuse
	SAY @148
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PowerGood
	SAY @149
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PowerNeutral
	SAY @150
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PowerEvil
	SAY @151
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SlaveNonsense
	SAY @152
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SlaveThanks
	SAY @153
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SlaveQuestion
	SAY @154
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN IrenicusThankful
	SAY @155
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PaladinStructure
	SAY @156
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN IrenicusTaint
	SAY @157
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN IrenicusJustice
	SAY @158
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN IrenicusBad
	SAY @159
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MrWilson
	SAY @160 = @161
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SuspectStory
	SAY @162 = @163 = @164 = @165 = @166 = 167 = @168
	IF ~~ THEN REPLY @169 GOTO SuspectStoryCont
	IF ~~ THEN REPLY @170 GOTO StopSuspectStory
	IF ~~ THEN REPLY @171 GOTO Whiner
END

IF ~~ THEN BEGIN StopSuspectStory
	SAY @172
	IF ~~ THEN GOTO SuspectStoryCont
END

IF ~~ THEN BEGIN SuspectStoryCont
	SAY @173 = @174
	IF ~~ THEN REPLY @175 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO WantPower
	IF ~~ THEN REPLY @176 GOTO StrongWill
	IF ~~ THEN REPLY @177 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO TyrProtect
	IF ~~ THEN REPLY @178 GOTO Whiner
END

IF ~~ THEN BEGIN WantPower
	SAY @179
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN StrongWill
	SAY @180
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN TyrProtect
	SAY @181
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SheJinx
	SAY @182 = @183
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Greed
	SAY @184
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MiddleClass
	SAY @185
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Selfless
	SAY @186
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Helmites2
	SAY @187
	IF ~~ THEN REPLY @188 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO HelmGood
	IF ~~ THEN REPLY @189 DO ~IncrementGlobal("BSBalance","GLOBAL",1)~ GOTO HelmGood
	IF ~~ THEN REPLY @190 DO ~IncrementGlobal("BSBalance","GLOBAL",-1)~ GOTO HelmBad
	IF ~~ THEN REPLY @191 GOTO Whiner
END

IF ~~ THEN BEGIN HelmGood
	SAY @192
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN HelmBad
	SAY @193
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN StopBhaal
	SAY @194
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN DeserveDeath
	SAY @195
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN AllowBhaal
	SAY @196
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ConfessPre
	SAY @197
	IF ~~ THEN GOTO Confess2
END

IF ~~ THEN BEGIN Confess2
	SAY @198
	IF ~~ THEN REPLY @199 GOTO Confess3
END

IF ~~ THEN BEGIN Confess3
	SAY @200
	IF ~~ THEN REPLY @41 GOTO Confess4
END

IF ~~ THEN BEGIN Confess4
	SAY @201
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Whiner
	SAY @202
	IF ~~ THEN DO ~IncrementGlobal("BSWhiner","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN ImoenTalk
	SAY @203
	IF ~~ THEN EXTERN BIMOEN2 BhaalspawnTalk2
END

IF ~~ THEN BEGIN ImoenTalk2
	SAY @204
	IF ~~ THEN EXTERN BIMOEN2 BhaalspawnTalk3
END

IF ~~ THEN BEGIN ImoenTalk3
	SAY @205
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN NoWaterdeep
	SAY @206
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Waterdeep
	SAY @207 = @208
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Goodanswer
	SAY @209
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Neutralanswer
	SAY @210
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Evilanswer
	SAY @211
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN IronicGood
	SAY @212
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Tyrbetter
	SAY @213
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Bhaalbetter
	SAY @214
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Sarevok
	SAY @215
	IF ~~ THEN REPLY @216 GOTO GoodnessSaverok
	IF ~~ THEN REPLY @217 GOTO GoodnessSaverok
	IF ~~ THEN REPLY @218 GOTO Whiner
END

IF ~~ THEN BEGIN GoodnessSaverok
	SAY @219
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN AbilitiesTalk2
	SAY @220
	IF ~~ THEN EXTERN BIMOEN2 BSATalk2
END

IF ~~ THEN BEGIN AbilitiesTalk3
	SAY @221
	IF ~~ THEN EXTERN BIMOEN2 BSATalk3
END

IF ~~ THEN BEGIN DivineSoulExplain2
	SAY @222 = @223 = @224
	IF ~~ THEN DO ~SetGlobal("GainDivineSoul","GLOBAL",3)~ EXIT
END


/* ================ *
 *  External Files  *
 * ================ */

// Imoen2
// ------
APPEND BIMOEN2

	IF ~~ THEN BEGIN BhaalspawnTalk
		SAY @225
		IF ~~ THEN EXTERN BBHALSPW ImoenTalk
	END

	IF ~~ THEN BEGIN BhaalspawnTalk2
		SAY @226
		IF ~~ THEN EXTERN BBHALSPW ImoenTalk2
	END

	IF ~~ THEN BEGIN BhaalspawnTalk3
		SAY @227
		IF ~~ THEN EXTERN BBHALSPW ImoenTalk3
	END

	IF ~~ THEN BEGIN BSATalk
		SAY @228
		IF ~~ THEN EXTERN BBHALSPW AbilitiesTalk2
	END

	IF ~~ THEN BEGIN BSATalk2
		SAY @229
		IF ~~ THEN EXTERN BBHALSPW AbilitiesTalk3
	END

	IF ~~ THEN BEGIN BSATalk3
		SAY @230
		IF ~~ THEN EXIT
	END

	IF ~Global("ImoenGainsAbilities","GLOBAL",2)~ THEN BEGIN GainFirstAbility
		SAY @231
		IF ~~ THEN DO ~SetGlobal("ImoenGainsAbilities","GLOBAL",3)
						ApplySpell(Myself,3130)~ EXIT
	END

	IF ~Global("ImoenGainsAbilities","GLOBAL",4)~ THEN BEGIN GainSecondAbility
		SAY @232
		IF ~~ THEN DO ~SetGlobal("ImoenGainsAbilities","GLOBAL",5)
						ApplySpell(Myself,3130)~ EXIT
	END

END
