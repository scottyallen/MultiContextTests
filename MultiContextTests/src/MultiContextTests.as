package
{
  import flash.display.Sprite;

  import ru.etcs.utils.getDefinitionNames;

  public class MultiContextTests extends Sprite
  {
    public function MultiContextTests()
    {
      var test:TestSuite = new MyTestSuite();
      test.loaderInfo = loaderInfo;
      trace(test.testCases.join(", "));
      test.verifyAllTestsAreRegistered();
    }
  }
}
