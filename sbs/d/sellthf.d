BEGIN SELLTHF

IF ~NumTimesTalkedTo(0)~ Offer
  SAY @0
  ++ @1 + Upto
  ++ @2 + NoTrust
  ++ @3 DO ~SetGlobal("KnowBhaalScroll","LOCALS",1)~ + GoodVibes
END

IF ~HasItem("SCRLBS",Myself)~ StillGood
  SAY @4
  + ~Global("KnowBhaalScroll","LOCALS",1) PartyGoldGT(499)~ + @5 + Purchase
  + ~Global("KnowBhaalScroll","LOCALS",1)~ + @6 + FinalOffer
  + ~Global("KnowBhaalScroll","LOCALS",0)~ + @7 DO ~SetGlobal("KnowBhaalScroll","LOCALS",1)~ + GoodVibes
  ++ @8 + NoTrust
END

IF ~PartyHasItem("SCRLBS")~ GoodMerchandise
  SAY @9
  IF ~~ EXIT
END

IF ~True()~ AnyGood
  SAY @10
  IF ~~ EXIT
END

IF ~~ Upto
  SAY @11
  ++ @12 DO ~SetGlobal("KnowBhaalScroll","LOCALS",1)~ + GoodVibes
  ++ @13 + NoTrust
END

IF ~~ NoTrust
  SAY @14
  IF ~~ EXIT
END

IF ~~ GoodVibes
  SAY @15
  ++ @16 + GoodVibes2
END

IF ~~ GoodVibes2
  SAY @17
  ++ @18 + StartOffer
END

IF ~~ StartOffer
  SAY @19
  + ~PartyGoldGT(499)~ + @20 + Purchase
  ++ @21 + FinalOffer
  ++ @22 + NoTrust
END

IF ~~ Purchase
  SAY @23
  IF ~~ DO ~TakePartyGold(500) GiveItem("SCRLBS",LastTalkedToBy)~ EXIT
END

IF ~~ FinalOffer
  SAY @24
  + ~PartyGoldGT(499)~ + @25 + Purchase
  ++ @26 + NoTrust
END
