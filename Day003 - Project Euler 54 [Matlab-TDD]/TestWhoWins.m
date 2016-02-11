classdef TestWhoWins < matlab.unittest.TestCase
    methods (Test)
        function testHighCard_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 8C 9S JS AC'),hand('2C 5C 7D 8S QH')),1);
        end
        function testHighCard_2(testCase)
            testCase.verifyEqual(whoWins(hand('5D 8C 9S JS 3C'),hand('2C 5C 7D 8S QH')),2);
        end
        function testHighCardEquality_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 8C 9S JS QC'),hand('2C 5C 7D 8S QH')),1);
        end
        function testHighCardVsPair_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 8C 3S JS 3C'),hand('2C 5C 7D 8S QH')),1);
        end
        function testHighCardVsPair_2(testCase)
            testCase.verifyEqual(whoWins(hand('5D 8C 3S JS AC'),hand('2C 5C 8D 8S QH')),2);
        end
        function testPairVsPair_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 8C 3S JS 3C'),hand('2C 5C 8D 8S QH')),2);
        end
        function testPairVsPair_2(testCase)
            testCase.verifyEqual(whoWins(hand('5D 8C 3S AS AC'),hand('2C 5C 8D 8S QH')),1);
        end
        function testTwoPairVsPair_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 5C 3S JS 3C'),hand('2C 4C 10D 10S QH')),1);
        end
        function testTwoPairVsPair_2(testCase)
            testCase.verifyEqual(whoWins(hand('5D 8C 3S AS AC'),hand('2C 2D 8D 8S QH')),2);
        end
        function testPairVsThree_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 5C 4S 5S 3C'),hand('2C 4C 10D 10S QH')),1);
        end
        function testPairVsThree_2(testCase)
            testCase.verifyEqual(whoWins(hand('5D 8C 3S AS AC'),hand('2C 2D 2H 8S QH')),2);
        end
        function testTwoPairsVsThree_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 5C 4S 5S 3C'),hand('2C QC 10D 10S QH')),1);
        end
        function testTwoPairsVsThree_2(testCase)
            testCase.verifyEqual(whoWins(hand('KD KC 3S AS AC'),hand('2C 2D 2H 8S QH')),2);
        end
        function testStraightVsThree_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 5C 4S 5S 3C'),hand('2C 3C 6D 5S 4H')),2);
        end
        function testStraightVsThree_2(testCase)
            testCase.verifyEqual(whoWins(hand('8D 9C JS TS QC'),hand('2C 2D 2H 8S QH')),1);
        end
        function testStraightVsFlush_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 2D 4D 8D JD'),hand('2C 3C 6D 5S 4H')),1);
        end
        function testStraightVsFlush_2(testCase)
            testCase.verifyEqual(whoWins(hand('8D 9C JS TS QC'),hand('2S 3S JS 8S QS')),2);
        end
        function testFullHouseVsFlush_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 2D 4D 8D JD'),hand('2C 3C 2D 3S 3H')),2);
        end
        function testFullHouseVsFlush_2(testCase)
            testCase.verifyEqual(whoWins(hand('8D 8C JS JD JC'),hand('2S 3S JS 8S QS')),1);
        end
        function testFullHouseVsFour_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 5C 5S 5H JD'),hand('2C 3C 2D 3S 3H')),1);
        end
        function testFullHouseVsFour_2(testCase)
            testCase.verifyEqual(whoWins(hand('8D 8C JS JD JC'),hand('2D 2C 2H 2S QS')),2);
        end
        function testFourVsFour(testCase)
            testCase.verifyEqual(whoWins(hand('8D 8C 8S 8H JC'),hand('2D 2C 2H 2S QS')),1);
        end
        function testStraightFlushVsFour_1(testCase)
            testCase.verifyEqual(whoWins(hand('5D 5C 5S 5H JD'),hand('2C 3C 4C 6C 5C')),2);
        end
        function testStraightFlushVsFour_2(testCase)
            testCase.verifyEqual(whoWins(hand('8D 9D TD JD QD'),hand('2D 2C 2H 2S QS')),1);
        end
        function testStraightFlushVsStraightFlush(testCase)
            testCase.verifyEqual(whoWins(hand('8D 9D TD JD QD'),hand('2C 3C 4C 6C 5C')),1);
        end
    end
    
end