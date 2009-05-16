package { public class MyTestSuite extends TestSuite {} }

TEST_CASE(MyTestSuite, TestCaseOne);
class TestCaseOne extends TestCase
{
  override public function setUp():void
  {
  }

  public function testOne():void
  {
  }
}

TEST_CASE(MyTestSuite, TestCaseTwo);
class TestCaseTwo extends TestCase
{
  override public function setUp():void
  {
  }

  public function testOne():void
  {
  }
}

// Not properly registered
class MyClass
{
}