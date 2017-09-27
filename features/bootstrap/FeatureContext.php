<?php

use Behat\MinkExtension\Context\MinkContext;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends MinkContext
{
    /**
     * @When /^I am on the transaction success page with id \'([^\']*)\'$/
     */
    public function iAmOnTheTransactionSuccessPageWithId($arg1)
    {
        $this->getSession()->visit("https://www.bukalapak.com/transaction/$arg1");
    }
}
