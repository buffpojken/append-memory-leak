appender-test
===================

In order to trigger issue, run application with Instruments and 
track allocations for "ARandomView". While assigning to an instance-var, 
persistent allocations will increase 1/s with transient being 0 while changing to just append, 
persistent allocation will be 1 and transient will increase 1/s as expected.