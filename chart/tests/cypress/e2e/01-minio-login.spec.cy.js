describe('Minio Login', function() {
  it('Check Minio Login', function() {
    let retries = 5; // Number of retry attempts
    let retryDelay = 10000; // Delay in milliseconds between retries

    function visitWithRetry() {
      cy.request({
        url: Cypress.env('url'),
        failOnStatusCode: false, // Allow non-2xx status codes
      }).then((response) => {
        if (response.status === 200) {
          // Service is available, proceed with the login
          cy.visit(Cypress.env('url'));
          cy.get('input[id="accessKey"]').type(Cypress.env('accesskey'), { delay: 0 });
          cy.get('input[id="secretKey"]').type(Cypress.env('secretkey'), { delay: 0 });
          cy.get('form').submit();
          cy.title().should('eq', 'MinIO Console');
          cy.contains('Buckets').should('be.visible');
        } else {
          if (retries > 0) {
            retries--;
            cy.wait(retryDelay); // Wait before retrying
            visitWithRetry(); // Retry the request
          } else {
            throw new Error('Service is unavailable after multiple retries.');
          }
        }
      });
    }

    visitWithRetry(); // Start the retry logic
  });
});