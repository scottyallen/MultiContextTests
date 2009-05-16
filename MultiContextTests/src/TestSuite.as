package
{
  import flash.display.LoaderInfo;
  import flash.utils.Dictionary;
  import flash.utils.getDefinitionByName;
  import flash.utils.getQualifiedClassName;

  import ru.etcs.utils.getDefinitionNames;

  public class TestSuite
  {
    public static var testCases:Dictionary = new Dictionary();
    public var loaderInfo:LoaderInfo;

    public function get testCases():Array
    {
      return TestSuite.testCases[getClass()];
    }

    public function verifyAllTestsAreRegistered():void
    {
      var innerClassNames:Array = getInnerClassNames();
      for (var i:int = 0; i < innerClassNames.length; i++)
      {
        if (!isRegistered(innerClassNames[i]))
        {
          throw new Error("Test case " + stripQualifiers(innerClassNames[i]) + " in test suite " +
                          this.className + " not properly registered.");
        }
      }
    }

    private function stripQualifiers(fullInnerClassName:String):String
    {
      return fullInnerClassName.substr((this.className + ".as$::").length + 1);
    }

    private function isRegistered(testCaseClassName:String):Boolean
    {
      for (var i:int = 0; i < this.testCases.length; i++)
      {
        if (getQualifiedClassName(this.testCases[i]) == testCaseClassName) { return true; }
      }
      return false;
    }

    private function getInnerClassNames():Array
    {
      var innerClassNames:Array = [];
      var classNames:Array = getDefinitionNames(loaderInfo);
      for (var i:int = 0; i < classNames.length; i++)
      {
        var className:String = classNames[i];
        if (className.indexOf(this.className + ".as$") == 0)
        {
          innerClassNames.push(className);
        }
      }
      return innerClassNames;
    }

    private function getClass():Class
    {
      return getDefinitionByName(this.className) as Class;
    }

    private function get className():String { return getQualifiedClassName(this); }
  }
}
