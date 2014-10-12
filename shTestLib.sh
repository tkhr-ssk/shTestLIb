NUM_OF_ERR=0
NUM_OF_TEST=0

checkKeyWordinFile()
{
   local FILE=$1
   local KEYWORD=$2
   echo "=== CHECK $KEYWORD in $FILE ==="
   test -f $FILE && grep $KEYWORD $FILE \
     && (echo "=== TEST SUCCEED $KEYWORD in $FILE ==="; ) \
     || (echo "=== TEST FAILURE $KEYWORD in $FILE ==="; return 1; )
   local RESULT=$?
   NUM_OF_TEST=`expr ${NUM_OF_TEST} + 1`
   NUM_OF_ERR=`expr ${NUM_OF_ERR} + ${RESULT}`
}

checkNotKeyWordinFile()
{
   local FILE=$1
   local KEYWORD=$2
   echo "=== CHECK NOT $KEYWORD in $FILE ==="
   test -f $FILE && ! grep "${KEYWORD}" $FILE \
     && (echo "=== TEST SUCCEED NOT $KEYWORD in $FILE ==="; ) \
     || (echo "=== TEST FAILURE NOT $KEYWORD in $FILE ==="; return 1; )
   local RESULT=$?
   NUM_OF_TEST=`expr ${NUM_OF_TEST} + 1`
   NUM_OF_ERR=`expr ${NUM_OF_ERR} + ${RESULT}`
}

showSummary()
{
  echo Test : ${NUM_OF_TEST} 
  echo Fail : ${NUM_OF_ERR} 
}

: <<'#__COMMENT_OUT__'

The MIT License (MIT)

Copyright (c) 2014 tkhr-ssk (Takahiro SASAKI)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

#__COMMENT_OUT__
