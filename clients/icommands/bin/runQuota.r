# This is an example for starting the msiQuota micro-service to run
# periodically, for use with the optional quota system.  This version
# is for the new rule engine, released in iRODS 3.0.  
#
# msiQuota, via an ICAT function, executes some SQL to determine how
# much space each user in using on each resource and to set over-quota
# fields (see 'iquota', 'iadmin lq', and 'iadmin cu').  This must be
# run by an irods admin (the ICAT function that is called is
# restricted).  The msiQuota micro-service and the 'iadmin cu' command
# are equivalent.
#
#
# Set the *arg1 line to the delayExec time and frequency you'd like
# and then run 'irule -F runQuota.r'.  'iqstat' should then show your
# rule in the queue.  Example time/frequency formats are:
# <ET>2010-07-12.23:59:50</ET><EF>24h</EF>
# <PLUSET>1m</PLUSET><EF>1h</EF> 
# <PLUSET>14h</PLUSET><EF>24h</EF>
myQuotaRule {
  delay(*arg1) {
    msiQuota
  }
}
INPUT *arg1="<PLUSET>1m</PLUSET><EF>24h</EF>"
OUTPUT ruleExecOut
