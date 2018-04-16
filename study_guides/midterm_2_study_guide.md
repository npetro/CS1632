# CS 1632 Midterm 2 Study Guide
SPRING 2018

The second midterm is MONDAY 16 APR (for Mon/Wed classes) or TUESDAY 17 APR (for Tue/Thu classes).

Note that the second midterm is _not_ cumulative, except in the sense that the topics covered in the second half of the semester depend upon understanding of the more fundamental concepts taught in the beginning of the course.

## WEB TESTING
* Be able to explain how you would test a web page with Katalon
* You should know basic Selenese (Katalon/Selenium scripting language), e.g.
	* **Commands: Open, Click, Type, Assert**
	* **Targets: Webpage Elements**
	* **Values: What to expect of the Elements or Command**
	* **On Exam:**
		* Opening a URL
		* Clicking on a link
		* Testing for text
* You will not need to know about specifying target selection, but do need to know what target selection is and recognize it (i.e. if I show you a webpage, I will note specific target values for different elements - you will not need to read raw HTML)
  
## PROPERTY-BASED TESTING
* Be able to write simple property-based tests with Rantly

```ruby
  #Calculating the cost to buy a stock should always
  #result in a positive result (>0).

  def test_cost_always_positive
  property_of {
    share_price = float
    num_shares = integer
    [share_price, num_shares]
  }.check { |share_price, num_shares|
    value = @market.calculate_cost(share_price, num_shares)
    assert value > 0
  }
  end
  
  #Generating an initial value of a stock should always
  #create a stock value of between $1.00 and $30.00
  #(inclusive)
  
  def test_starting_price_in_correct_range
    property_of {
      integer
    }.check { |seed|
      initial_price = @market.initial_price(seed)
      assert initial_price >= 1.0 && initial_price <= 30.0
    }    
  end

  #The price of a stock should always result in a Numeric
  #value.  If a stock doesn't exist, should return -1, which
  #is still a Numeric

  def test_price_always_numeric
    property_of {
      string
    }.check { |name|
      assert_kind_of Numeric, @market.price(name)
    }
  end

  
  #After iteration, the values of the stock market should
  #always be positive (there should never be a negative-value
  #stock)
  #Note - this is going to be a little more difficult
  #because of the statefulness; luckily you have an
  #access to the prices hash.
  def test_stock_price_always_positive
    property_of {
      integer
    }.check { |seed|
      # set all prices to 0.01
      @market.prices.each { |k,v|
        @market.prices[k] = 0.01
      }
      @market.iterate(seed)
      @market.prices.each { |k,v|
        assert v >= 0
      }
    }
    
  end
  ```
* Be able to name invariants given a function and sample input/output
	* **Invariants: the properties of the allowed input and that the output should always hold**
* Be able to show how invariants are broken
	* **When an output for an allowed input does not uphold the specified properties required by the invariants**
* Understand what shrinking is and be able to shrink an input given an error
	* **Break the input in half and test both halves individually, continue breaking the failing inputs into smaller and smaller chunks until they pass or fail. If they pass, work your way back up until you find the smallest failing input, if the base case fails, then use that as a starting point for analysis**
* For what kinds of functions is property-based testing useful?  For what kinds is it less useful?
	* **Useful:**
		* Mathematical functions
		* Pure functions
		* Well-specified problems
		* Variety of inputs map to certain outputs
	* **Less Useful:**
		* Writing to a file
		* Communicating over a network
		* Displaying text or graphics
		* Impure functions in general

## STATIC ANALYSIS
* Understand static vs dynamic testing 
	* **Static: is where the code is not executed**
	* **Dynamic: is where the code is executed**
* Understand limitations of static testing
	* **Limitations of static testing usually are surrounding the fact that no matter how good a program is at analyzing code, there will always be things that are missed based on what compiler is used or just interactions that will result in unexpected outcomes when the program is run dynamically**
* Know different kinds of static analysis, and tools and methods used 
	* **Linters: automated way of checking format and style of code**
	* **Bug finders: try to find bugs without running code -- a lot of false positives!**
	* **Code coverage: lets you see where more tests are needed and where tests are missing, but does not tell you if tests are valid, only that they will be executed.**
		* **Types:**
			* method
			* statement
			* branch
			* condition
			* decision
			* parameter value
			* path
			* state
			* entry/exit
			* JJ-path
	* **Code metrics: cyclomatic complexity and others**
	* **Code reviews**
	* **Formal verfication: Mathematically prove the behavior of a program from first principles**
	* **Compilers: can check syntax, uncaught exceptions, dead code, etc.**
* You do NOT need to know specific Rubocop/Reek errors, but should understand what they do and what they might catch or not
	* **Might catch: silly and simple errors, style deficiencies, and syntax errors**
	* **Might not: declaration, method, sanitization, etc. (pretty much anything dynamic)**
* Understand code coverage and be able to calculate
	* **See Below**
* Understand difference between statement and method coverage
	* **Statement: percentage of the statements that have been covered (typically what people mean when referring to code coverage even though its really a type of code coverage)**
	* **Method: percentage of the methods that have been covered, says nothing about within the methods** 

## INTERACTING WITH STAKEHOLDERS
* Be able to name some stakeholders and what is important to them
	* **Upper management (financials): How does this impact the financials of the product?**
	* **Project management (deadlines): How does this impact the scope or timeline of the project?**
	* **Developers (technology):**
	* **Users: How does this impact the functionality important to me?**
	* **Customers: How does this impact what I'm getting or how much I'm paying?**
* Be prepared for some "fake" interaction with various stakeholders
	* **"Fake" interaction is basically when the interaction is fake**
* Be able to put together a red-yellow-green template report
	* **Red: system or subsystem has extremely serious issues which will almost certainly impact the timeline or financials unless they are remediated**
	* **Yellow: there are some warning flags, but they can be dealt with, some outside help may be necessary**
	* **Green: everything is A-OK, or there are only minor issues**

## TESTING STRATEGY
* Understand the testing pyramid
	* **10% UI: tests that check the entire system**
	* **20% Service Tests**
	* **70% Unit Tests**
* Understand common anti-patterns (ice cream cone, cupcake)
	* **Ice Cream Cone:**
		* Lots of UI tests
		* Some Service tests
		* Few Unit tests
	* **Cupcake:**
		* Lots of Manual testing
		* More UI tests
		* Some Service tests
		* Less Unit tests
* Given a description of a program, be able to develop your own testing strategy
	* **Priorities of application**
	* **Where would defects be the worst?**
	* **What are likely issues?**
	* **What are issues of similar applications?**
	* **What testing tools would be useful?**
	* **What is our team dynamic? Do we need outside help?**

## SECURITY TESTING
* The CIA/InfoSec Triad
	* **Confidentiality: no unauthorized users may read data**
	* **Integrity: no unauthorized users may write data**
	* **Availability: system is available for authorized parties to read from and write to**
* Terminology: 
	* **Passive: do not modify the system in any way**
		* Eavesdropping
		* Monitoring
		* Traffic Analysis
	* **Active: modify the system in some way**
		* Log in as a different user
		* Fill up database with garbage data
		* Modify bank account information
	* **Vulnerability: identified weakness of a system**
	* **Exploit (aka "sploit"): technique or mechanism used to compromise a system using a vulnerability**
* Terminology: 
	* **Interruption: attack on availability (eg. DDoS, pulling plug from switch)**
	* **Interception: attack on confidentiality (eg. eavesdropping, keylogger)**
	* **Modification: attack on integrity (eg. modifying or deleting data)**
	* **Fabrication: attack on integrity (eg. making up or inserting data)**
* Be able to describe/test for common attacks: 
	* **Injection: inserting executable code when the application asks for input**
		* **How:**
		* Is possible when the application doesn't sanitize inputs
	* **Broken authentication: when one user pretends to be another**
		* **How:**
		* Guess or crack passwords
		* "Password reset
		* Unencrypted session IDs
	* **Cross-Site Scripting (XSS): get a third party to execute code on their system**
		* **How:**
		* Similar to injection attack, but with an intermediary
		* Scripting code injected with HTML
	* **Insecure storage: secure data is stored in an unsafe way**
		* **How:**
		* Credit card numbers being stored in a /tmp or logging directory as part of all logging transactions
	* **Buffer overruns: trying to read or write more data than a buffer supposedly has access to - reading or writing past the end of a buffer**
		* **How:**
		* This is what heartbleed was (see heartbleed.c in sample_code)
	* **Security misconfiguration: you have proper security, its just not set up correctly**
		* **How:**
		* Default Passwords
		* IPS, packet filtering, etc. not running
		* Insecure machine on secure network
	* **Insecure object references: someone can access soemthing by knowing where it is, despite not having proper security credentials**
	* **Social engineering: manipulating people socially to gain access to information those people know**
* How does security testing differ from other kinds of testing?
	* **Security testing differs from other kinds of testing because security testing is trying to close all doors, but only one door left open will fail security testing, however bugs in other types of testing are almost inevitable and are still okay**
