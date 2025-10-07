Scriptname DynamicMercenaryFees_DialogueStart extends Quest  
Quest property RacialPayGap_Quest Auto

Function CalculatePrice()
RacialPayGap_Quest.Stop() 
Utility.Wait(0.1) 
RacialPayGap_Quest.Start()
Endfunction