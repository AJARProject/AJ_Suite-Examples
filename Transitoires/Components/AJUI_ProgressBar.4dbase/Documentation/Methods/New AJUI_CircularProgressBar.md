<!-- New AJUI_CircularProgressBar ( ) -> instance -->


## Description

this method returns an object representing an instance of the circular progress bar. The object contains different properties and their default values as well as formulas to manipulate them.

```4d
  New AJUI_CircularProgressBar ( ) -> instance
```

| Parameter | Type | In/Out | Description |
| --------- | ---- | ------ | ----------- |
| instance | object | out | instance of AJUI_CircularProgressBar  |

## Example

```
  C_Object ($mycpb)
  
  //create a circular progessbar and call it
  $mycpb:=New AJUI_CircularProgressBar 
  $mycpb.CPBExternalRadius(70)
  $mycpb.CPBPercentValue(0)
  $mycpb.CPBActivateAnimation(True)
  $mycpb.CPBPictFormObjName("circularPB")
  $mycpb.LaunchCircularProgressBar()
```
