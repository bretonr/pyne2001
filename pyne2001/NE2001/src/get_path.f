C*GET_PATH -- find data file
C+
      FUNCTION GET_PATH()
      CHARACTER*(*) GET_PATH
C
C This routine encsapsulates the algorithm for finding the NE2001
C run-time data files.
C
C The input files are searched in the following in order:
C     in directory specified by NE2001_PATH
C                       (with or without '/' appended)
C     otherwise use the current directory
C
C Arguments:
C  NAME (output) : receives the file name.
C--
C  3-May-2012
C-----------------------------------------------------------------------
      CHARACTER*(*) defdir
      CHARACTER dir*255, val*255
C      PARAMETER  (defdir='input.NE2001/')
      PARAMETER  (defdir='./')
      INTEGER len, status
C
C Try to read the environment variable
C
      CALL GET_ENVIRONMENT_VARIABLE('NE2001_PATH', 
     .   val, len, status, .true.)
      IF (status.ne.0 .OR. len.eq.0) THEN
         dir = defdir
      ELSE IF (val(len:len).eq.'/') THEN
         dir = val(:len)//defdir
      ELSE
         dir = val(:len)//'/'//defdir
      END IF
C
      GET_PATH = dir
      RETURN
C-----------------------------------------------------------------------
      END FUNCTION
