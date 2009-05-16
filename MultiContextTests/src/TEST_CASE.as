package
{
  public function TEST_CASE(suite:Class, testCase:Class):void
  {
    if (!TestSuite.testCases[suite])
    {
      TestSuite.testCases[suite] = [testCase];
    }
    else
    {
      TestSuite.testCases[suite].push(testCase);
    }
  }
}