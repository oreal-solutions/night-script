package com.nightscript;

import java.util.List;

import org.junit.Test;

// let identifier = expression
public class LetStatementExecutorTest {

    class StubbedExpressionSolver extends ExpressionSolver {
        List<String> passedTokens;

        @Override
        public Value solve(List<String> expressionTokens, int lineNumber) {
            // TODO(Batandwa): Use an actual value
            return null;
        }
    }

    @Test
    public void shouldThrowIncompleteStatementErrorWhenThereAreLessThan4Tokens(){}

    @Test
    public void shouldThrowAnIncompleteStatementErrorWhenTheThirdTokenIsNotAnEqualSymbol(){}

    @Test
    public void shouldThrowBadIdentifierErrorWhenTheIdentifierAlreadyExistsInTheContext(){}

    @Test
    public void shouldThrowBadIdentifierErrorWhenTheIdentifierStartsWithANumber(){}

    @Test
    public void shouldThrowBadIndentifierErrorWhenTheIdentifierHasAtLeastOneSpace(){}

    @Test
    public void shouldThrowBadIndentifierErrorWhenTheIdentifierHasANonAlphaNumericCharacterThatIsNotAnUnderscore(){}

    @Test
    public void shouldNotThrowBadIdentifierErrorWhenTheIdenfierHasAnUnderscoreCharacter(){}

    @Test
    public void shouldAddTheIdentifierToTheGivenContextAndAssignItTheValueReturnedByTheGivenExpressionSolverForTheExpressionPartOfTheStatement(){};
}
