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
        ####*Qualitative* - *to Quantitative*
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
    * __CONTROL FLOW:__
        * __E - number of edges in the graph__
        * __N - number of nodes__
        * __p - number of connected components (usually 1)__
        * __Cyclomatic Complexity = E - N + 2p__
        * __also equal to the number of possible paths through a method__
    * __HOW TO:__
        1. __Create graph__
        2. __Count all variables above__
        3. __Calculate complexity__
    * __MEASURING__
        * __< 10 = very simple, low risk__
        * __> 50 = very complex, high risk__

## AUTOMATED TESTING
* Pros and cons of automated 
    * __PROS:__
        * __No chance for human error during execution__
        * __Fast test execution__
        * __Easy to execute once set up__
        * __Less resource intensive during testing__
        * __Ideal for testing some things that manual testing is bad for__
    * __CONS:__
        * __Requires extra time up front__
        * __May not catch user facing bugs__
        * __Requires learning tools and frameworks__
        * __Requires more skilled staff__
        * __Big Issue: *IT ONLY TESTS WHAT IT IS LOOKING FOR*__
* Unit tests vs system/acceptance/integration tests
    * __*Unit Testing* - a kind of automated testing involving taking the smallest coherent "units" of code such as functions, methods, or classes and doing white-box testing to ensure their functionality at the lowest level (very localized).__
    * __*System Testing* - Testing the functionality of the system as a whole__
    * __*Acceptance Testing* - Testing against the requirements for acceptance__
    * __*Integration Testing* - Testing during integration of two sections of code, they typically have dependencies on each other__

## UNIT TESTING
* Unit tests - __Independent (ie. no external dependencies is key)__
    * Pay special attention to assertions
        * __`assert_true` the result must be true or `refute_true`__
        * __`assert_equal(s)` the result must equal exactly or `refute_equal(s)`__
        * __`assert_includes` the result must include or `refute_includes`__
        * __`assert_instance_of` the result must be an instance of__
        * __`assert_nil` the result must be nil or `refute_nil`__
        * __`assert_raises` the result must raise exactly that or `refute_raises`__
    * Understand how to write a Minitest unit test (basic syntax)__
        * __(optional) Set up code__
        * __Preconditions__
        * __Execution Steps__
        * __Postconditions (aka Asserts, Shoulds, Musts)__
        * __(optional) Tear down code__
        * <span style="color: #cd2c5a;">See Example Below...</span>
* Understand how to make a double
```ruby
# Sometimes, though, a dummy isn't enough, because we need a real
# object of the right class there.  This is where we can use a
# test double with a stub.
# This allows us to bypass any issues in the doubled class.
# Even if id on node does not work, graph - the
# actual code under test - can still be tested!
# Create a double (many frameworks - including Minitest do not
# make a big differentiation between mocks and doubles.  But
# remember - a true mock is a subclass of test double which
# does verification ("expects" calls)
#
def test_add_node_double
  # Make a mock named "node"
  # This can be named anything you want
  n = Minitest::Mock.new("test_node")
  # Define a  method specifically for this object - this
  # method definition does NOT impact the class "Node"!
  def n.id; 1; end
  # Add node to graph.  When .id is called on n in the Graph
  # .add_node method, it will actually call our stub
  @g.add_node n
  # Assert 
  assert_equal 1, @g.num_nodes
end 
```
    * Understand how to make a mock
```ruby
# We may also want to verify that id gets called.
# This is where we can use a mock.
# A mock is a double which verifies that a method
# is called a certain number of times.
#
def test_add_node_mock
  # If you comment out the .id reference in
  # graph.add_node, this will fail
  mocked_node = Minitest::Mock.new("mocked node")
  # Expect id to be called and make a stub
  # which just returns new, similar to:
  # def mocked_node.id; true; end
  mocked_node.expect :id, true
  mocked_node.expect :id, true
  @g.add_node mocked_node
  assert_mock mocked_node
end
```
    * Understand how to make a stub
```ruby
def n.id; 1; end
# Add node to graph.  When .id is called on n in the Graph
# .add_node method, it will actually call our stub
@g.add_node n
```

* Understand difference between mock, double, stub
    * __*Double* - "fake objects" you can use in your test. They can behave however you want them to, even differently than their "real" counterpart.__
    * __*Stubs* - "fake methods" that can be told to do whatever when called upon, usually this is just returning a value the real method call should return.__
    * __*Mock* - a test double that uses verification - verification is ensuring that a method has been called a certain number of times, essentially it is an assertion on the execution of the code, not the result like most tests.__
* Given some Ruby code, be able to perform an equivalence class partitioning and write tests for it - __<span style="color: #cd2c5a;">See Example Below...</span>__

#### Minitest Unit Test Example

this would be the code to test in `locations.rb`

```ruby
class Locations
  attr_accessor :locations

  def initialize
    #Create Locations
    dt = Location.new("Downtown")
    ho = Location.new("Hospital")
    hi = Location.new("Hillman")
    ca = Location.new("Cathedral")
    mu = Location.new("Museum")
    mo = Location.new("Monroeville")

    #Establish Connections
    ho.nodes = [hi,ca]
    hi.nodes = [dt,ho]
    ca.nodes = [mo,mu]
    mu.nodes = [ca,hi]

    #Put in array
    @locations = [ho,hi,ca,mu,mo,dt]
  end
end
```

and this would be the minitest code to test it in `locations_test.rb`

```ruby
require 'minitest/autorun'
require './locations.rb'

class TestLocations < Minitest::Test

  def setup
    @test_locations = Locations.new()
  end

  # UNIT TESTS FOR METHOD initialize()
  # Equivalence classes:
  # new() -> creates locations array with all 6 locations
  # locations = [6] -> not 0
  # locations = [6] -> locations.count returns 6
  # locations = [6] -> locations.count does not return 7

  # If the initialization worked, should not be 0
  def test_number_of_roads_not_zero
    refute_equal 0, @test_locations.locations.count
  end

  # If the initialization worked, should be 6 locations in the array
  def test_number_of_roads
    assert_equal 6, @test_locations.locations.count
  end

  # If the initialization worked, should not have 7 locations in the array
  def test_not_number_of_roads
    refute_equal 7, @test_locations.locations.count
  end

  # UNIT TESTS FOR METHOD initialize()
  # Equivalence classes:
  # new() -> creates roads array with all 4 roads
  # locations contains Hospital -> test_locations.locations includes Hospital
  # locations does not contain Benedum -> test_locations.locations does not include Benedum

  # If the initialization worked, locations[] should include Hospital
  def test_roads_includes_hospital
    assert_includes "Hospital", @test_locations.locations[0].name
  end

  # If the initialization worked, locations[] should not inlcude Benedum
  def test_roads_doesnt_include_bendum
    refute_includes "Benedum", @test_locations.locations[2].name
  end

  # UNIT TESTS FOR METHOD initialize()
  # Equivalence classes:
  # new() -> creates locations array with all 6 locations
  # ho.nodes -> ho.nodes returns 2 nodes
  # ho.nodes -> ho.nodes returns not 3 nodes
  # ho.nodes -> ho.nodes returns the two nodes specified to be connected to the hospital

  # If the initialization worked, ho.nodes[] should have 2 nodes
  def test_number_of_nodes_on_hospital
    assert_equal 2, @test_locations.locations[0].nodes.count
  end

  # If the initialization worked, ho.nodes[] should not have 3 nodes
  # EDGE CASE
  def test_number_of_nodes_on_hospital
    refute_equal 3, @test_locations.locations[0].nodes.count
  end

  # If the initialization worked, ho.nodes[] should have these 2 nodes
  def test_correct_nodes_for_hospital
    assert_equal [@test_locations.locations[1],@test_locations.locations[2]], @test_locations.locations[0].nodes
  end
end
```

## BREAKING SOFTWARE
* Be prepared to think of happy path vs edge case testing
    * __Happy path is optimally the way the user would use the software, edge case testing involves when the user does not, particularly doing thing on the edges of what the software wants as inputs__
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

## TDD
* Basic concepts of test-first development
    * __Writing tests BEFORE writing code__
    * __Writing ONLY code that is tested__
    * __Writing ONLY tests that test the code__
    * __A very short turnaround cycle__
    * __Refactoring early and often__
    * __Steps:__
        1. Write a test - for a small unit of functionality
        2. Run test suite - run all tests, only new test should fail
        3. Write the code - just enough code for the test to pass
        4. Re-run the test suite - all tests should now pass
        5. Check test results - if anything fails, fix it, never move on beforehand
        6. Refactor - first attempt might not work, functionality is more important than it looking good.
        7. Re-run test suite - ensure refactoring didn't cause any problems
        8. Check test results - fix anything that isn't working
        9. Done!
* The red-green-refactor loop
    * __*RED* - Write test for new functionality__
    * __*GREEN* - Write only enough code to make the test pass__
    * __*REFACTOR* - Review code and make it better__
* Benefits and drawbacks of TDD
    * When to use it?
        * __Automatically create tests__
        * __Makes writing tests easy because its done often__
        * __Tests are relevant__
        * __Developer is focused on end result, not code__
        * __Ensures you take small steps__
        * __Code is extensible__
        * __Large test suite automatically created for you__
        * __Confidence in codebase__
    * When not to use it?
        * __Focus on unit tests may mean other aspects of testing get short shrift__
        * __Extra up-front time__
        * __May not be appropriate for prototyping__
        * __Hard to do large architectural changes__
        * __Complex or mission/life-critical systems will require a more robust testing strategy__
        * __Tests become part of the overhead of the project__
        * __Could fall into trap of overtesting__
        * __Can be difficult to implement TDD on existing projects developed in a different program__

## WRITING TESTABLE CODE
* What do we mean by "testable code"?
    * __Code for which it is easy to write and perform tests, automated and manual, at various levels of abstraction, and track down errors when tests fail.__
* Basic strategies for testable code
    * __Segment code - make it modular__
    * __Give yourself something to test__
    * __Make it repeatable__
    * __DRY (dont repeat yourself)__
    * __Write code with seams__
* Code segmentation
    * __Methods should be small and specific - "Do one thing and do it well"__
* "Give yourself something to test"
    * __Return values are worth their weight in gold, easy to assert against__
* Pure vs impure methods - be prepared to define and/or determine if a method is pure
    * __*PURE* - output only depends on input, do nothing else except return a value (no side effects)__
    * __*IMPURE* - results depend on other things than arguements, has side effects, not deterministic, etc__
* The DRY Principle
    * __DONT REPEAT YOURSELF - don't copy and paste code, don't have two similar methods, try to have generic methods that can be used in multiple places__
* Understand seams
    * __*SEAMS* - where behavior can be modified without changing code__
    * __Favor arguments to methods over instance variables or internally generated objects__

## Pairwise and Combinatorial testing
* Understand concepts, be able to define
    * __*PAIRWISE* - testing all pairs of values (ie. 2-way combinatorix)__
    * __*COMBINATORIAL* - testing all of n-way combinations of values__
    * __Covering Arrays - arrays that cover all possible combinations for a selected # of interactions (#-way) found by writing out all possible combinations and marking certain rows as "Tests to be executed". These tests form the covering array.__
    * __Key Ideas:__
        * __50-90% of defects often come from one to two way interactions__
        * __6-way interactions are the max found to cause defects no matter the number of variables (n)__
        * __Relationship of # tests to freedom of defects is asymptotic NOT linear__
* I will not make you create your own pairwise tests BUT you may be asked to determine if something is a valid pairwise or combinatorial test (i.e., checks all possible t-way interactions)

## PERFORMANCE TESTING
* Understand concepts on how to test performance
* Be able to write test plans for different performance indicators and systems
* Terminology: Service-Oriented vs Efficiency-Oriented Indicators
    * __Service-Oriented - measure how well a system is providing a service to the users__
    * __Efficiency-Oriented - measure how well the system makes use of the computational resources available to it__
* Availability, Response Time, Throughput, Utilization
    * __*SERVICE* - Availability (% of time accessible), Response Time (Quickness of response to user input)__
    * __*EFFICIENCY* - Throughput (# events / processing time), Utilization (% resources consumed)__
* Performance targets, performance thresholds, KPIs - understand and be able to generate!
    * __targets - quantitative values for performance indicators to reach__
    * __thresholds - absolute minimum performace level requirements__
    * __KPIs - (key performance indicators) the most important performance indicators__
* Measuring response time - methodologies
    * __MAC - `time`__
    * __WINDOWS - measure command `-wait`__
* Understand different concepts of time: user, system, total, real
    * __*USER* - amount of time user code executes__
    * __*SYSTEM* - amount of time kernel code executes__
    * __*TOTAL* - user time + system time__
    * __*REAL* - wall clock time taken__
* Measuring availability, concurrency, scalability, throughput
    * __Requires Tools__
        * __OSX: activity monitor, top__
        * __WINDOWS: task manager, perfmon__
        * __UNIX: top, iostat, sar__
    * __Resources to watch:__
        * __CPU USAGE__
        * __THREADS__
        * __MEMORY__
        * __VIRTUAL MEMORY__
        * __DISK I/O__
        * __NETWORK I/O__
* Understand n 9's (e.g., 5 9s vs 6 9s)
    * __UPTIME (%)__
    * __More 9's = significantly less down time per year__
* Load testing - baseline, soak/stability, stress tests
    * __LOAD - how many concurrent users/work can the system handle__
        * __BASELINE - base minimum amount of use__
        * __SOAK / STABILITY - leave it running for an extended period of time, usually at low usage levels__
        * __STRESS - high levels of activity__
