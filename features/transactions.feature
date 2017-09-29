@insulated

Feature: Behavior transaction on Buka lapak is successful

  Scenario: Head hunter login to Qareer adaptive witlsh Linkedin account
    Given I am on the transaction success page with id '01023A9AC'
    Then I should see "01023A9AC" in the "transaction_id" element
    And I should see "FURHAN" in the "seller_name" element
    And I should see "REX" in the "delivery_service" element
    And I should see "21/08/2016" in the "date_order" element
    And I should see "JALAN GURNEY" in the "address_shipment" element




# secenario result

#    Given I am on the transaction success page with id '01023A9AC' (success)
#    Then I should see "01023A9AC" in the "transaction_id" element (success)
#    And I should see "FURHAN" in the "seller_name" element (success)
#    And I should see "REX" in the "delivery_service" element (failed)
#    And I should see "21/08/2016" in the "date_order" element (success)
#    And I should see "JALAN GURNEY" in the "address_shipment" element (failed)
