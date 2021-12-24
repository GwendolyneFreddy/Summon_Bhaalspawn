BEGIN SELLTHF

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Offer
  SAY @0
  IF ~~ THEN REPLY @1 GOTO Upto
  IF ~~ THEN REPLY @2 GOTO NoTrust
  IF ~~ THEN REPLY @3 DO  ~SetGlobal("KnowBhaalScroll","LOCALS",1)~ GOTO GoodVibes
END

IF ~HasItem("SCRLBS",Myself)~ THEN BEGIN StillGood
  SAY @4
  IF ~Global("KnowBhaalScroll","LOCALS",1) PartyGoldGT(499)~ THEN REPLY @5 GOTO Purchase
  IF ~Global("KnowBhaalScroll","LOCALS",1)~ THEN REPLY @6 GOTO FinalOffer
  IF ~Global("KnowBhaalScroll","LOCALS",0)~ THEN REPLY @7 DO ~SetGlobal("KnowBhaalScroll","LOCALS",1)~ GOTO GoodVibes
  IF ~~ THEN REPLY @8 GOTO NoTrust
END

IF ~PartyHasItem("SCRLBS")~ THEN BEGIN GoodMerchandise
  SAY @9
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN AnyGood
  SAY @10
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Upto
  SAY @11
  IF ~~ THEN REPLY @12 DO  ~SetGlobal("KnowBhaalScroll","LOCALS",1)~ GOTO GoodVibes
  IF ~~ THEN REPLY @13 GOTO NoTrust
END

IF ~~ THEN BEGIN NoTrust
  SAY @14
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN GoodVibes
  SAY @15
  IF ~~ THEN REPLY @16 GOTO GoodVibes2
END

IF ~~ THEN BEGIN GoodVibes2
  SAY @17
  IF ~~ THEN REPLY @18 GOTO StartOffer
END

IF ~~ THEN BEGIN StartOffer
  SAY @19
  IF ~PartyGoldGT(499)~ THEN REPLY @20 GOTO Purchase
  IF ~~ THEN REPLY @21 GOTO FinalOffer
  IF ~~ THEN REPLY @22 GOTO  NoTrust
END

IF ~~ THEN BEGIN Purchase
  SAY @23
  IF ~~ THEN DO ~TakePartyGold(500) GiveItem("SCRLBS",LastTalkedToBy)~ EXIT
END

IF ~~ THEN BEGIN FinalOffer
  SAY @24
  IF ~PartyGoldGT(499)~ THEN REPLY @25 GOTO Purchase
  IF ~~ THEN REPLY @26 GOTO NoTrust
END
