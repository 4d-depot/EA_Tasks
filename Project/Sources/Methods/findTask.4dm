//%attributes = {"invisible":true}
  // Method: findTask
  // Description: 
  //     Finds task in a collection and return index position
  //
  // Parameters
  //     $0 - Returns index of found item in a collection
  //     $1 - Object in collection
  //     $2 - Searched task ID
  // ----------------------------------------------------

C_LONGINT:C283($0)
C_OBJECT:C1216($1)
C_LONGINT:C283($2)

$1.result:=$1.value.ID=$2