//%attributes = {"invisible":true}
  // Method: findCategory
  // Description: 
  //     Finds category in a collection and return index position
  //
  // Parameters
  //     $0 - Returns index of found item in a collection
  //     $1 - Object in collection
  //     $2 - Searched category name
  // ----------------------------------------------------

C_LONGINT:C283($0)
C_OBJECT:C1216($1)
C_TEXT:C284($2;$categoryName_t)
$categoryName_t:=$2

$1.result:=$1.value.Name=$2