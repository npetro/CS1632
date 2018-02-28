# CS 1632 Midterm 1 Exam Study Guide - Spring 2018

The midterm is on 28 FEB 2018 (M/W classes) or 1 MAR (T/H class).

The midterm will cover everything we have covered up to the exerise the class before.  I recommend you review the slides and the textbook (see syllabus.md for reminders of which chapters were required reading).

Here are the key topics to study in preparation for the test.

## TESTING THEORY AND TERMINOLOGY
* Equivalence class partitioning - __natrual grouping of values with similar behavior or belonging to the same category__
* Boundary and interior values - __interior values fall within the acceptable range and boundary values sit on the bounds of the expected input range(s) *[don't forget implicit boundary values!]*__
* Base, Edge, and Corner cases
    * __*Base* cases are interior values or expected use cases__
    * __*Edge* cases are boundary values or unexpected use cases__ 
    * __*Corner* cases are multiple edge cases or things that occur outside of normal operating parameters.__
* Static vs Dynamic testing
    * Know the differences and examples of each
    * __*Static* is when code is not executed - Walkthroughs, reviews, analysis__
    * __*Dynamic* is when code is executed - Observed vs. Expected__
* Black/White/Grey box testing
    * Know the differences and examples of each
    * __*Black* box testing is performed with no knowledge of the interior structure of the code and are often performed from the user's perspective__
    * __*White* box testing is performed with explicit knowledge of the interior structure of the code and directly testing that code often at a low level__
    * __*Grey* box testing is performed with knowledge of the interior codebase but not directly testing the code. Tests are similar to black box but informed by the knowledge about the codebase__

## REQUIREMENTS ANALYSIS
* What makes a good or bad requirement? - __3 main things:__
* Testability - requirements must be:
    * __Complete - Requirements should cover all aspects of a system__
    * __Consistent - Requirements must be internally and externally consistent__
    * __Unambiguous - No generic values__
    * __Quantitative - No qualitative attributes__
    * __Feasible - No test cases over 4,000 years, etc__
* Functional vs Non-Functional Requirements  (Quality Attributes)
    * Be able to define and write your own
    * __Functional (shall do) - specifies the functional behavior of the system__
    * __Non-functional (should be) - specifies the overall qualities of the system. These are subjective and therefore must be agreed upon with stakeholders. It is easy for contradictions to arise.__
        ######*Qualitative* - *to Quantitative*
        * Reliability - mean time between failures
        * Robustness - amount of time to restart
        * Usability - amount of time for training
        * Accessability
        * Performance - transactions per second, response time
        * Safety - # accidents per year
        * Supportability
        * Security
* Traceability Matrices
    * Be able to define and write your own
    * __Simply a list of requirements and their associated test cases (at least 3 per)__

REQS | TESTS   
--- | --- 
__LOGIN_REQ__ | good-login-test, bad-login-test, three-error-test 
__DATABASE_REQ__ | valid-query-test, invalid-query-test, db-down-test
__LOGIN_SCREEN_REQ__ | low-bandwidth-test, high-bandwidth-test
__CALC_REQ__ | add1-test, add2-test, add3-test, subtract1-test


## TEST PLANS
* Given a list of requirements, be able to write a test plan
    1. __What is a good way to divide the system into features for test plans?__
    2. __What aspects of the feature do I want to test?__
    3. __What test cases do I want to run for each aspect?__
        * Equivalence classes
        * Success/Failure cases
        * Edge and corner cases
    4. __How deep should I go down?__
    5. __Have independent and reproducible test cases!__
* Terminology: test cases, test plans, test suites, test runs
    * __Test Plan is a sequence of test cases__
    * __Test Case is the fundamental unit of the test plan consisting of:__
        * Identifier (optional)
        * Preconditions
        * Execution Steps
        * Postconditions
    * __Test Suite is a collection of test plans__
    * __Test Run is an actual run through of test-plan or test-suite__
        * Results: [PASSED, FAILED, PAUSED, RUNNING, BLOCKED, ERROR]
* Verification vs validation
    * __*Verification* is if we built the software right__
    * __*Validation* is if we built the right software__

## DEFECT REPORTING
* Be prepared to report a defect based on a test case
    * __*Defect* - some condition in a system that violates a requirement, violates end user expectation, causes program to malfuntion, or produces an incorrect result.__
        * Compiler Broken
        * Bad Hardware
        * Broken Operating System
        * Gamma Rays from Space
* Remember the defect template:
    * __SUMMARY - a succinct one-sentence description of the problem__
    * __DESCRIPTION - a more detailed explaination of the problem__
    * __REPRODUCTION STEPS - exact sequence of steps needed to reproduce the problem__
    * __EXPECTED BEHAVIOR - what you should see__
    * __OBSERVED BEHAVIOR - wht you do see__
    * Optionally: __SEVERITY/IMPACT, NOTES__
    * Levels of severity: __BLOCKER, CRITICAL, MAJOR, NORMAL, MINOR, TRIVIAL__
* Coding mistakes vs defects
    * __A defect is something that impacts the functionality of the program, bad code does not necessarily mean it is a defect as it is not always visible to the user__

## Smoke, Exploratory, and Path-based testing
* Define all of these concepts
    * __Exploratory testing - testing without a specific test plan, in which the goals are both to learn more about the system and to find defects/enhancements__
    * __Smoke testing - doing minimal testing to ensure that the system is testable or ready to be released (as a MVP). Can be *SCRIPTED* or *UNSCRIPTED* - either is used as a *GATEWAY* to creating and executing a full test plan__
    * __Path-Based testing - determine all possible paths through program, then test all of the paths. Complexity for this kind of testing increases superlinearly as we add variables/modes__
* I will not ask you to calculate cyclomatic complexity for a given method but I expect you to understand the concept and explain why a method with a higher or lower complexity might be easier/harder to test and why

#####<span style="color: #cd2c5a;">__SEE LECTURE 5 SLIDES 30-40 for cyclomatic complexity__</span>

## AUTOMATED TESTING
* Pros and cons of automated 
    * __PROS:__
        * 
* Unit tests vs system/acceptance/integration tests

## UNIT TESTING
* Unit tests
  * Pay special attention to assertions
  * Understand how to write a Minitest unit test (basic syntax)
  * Understand how to make a double
  * Understand how to make a mock
  * Understand how to make a stub
* Understand difference between mock, double, stub
* Given some Ruby code, be able to perform an equivalence class partitioning and write tests for it

## BREAKING SOFTWARE
* Be prepared to think of happy path vs edge case testing
* What are various ways that software can break?
    * __Unexpected input__
    * __Malicious users__
    * __Systems going down__
    * __When you are off in the wilderness__
* Commmon Errors:
    * __Logic Errors - errors in logic__
    * __Off-by-one Errors - found in loops and data structures__
    * __Floating point errors__
    * __Integration errors - errors at boundaries between systems__
    * __Errors of assumption - incorrect assumptions made by programmers__
    * __Missing Data errors - necessary data is missing__
    * __Bad data errors - system cannot handle invalid data__
    * __Display Errors - value != what is displayed__
    * __Null pointer error - program dereferences a null pointer__
    * __I/O error - system encounters an unexpected state of external I/O__
    * __Configuration Error - system is improperly configured__
    * __And more...__
        * Accessability errors
        * Domain-specific errors
        * Version mismatch errors
        * Distributed system errors
        * Logging Errors
        * Interface Errors
        * Regulatory or Legal Errors

#<span style="color: #cd2c5a;"> TODO </span>

## TDD
* Basic concepts of test-first development
* The red-green-refactor loop
* Benefits and drawbacks of TDD
  * When to use it?
  * When not to use it?

## WRITING TESTABLE CODE
* What do we mean by "testable code"?
* Basic strategies for testable code
* Code segmentation
* "Give yourself something to test"
* Pure vs impure methods - be prepared to define and/or determine if a method is pure
* The DRY Principle
* Understand seams

## Pairwise and Combinatorial testing
* Understand concepts, be able to define
* I will not make you create your own pairwise tests BUT you may be asked to determine if something is a valid pairwise or combinatorial test (i.e., checks all possible t-way interactions)

## PERFORMANCE TESTING
* Understand concepts on how to test performance
* Be able to write test plans for different performance indicators and systems
* Terminology: Service-Oriented vs Efficiency-Oriented Indicators
* Availability, Response Time, Throughput, Utilization
* Performance targets, performance thresholds, KPIs - understand and be able to generate!
* Measuring response time - methodologies
* Understand different concepts of time: user, system, total, real
* Measuring availability, concurrency, scalability, throughput
* Understand n 9's (e.g., 5 9s vs 6 9s)
* Load testing - baseline, soak/stability, stress tests
