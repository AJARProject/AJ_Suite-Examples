<!-- New AJUI_ProgressBar ( ) -> instance -->


## Description

This method returns an object representing an instance of the linear progress bar. The object contains different properties and their default values as well as formulas to manipulate them.

```4d
  New AJUI_ProgressBar ( ) -> instance
```

| Parameter | Type | In/Out | Description |
| --------- | ---- | ------ | ----------- |
| instance | object | out | instance of AJUI_ProgressBar  |

## Example

```4d
  C_Object ($mypb)
  
  //create a  progessbar and call it
  $mypb:=New AJUI_ProgressBar 
  $mypb.PBAreaHeight(20)
  $mypb.PBAreaWidth(400)
  $mypb.PBPercentValue(0)
  $mypb.PBTitle("Step 0/3")
  $mypb.PBActivateAnimation(False)
  $mypb.PBPictFormObjName("PB1")
  $mypb.LaunchProgressBar()
```
