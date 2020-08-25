// JavaScript Document
function trim(thisString){
	var newString = thisString;
	while (newString.charCodeAt(0) < 33)
	{
		newString = newString.substring(1,newString.length);
	}
	
	while (newString.charCodeAt(newString.length - 1) < 33)
	{
		newString = newString.substring(0, newString.length - 1);
	}
	return newString;
}

function ValidateIntegerFields(thisform,Fields,Desc,AllowComma,AllowNeg)
{
	var tmpVal='';
	var FieldArray=new Array();
	var DescArray=new Array();
	var tmp=0;
	var tmpMsg='';
	// Create array for Field list
	tmpVal=Fields;
	do
	{
		tmp=tmpVal.indexOf('|');
		if (tmp == -1)
		{
			if (tmpVal != '')
			{
				FieldArray[FieldArray.length]=tmpVal;
				tmpVal='';
			}
		} else {
			FieldArray[FieldArray.length]=tmpVal.substring(0,tmp);
			tmpVal=tmpVal.substring(tmp + 1);
		}
	}
	while (tmpVal != '');
	// Create array for Desc list
	tmpVal=Desc;
	do
	{
		tmp=tmpVal.indexOf('|');
		if (tmp == -1)
		{
			if (tmpVal != '')
			{
				DescArray[DescArray.length]=tmpVal;
				tmpVal='';
			}
		} else {
			DescArray[DescArray.length]=tmpVal.substring(0,tmp);
			tmpVal=tmpVal.substring(tmp + 1);
		}
	}
	while (tmpVal != '');
	// Check to see if passed strings are of equal length
	if (FieldArray.length != DescArray.length)
	{
		alert('Fatal error: ValidateInteger - Passed lists do not have the same length');
		return false;
	}
	// Validate fields
	for (i=0; i<FieldArray.length;i++)
	{
		tmpMsg='';
		eval('tmpVal=thisform.' + FieldArray[i] + '.value');
		if (!AllowNeg && tmpVal < 0)
		{
			alert(DescArray[i] + ' may not be a negative value.');
			// Fix for IWOF NSO
			if (FieldArray[i].substring(0,4) == 'Hold')
			{
				eval('thisform.Qty_' + FieldArray[i].substring(5) + '.select()');
			} else {
				eval('thisform.' + FieldArray[i] + '.select()')
			}
			return false;
		}
		if (!ValInt(tmpVal,AllowComma))
		{
			if (AllowComma != 1 && tmpVal.indexOf(',') != -1) tmpMsg=' without commas';
			if (tmpVal.indexOf('.') != -1) tmpMsg=' (no decimal fraction)';
			alert(DescArray[i] + ' must be an integer value' + tmpMsg + '.');
			// Fix for IWOF NSO
			if (FieldArray[i].substring(0,4) == 'Hold')
			{
				eval('thisform.Qty_' + FieldArray[i].substring(5) + '.select()');
			} else {
				eval('thisform.' + FieldArray[i] + '.select()')
			}
			return false;
		}
	}
	return true;
}




function ValidateFloatFields(thisform,Fields,Desc,AllowComma)
{
	var tmpVal='';
	var FieldArray=new Array();
	var DescArray=new Array();
	var tmp=0;
	var tmpMsg='';
	// Create array for Field list
	tmpVal=Fields;
	do
	{
		tmp=tmpVal.indexOf('|');
		if (tmp == -1)
		{
			if (tmpVal != '')
			{
				FieldArray[FieldArray.length]=tmpVal;
				tmpVal='';
			}
		} else {
			FieldArray[FieldArray.length]=tmpVal.substring(0,tmp);
			tmpVal=tmpVal.substring(tmp + 1);
		}
	}
	while (tmpVal != '');
	// Create array for Desc list
	tmpVal=Desc;
	do
	{
		tmp=tmpVal.indexOf('|');
		if (tmp == -1)
		{
			if (tmpVal != '')
			{
				DescArray[DescArray.length]=tmpVal;
				tmpVal='';
			}
		} else {
			DescArray[DescArray.length]=tmpVal.substring(0,tmp);
			tmpVal=tmpVal.substring(tmp + 1);
		}
	}
	while (tmpVal != '');
	// Check to see if passed strings are of equal length
	if (FieldArray.length != DescArray.length)
	{
		alert('Fatal error: ValidateFloat - Passed lists do not have the same length');
		return false;
	}
	// Validate fields
	for (i=0; i<FieldArray.length;i++)
	{
		tmpMsg='';
		eval('tmpVal=thisform.' + FieldArray[i] + '.value');
		if (!ValFloat(tmpVal,AllowComma))
		{
			if (AllowComma != 1 && tmpVal.indexOf(',') != -1) tmpMsg=' without commas';
			alert(DescArray[i] + ' must be a numeric value' + tmpMsg + '.');
			eval('thisform.' + FieldArray[i] + '.focus()')
			return false;
		}
	}
	return true;
}





function ValInt(ObjectValue,AllowComma)
{
	// Used internally by VaidateInteger

	//Returns true if value is a number or is NULL
	//otherwise returns false	
	
	if (ObjectValue.length == 0) return true;
	
	//Returns true if value is an integer defined as
	//   having an optional leading + or -.
	//   otherwise containing only the characters 0-9.
	var decimal_format = ".";
	var check_char;
	
	//The first character can be + -  blank or a digit.
	check_char = ObjectValue.indexOf(decimal_format)
	//Was it a decimal?
	if (check_char < 1) return ValFloat(ObjectValue,AllowComma); else return false;
}

function ValFloat(ObjectValue,AllowComma)
{
	// Used Internally by ValidateInt, ValidateFloat

	//Returns true if value is a number or is NULL
	//otherwise returns false	
	
	if (ObjectValue.length == 0) return true;
	
	//Returns true if value is a number defined as
	//   having an optional leading + or -.
	//   having at most 1 decimal point.
	//   otherwise containing only the characters 0-9.
	var start_format = " .+-0123456789";
	var number_format = " .0123456789";
	if (AllowComma == 1) number_format=number_format + ',';
	var check_char;
	var decimal = false;
	var trailing_blank = false;
	var digits = false;
	
	//The first character can be + - .  blank or a digit.
	check_char = start_format.indexOf(ObjectValue.charAt(0))
	//Was it a decimal?
	if (check_char == 1)
		decimal = true;
	else if (check_char < 1)
		return false;
	
	//Remaining characters can be only . or a digit, but only one decimal.
	for (var i = 1; i < ObjectValue.length; i++)
	{
		check_char = number_format.indexOf(ObjectValue.charAt(i))
		if (check_char < 0)
			return false;
		else if (check_char == 1)
		{
			if (decimal)		// Second decimal.
				return false;
			else
				decimal = true;
		}
		else if (check_char == 0)
		{
			if (decimal || digits) trailing_blank = true;
			// ignore leading blanks
		}
		else if (trailing_blank)
			return false;
		else
			digits = true;
	}	
	//All tests passed, so...
	return true
}
function SubmitForm()
{
	if (!ValidateIntegerFields(document.Test,'Integer','Integer Field',false,false)) return false;
	if (!ValidateIntegerFields(document.Test,'IntegerNeg','Integer Field with negative values allowed',false,true)) return false;
	if (!ValidateIntegerFields(document.Test,'IntegerComma','Integer Field with commas allowed',true,false)) return false;

	if (!ValidateFloatFields(document.Test,'Float','Float Field',false,false)) return false;
	if (!ValidateFloatFields(document.Test,'FloatComma','Float Field with commas allowed',true,false)) return false;
	alert('All is okay!');
}
