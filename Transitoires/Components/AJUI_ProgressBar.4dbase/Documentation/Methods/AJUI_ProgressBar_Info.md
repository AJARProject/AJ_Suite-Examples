<!-- AJUI_ProgressBar_Info ( ) -> version -->


## Description

Show the version info of the component.

```4d
  AJUI_ProgressBar_Info ( ) -> version
```

| Parameter | Type | In/Out | Description |
| --------- | ---- | ------ | ----------- |
| version | text | out | version info of the component |


## Example

```4d
  C_String($version)

  $version:= AJUI_ProgressBar_Info () //AJUI ProgressBar (v18) : 1.1.1-Build20
```
